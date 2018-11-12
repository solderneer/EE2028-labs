/*****************************************************************************
 *   A demo example using several of the peripherals on the base board
 *
 *   Copyright(C) 2011, EE2024
 *   All rights reserved.
 *
 ******************************************************************************/

#include "lpc17xx_pinsel.h"
#include "lpc17xx_gpio.h"
#include "lpc17xx_i2c.h"
#include "lpc17xx_ssp.h"
#include "lpc17xx_timer.h"

#include "acc.h"
#include "oled.h"
#include "temp.h"
#include "light.h"

#define INITIALIZATION_MODE 1
#define CLIMB_MODE 2
#define EMERGENCY_MODE 3

#define ACC_THRESHOLD 100
#define TEMP_THRESHOLD 280
#define LIGHT_THRESHOLD 3000

volatile uint32_t msTicks;

void SysTick_Handler(void) {
  msTicks++;
}

void EINT3_IRQHandler(void)
{
	// Determine if the correct interrupt was triggered
	if ((LPC_GPIOINT->IO2IntStatF>>10)& 0x1)
	{
        printf("GPIO Interrupt 2.10\n");
        // Clear GPIO Interrupt P2.10
        LPC_GPIOINT->IO2IntClr = 1<<10;
	}
}

uint32_t get_ticks(void) {
	return msTicks;
}

__INLINE static void systick_delay (uint32_t delayTicks) {
  uint32_t currentTicks;

  currentTicks = msTicks;	// read current tick counter
  // Now loop until required number of ticks passes
  while ((msTicks - currentTicks) < delayTicks);
}

static void init_i2c(void)
{
	PINSEL_CFG_Type PinCfg;

	/* Initialize I2C2 pin connect */
	PinCfg.Funcnum = 2;
	PinCfg.Pinnum = 10;
	PinCfg.Portnum = 0;
	PINSEL_ConfigPin(&PinCfg);
	PinCfg.Pinnum = 11;
	PINSEL_ConfigPin(&PinCfg);

	// Initialize I2C peripheral
	I2C_Init(LPC_I2C2, 100000);

	/* Enable I2C1 operation */
	I2C_Cmd(LPC_I2C2, ENABLE);
}

static void init_ssp(void)
{
	SSP_CFG_Type SSP_ConfigStruct;
	PINSEL_CFG_Type PinCfg;

	/*
	 * Initialize SPI pin connect
	 * P0.7 - SCK;
	 * P0.8 - MISO
	 * P0.9 - MOSI
	 * P2.2 - SSEL - used as GPIO
	 */
	PinCfg.Funcnum = 2;
	PinCfg.OpenDrain = 0;
	PinCfg.Pinmode = 0;
	PinCfg.Portnum = 0;
	PinCfg.Pinnum = 7;
	PINSEL_ConfigPin(&PinCfg);
	PinCfg.Pinnum = 8;
	PINSEL_ConfigPin(&PinCfg);
	PinCfg.Pinnum = 9;
	PINSEL_ConfigPin(&PinCfg);
	PinCfg.Funcnum = 0;
	PinCfg.Portnum = 2;
	PinCfg.Pinnum = 2;
	PINSEL_ConfigPin(&PinCfg);

	SSP_ConfigStructInit(&SSP_ConfigStruct);

	// Initialize SSP peripheral with parameter given in structure above
	SSP_Init(LPC_SSP1, &SSP_ConfigStruct);

	// Enable SSP peripheral
	SSP_Cmd(LPC_SSP1, ENABLE);

}

static void bar_light(uint8_t i) {
	i = (i % 16);

	if(i > 0) {
		uint16_t onMask = 0x0000;
		uint8_t count = 0;
		while(count < i) {
			onMask |= (1 << count);
			count++;
		}
		pca9532_setLeds(onMask, 0xFFFF);
	} else {
		pca9532_setLeds(0, 0xFFFF);
	}
}

static void init_gpio(void) {
	PINSEL_CFG_Type PinCfg;

	// Configuring for temperature sensor
	PinCfg.Funcnum = PINSEL_FUNC_0;
	PinCfg.OpenDrain = PINSEL_PINMODE_NORMAL;
	PinCfg.Pinmode = PINSEL_PINMODE_PULLUP;
	PinCfg.Portnum = PINSEL_PORT_0;
	PinCfg.Pinnum = PINSEL_PIN_2;
	PINSEL_ConfigPin(&PinCfg);

	// Configuring for SW4
	PinCfg.Portnum = 1;
	PinCfg.Pinnum = 31;
	PINSEL_ConfigPin(&PinCfg);
}

// Print everything nicely to the screen!
static void output_oled(uint8_t mode, uint8_t flags, uint32_t acc, int32_t temp, uint32_t light) {
	char str_buffer[0];
	oled_clearScreen(OLED_COLOR_BLACK);
	switch(mode) {
		case INITIALIZATION_MODE:
			oled_putString(0, 0, "Mode: Initialization", OLED_COLOR_WHITE, OLED_COLOR_BLACK);
			break;
		case CLIMB_MODE:
			oled_putString(0, 0, "Mode: Climbing", OLED_COLOR_WHITE, OLED_COLOR_BLACK);

			// Checking status flag
			if((flags && 0x01) && (flags && 0x02))
				oled_putString(0, 10, "Status: REST NOW, DIM", OLED_COLOR_WHITE, OLED_COLOR_BLACK);
			else if(flags && 0x01)
				oled_putString(0, 10, "Status: REST NOW", OLED_COLOR_WHITE, OLED_COLOR_BLACK);
			else if(flags && 0x02)
				oled_putString(0, 10, "Status: DIM", OLED_COLOR_WHITE, OLED_COLOR_BLACK);
			else
				oled_putString(0, 10, "Status: none", OLED_COLOR_WHITE, OLED_COLOR_BLACK);

			// Printing all sensor values
			sprintf(str_buffer, "Acc: %f", (acc/1000));
			oled_putString(0, 20, str_buffer, OLED_COLOR_WHITE, OLED_COLOR_BLACK);
			sprintf(str_buffer, "Temp: %f", (temp/10));
			oled_putString(0, 30, str_buffer, OLED_COLOR_WHITE, OLED_COLOR_BLACK);
			sprintf(str_buffer, "Light: %f", light);
			oled_putString(0, 30, str_buffer, OLED_COLOR_WHITE, OLED_COLOR_BLACK);
			break;
		case EMERGENCY_MODE:
			oled_putString(0, 0, "Mode: Emergency", OLED_COLOR_WHITE, OLED_COLOR_BLACK);
			break;
		default:
			mode = INITIALIZATION_MODE;
	}
}

int main(void) {
	// Accelerometer variables
	int32_t acc_xoff = 0;
	int32_t acc_yoff = 0;
	int32_t acc_zoff = 0;
	int32_t acc_net = 0;
	int8_t acc_x = 0;
	int8_t acc_y = 0;
	int8_t acc_z = 0;

	// Temperature variables
	int32_t temp = 0;
	uint32_t temp_tick = 0;

	// Light sensor variables
	uint32_t light = 0;
	uint8_t bar_strength = 0;

	// Triggered flags LSB=temp LSB+1=light
	int8_t flag = 0;


	char display[10];

	uint8_t mode = INITIALIZATION_MODE;

	// Setup SysTick Timer to interrupt at 1 msec intervals
	if (SysTick_Config(SystemCoreClock / 1000)) {
		while (1);  // Capture error
	}

	init_i2c();
	init_ssp();
	init_gpio();

	acc_init();
	oled_init();
	temp_init(&get_ticks);
	led7seg_init();
	pca9532_init();
	light_init();

	while(1) {
		switch(mode) {
			case INITIALIZATION_MODE:
				break;
			case CLIMB_MODE:
				// Enabling sensors
				light_enable();

				// Calibrate accelerometer to zero value
				acc_read(&acc_x, &acc_y, &acc_z);
				acc_xoff = 0 - acc_x;
				acc_yoff = 0 - acc_y;
				acc_zoff = 0 - acc_z;

				oled_clearScreen(OLED_COLOR_BLACK);
				while(1) {
					// Reading from all the sensors
					acc_read(&acc_x, &acc_y, &acc_z);
					temp = temp_read();
					light = light_read();

					// Calculating calibrated XYZ acceleration
					acc_x = acc_x + acc_xoff;
					acc_y = acc_y + acc_yoff;
					acc_z = acc_z + acc_zoff;

					// Calculating net acceleration in mg
					acc_net = sqrt(acc_x*acc_x + acc_y*acc_y + acc_z*acc_z) * 16; // in for ~16mg/LSB

					// Fall detected
					if(acc_net > ACC_THRESHOLD) {
						mode = EMERGENCY_MODE;
						break;
					}

					// Body temperature monitoring
					if((temp > TEMP_THRESHOLD) && ((flag && 0x01) != 1)) {
						flag |= 0x01;
						temp_tick = msTicks; // Set 3000ms timer
					}

					if(msTicks - temp_tick < 3000)
						oled_putString(5, 30, "REST NOW", OLED_COLOR_WHITE, OLED_COLOR_BLACK);
					if(temp < TEMP_THRESHOLD)
						flag &= 0xFE;

					// Ambient light monitoring
					if(light < LIGHT_THRESHOLD) {
						flag |= 0x02;
						bar_strength = ((3000 - light) / 186); // Scaling to 16 bits
						bar_light(bar_strength);
					} else if(flag && 0x02) {
						bar_light(0);
						flag &= 0xFD;
					}

					// Print to OLED screen
					output_oled(mode, flag, acc_net, temp, light);
				}
				break;
			case EMERGENCY_MODE:
				break;
			default:
				mode = INITIALIZATION_MODE;
		}
	}
}

void check_failed(uint8_t *file, uint32_t line)
{
	/* User can add his own implementation to report the file name and line number,
	 ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */

	/* Infinite loop */
	while(1);
}

