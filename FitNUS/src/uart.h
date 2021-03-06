/*
 * uart.h
 *
 *  Created on: Nov 15, 2018
 *      Author: solderneer
 */

#ifndef UART_H_
#define UART_H_

#include "lpc17xx_libcfg_default.h"
#include "lpc17xx_uart.h"

// Function prototypes
void send_uart(LPC_UART_TypeDef *UARTPort, uint8_t *txbuf, uint8_t buflen);
void send_uartstring(LPC_UART_TypeDef *UARTPort, uint8_t *txbuf);
void init_uart(void);

#endif /* UART_H_ */
