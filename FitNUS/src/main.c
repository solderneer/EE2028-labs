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

#define INITIALIZATION_MODE 1
#define CLIMB_MODE 2
#define EMERGENCY_MODE 3

volatile uint32_t msTicks;

void SysTick_Handler(void) {
  msTicks++;
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

static void bar_light(int i) {
	i = (i % 16);

	if(i > 0) {
		uint16_t onMask = 0x0000;
		uint8_t count = 0;
		while(count < i) {
			onMask |= (1 << count);
			count++;
		}
		pca9532_setLeds(onMask, 0xFFFF);
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

}

int main(void) {
	int32_t xoff = 0;
	int32_t yoff = 0;
	int32_t zoff = 0;

	int32_t temp = 0;

	int8_t x = 0;
	int8_t y = 0;
	int8_t z = 0;

	int32_t acc_net = 0;
	char display[10];

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
	led7seg_init ();
	pca9532_init ();

	// Calibrate sensors to zero value
	acc_read(&x, &y, &z);
	xoff = 0 - x;
	yoff = 0 - y;
	zoff = 64 - z;

	// Clear OLED screen
	oled_clearScreen(OLED_COLOR_BLACK);
	led7seg_setChar('1', 0);

	while(1) {
		acc_read(&x, &y, &z);
		temp = temp_read();
		x = x + xoff;
		y = y + yoff;
		z = z + zoff;

		// acc_net = sqrt(x*x + y*y + z*z);
		sprintf(display, "%d,%d,%d,%d", x, y, z, temp);
		oled_clearScreen(OLED_COLOR_BLACK);
		oled_putString(5, 30, display, OLED_COLOR_WHITE, OLED_COLOR_BLACK);
		systick_delay(500);
	}
}

void check_failed(uint8_t *file, uint32_t line)
{
	/* User can add his own implementation to report the file name and line number,
	 ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */

	/* Infinite loop */
	while(1);
}

