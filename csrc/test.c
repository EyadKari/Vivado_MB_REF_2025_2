#include <stdio.h>

#include "xuartlite_l.h"
#include "xgpio_l.h"
#include "xparameters.h"

int main()
{
    xil_printf("Hallo ESR-Kurs! \n\r");

    XGpio_WriteReg(XPAR_AXI_GPIO_0_BASEADDR, 0, 9/*1001*/);


    while(1)
    {
        unsigned char buffer;

        // receive character from UART
    	buffer = XUartLite_RecvByte(XPAR_UARTLITE_0_BASEADDR);

    	if ( ((buffer >= 'a') && (buffer <= 'z')) ||
    	     ((buffer >= 'A') && (buffer <= 'Z')) ) // if it's a letter
    	{
    		buffer ^= 0x20;  // toggle capitalization bit

    		XGpio_WriteReg(XPAR_AXI_GPIO_0_BASEADDR, 0, buffer);
    	}

    	// send character back over UART
    	XUartLite_SendByte(XPAR_UARTLITE_0_BASEADDR, buffer);
    }

    return 0;
}
