#include "usart.h"
#include "cs43l22.h"

volatile uint8_t g_usart2_buffer[USART2_BUFFER_SIZE];
volatile uint16_t g_usart2_widx = 0;
volatile uint16_t g_usart2_ridx = 0;

volatile uint8_t g_usart3_buffer[USART3_BUFFER_SIZE];
volatile uint16_t g_usart3_widx = 0;
volatile uint16_t g_usart3_ridx = 0;

volatile uint8_t note;
volatile uint8_t octave = 4;
volatile uint8_t received = 0; 

void initUSART2(uint32_t baudrate)
{
	//wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww
	// USART2 initialization on PA2 -> TX & PA3 -> RX
	//------------------------------------------------------------------ 
	RCC->AHB1ENR |= RCC_AHB1ENR_GPIOAEN; 									
	RCC->APB1ENR |= RCC_APB1ENR_USART2EN; 								
	GPIOA->MODER |= (GPIO_MODER_MODER2_1)|(GPIO_MODER_MODER3_1); 		
	GPIOA->AFR[0] |= 0x00007700;										

	GPIOA->OSPEEDR |= GPIO_OSPEEDER_OSPEEDR2_1;							/** Set Output pins clock 50 MHz!! Dont go above 50! */  
	GPIOA->OSPEEDR |= GPIO_OSPEEDER_OSPEEDR3_1;							/** Set Output pins clock 50 MHz!! Dont go above 50! */  
	
	 
	USART2->BRR = baudrate;												// default 1 stop bit, 8 data bits, no parity	
																		// no flow control
	USART2->CR1 = (USART_CR1_UE)|(USART_CR1_TE)|(USART_CR1_RE);			// enable usart		
}

void putcharUSART2(uint8_t data)
{/// print one character to USART2
	while(!(USART2->SR & USART_SR_TC));									// wait until last transmission is over
	
	USART2->DR = data;													// send data
}

void printUSART2(char *str, ... )
{ /// print text and up to 10 arguments!
    uint8_t rstr[40];													// 33 max -> 32 ASCII for 32 bits and NULL 
    uint16_t k = 0;
	uint16_t arg_type;
	uint32_t utmp32;
	uint32_t * p_uint32; 
	char * p_char;
	va_list vl;
	
	//va_start(vl, 10);													// always pass the last named parameter to va_start, for compatibility with older compilers
	va_start(vl, str);													// always pass the last named parameter to va_start, for compatibility with older compilers
	while(str[k] != 0x00)
	{
		if(str[k] == '%')
		{
			if(str[k+1] != 0x00)
			{
				switch(str[k+1])
				{
					case('b'):
					{// binary
						if(str[k+2] == 'b')
						{// byte
							utmp32 = va_arg(vl, int);
							arg_type = (PRINT_ARG_TYPE_BINARY_BYTE);
						}
						else if(str[k+2] == 'h')
						{// half word
							utmp32 = va_arg(vl, int);
							arg_type = (PRINT_ARG_TYPE_BINARY_HALFWORD);
						}
						else if(str[k+2] == 'w')
						{// word	
							utmp32 = va_arg(vl, uint32_t);
							arg_type = (PRINT_ARG_TYPE_BINARY_WORD);
						}
						else
						{// default word
							utmp32 = va_arg(vl, uint32_t);
							arg_type = (PRINT_ARG_TYPE_BINARY_WORD);
							k--;
						}
						
						k++;	
						p_uint32 = &utmp32;
						break;
					}
					case('d'):
					{// decimal
						if(str[k+2] == 'b')
						{// byte
							utmp32 = va_arg(vl, int);
							arg_type = (PRINT_ARG_TYPE_DECIMAL_BYTE);
						}
						else if(str[k+2] == 'h')
						{// half word
							utmp32 = va_arg(vl, int);
							arg_type = (PRINT_ARG_TYPE_DECIMAL_HALFWORD);
						}
						else if(str[k+2] == 'w')
						{// word	
							utmp32 = va_arg(vl, uint32_t);
							arg_type = (PRINT_ARG_TYPE_DECIMAL_WORD);
						}
						else
						{// default word
							utmp32 = va_arg(vl, uint32_t);
							arg_type = (PRINT_ARG_TYPE_DECIMAL_WORD);
							k--;
						}
						
						k++;	
						p_uint32 = &utmp32;
						break;
					}
					case('c'):
					{// character
						char tchar = va_arg(vl, int);	
						putcharUSART2(tchar);
						arg_type = (PRINT_ARG_TYPE_CHARACTER);
						break;
					}
					case('s'):
					{// string 
						p_char = va_arg(vl, char *);	
						sprintUSART2((uint8_t *)p_char);
						arg_type = (PRINT_ARG_TYPE_STRING);
						break;
					}
					case('f'):
					{// float
						uint64_t utmp64 = va_arg(vl, uint64_t);			// convert double to float representation IEEE 754
						uint32_t tmp1 = utmp64&0x00000000FFFFFFFF;
						tmp1 = tmp1>>29;
						utmp32 = utmp64>>32;
						utmp32 &= 0x07FFFFFF;
						utmp32 = utmp32<<3;
						utmp32 |= tmp1;
						if(utmp64 & 0x8000000000000000)
							utmp32 |= 0x80000000;
							
						if(utmp64 & 0x4000000000000000)
							utmp32 |= 0x40000000;
							
						p_uint32 = &utmp32;
						
						arg_type = (PRINT_ARG_TYPE_FLOAT);
						//arg_type = (PRINT_ARG_TYPE_HEXADECIMAL_WORD);
						//arg_type = (PRINT_ARG_TYPE_BINARY_WORD);
						break;
					}
					case('x'):
					{// hexadecimal 
						if(str[k+2] == 'b')
						{// byte
							utmp32 = (uint32_t)va_arg(vl, int);
							arg_type = (PRINT_ARG_TYPE_HEXADECIMAL_BYTE);
						}
						else if(str[k+2] == 'h')
						{// half word
							utmp32 = (uint32_t)va_arg(vl, int);
							arg_type = (PRINT_ARG_TYPE_HEXADECIMAL_HALFWORD);
						}
						else if(str[k+2] == 'w')
						{// word	
							utmp32 = va_arg(vl, uint32_t);
							arg_type = (PRINT_ARG_TYPE_HEXADECIMAL_WORD);
						}
						else
						{
							utmp32 = va_arg(vl, uint32_t);
							arg_type = (PRINT_ARG_TYPE_HEXADECIMAL_WORD);
							k--;
						}
						
						k++;
						p_uint32 = &utmp32;
						break;
					}
					default:
					{
						utmp32 = 0;
						p_uint32 = &utmp32;
						arg_type = (PRINT_ARG_TYPE_UNKNOWN);
						break;
					}
				}
					
				if(arg_type&(PRINT_ARG_TYPE_MASK_CHAR_STRING))	
				{
					getStr4NumMISC(arg_type, p_uint32, rstr);
					sprintUSART2(rstr);	
				}
				k++;
			}
		}
		else
		{// not a '%' char -> print the char
			putcharUSART2(str[k]);
			if (str[k] == '\n')
				putcharUSART2('\r');
		}
		k++;
	}
	
	va_end(vl);
	return;
}

void sprintUSART2(uint8_t * str)
{
	uint16_t k = 0;
	
	while (str[k] != '\0')
    {
        putcharUSART2(str[k]);
        if (str[k] == '\n')
            putcharUSART2('\r');
        k++;

        if (k == MAX_PRINT_STRING_SIZE)
            break;
    }
}

uint8_t getcharUSART2(void)
{/// get one character from USART1
	uint8_t data;
	
	while((USART2->SR & USART_SR_RXNE) != USART_SR_RXNE);				// wait until data ready
	
	data = USART2->DR;													// send data
	USART2->SR &= ~(USART_SR_RXNE);										// clear Rx data ready flag
	
	return data;
}

void enableRxUSART2(void)
{
	USART2->CR1 = USART_CR1_UE|USART_CR1_RE;
}

uint8_t getRxStateUSART2(void)
{
	uint8_t r_val = USART_RX_DATA_NOT_READY;
	if((USART2->SR & USART_SR_RXNE) == USART_SR_RXNE)
		r_val = USART_RX_DATA_READY;
		
	return r_val;
}


void enIrqUSART2(void)
{
	USART2->CR1 &= ~(USART_CR1_UE);
	
	NVIC_EnableIRQ(USART2_IRQn);
	USART2->CR1 |= (USART_CR1_UE)|(USART_CR1_RE)|(USART_CR1_RXNEIE);
}

void USART2_IRQHandler(void)
{
	//uint8_t data;

	if(USART2->SR&(USART_SR_RXNE))
	{
		g_usart2_buffer[g_usart2_widx] = USART2->DR;
		g_usart2_widx++;
		received = 1;
		
		if(g_usart2_widx >= (USART2_BUFFER_SIZE))
		{
			g_usart2_widx = 0;
		}
	}
}

void serviceUSART2(void){
	switch(g_usart2_buffer[g_usart2_ridx++]){
		
		case 0x61: //Slovo A
		{ 
			note = 1;
			printUSART2("C");
			break;
		}
		case 0x77: // Slovo W
		{
			note = 2;
			printUSART2("Cis");
			break;
		}
		case 0x73: //Slovo S
		{
			note = 3;
			printUSART2("D");
			break;
		}
		case 0x65: //Slovo E
		{
			note = 4;
			printUSART2("Dis");
			break;
		}
		case 0x64: //Slovo D
		{
			note = 5;
			printUSART2("E");
			break;
		}
		case 0x66: // Slovo F
		{
			note = 6;
			printUSART2("F");
			break;
		}
		case 0x74: //Slovo T
		{
			note = 7;
			printUSART2("Fis");
			break;
		}
		case 0x67: //Slovo G
		{
			note = 8;
			printUSART2("G");
			break;
		}
		case 0x79: //Slovo Y
		{
			note = 9;
			printUSART2("Gis");
			break;
		}
		case 0x68: //Slovo H
		{
			note = 10;
			printUSART2("A");
			break;
		}
		case 0x75: //Slovo U;
		{
			note = 11;
			printUSART2("Ais");
			break;
		}
		case 0x6A: //Slovo J
		{
			note = 12;
			printUSART2("H");
			break;
		}
		case 0x6B: //Slovo K;
		{
			note = 13;
			printUSART2("C2");
			break;
		}
		case 0x20: //Space Bar
		{
			note = 0;
			printUSART2("PAUSE");
			break;
		}
		case 0x6D: //Octave Up
		{
			octave++;
			printUSART2("Octave Up");
			break;
		}
		case 0x6E: //Octave Down
		{
			octave--;
			printUSART2("Octave Down");
			break;
		}
		default:
		{
			break;
		}
	}
}

void chkBuffUSART2(void){
	
	if(g_usart2_ridx != g_usart2_widx)
	{
		serviceUSART2();
		
		if(g_usart2_ridx >= (USART2_BUFFER_SIZE))
		{
			g_usart2_ridx = 0;
		}
	}
}

void initUSART3(uint32_t baudrate)
{
	// USART3: PD8 -> TX & PD9 -> RX
	// PIN Config
	RCC->AHB1ENR |= RCC_AHB1ENR_GPIODEN;
	GPIOD->MODER &= ~((GPIO_MODER_MODER8) | (GPIO_MODER_MODER9));
	GPIOD->MODER |= (GPIO_MODER_MODER8_1) | (GPIO_MODER_MODER9_1);
	GPIOD->AFR[1] |= 0x00000077;
	
	//USART3 Config
	RCC->APB1ENR |= RCC_APB1ENR_USART3EN;
	USART3->BRR = baudrate;
	USART3->CR1 = (USART_CR1_UE | USART_CR1_TE | USART_CR1_RE);	
}

void enIrqUSART3(void)
{
	USART3->CR1 &= ~(USART_CR1_UE);
	
	NVIC_EnableIRQ(USART3_IRQn);
	USART3->CR1 |= (USART_CR1_UE)|(USART_CR1_RE)|(USART_CR1_RXNEIE);
}

void USART3_IRQHandler(void)
{
	if(USART3->SR & (USART_SR_RXNE))
	{
		g_usart3_buffer[g_usart3_widx] = USART3->DR;
		g_usart3_widx++;
		
		if(g_usart3_widx >= (USART3_BUFFER_SIZE))
		{
			g_usart3_widx = 0;
		}
	}
}

void chkRxBuffUSART3(void)
{
	if(g_usart3_ridx != g_usart3_widx)
	{		
		if(g_usart3_ridx >= (USART3_BUFFER_SIZE))
		{
			g_usart3_ridx = 0;
		}
	}
}

void putcharUSART3(uint8_t data)
{ 
	//Print one character to USART3
	//TC - transmition completed
	while(!(USART3->SR & USART_SR_TC));									
	USART3->DR = data;												    
}


int8_t getcharUSART3(void)
{
	uint8_t data;
	USART3->CR1 |= USART_CR1_UE|USART_CR1_RE;							// enable usart	and Rx
	while((USART3->SR & USART_SR_RXNE) != USART_SR_RXNE);				// wait until data ready
	
	data = USART3->DR;													// send data
	USART3->SR &= ~(USART_SR_RXNE);										// clear Rx data ready flag
	USART3->CR1 &= ~(USART_CR1_RE);
	return data;
}

int8_t chkUSART3flag()
{
	uint8_t flag  = 0;
	
	if(g_usart3_ridx != g_usart3_widx)
	{
		flag = 1;
		g_usart3_ridx++;
		
		if(g_usart3_ridx >= (USART3_BUFFER_SIZE))
		{
			g_usart3_ridx = 0;
		}
	}	
	return flag;
}


