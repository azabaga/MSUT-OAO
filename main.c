#include "stm32f4xx.h"
#include "usart.h"
#include "delay.h"
#include "cs43l22.h"
#include "dac.h"
#include "math.h"

#define PI 					3.14159
#define DAC_BUFF_SIZE		500
#define T  					0.5e-4

#define NOTA_C        16.35
#define NOTA_Cis      17.32
#define NOTA_D        18.35
#define NOTA_Dis      19.44
#define NOTA_E        20.60
#define NOTA_F        21.82
#define NOTA_Fis      23.12
#define NOTA_G        24.49
#define NOTA_Gis     25.95
#define NOTA_A        27.50
#define NOTA_Ais      29.14
#define NOTA_H        30.86
#define NOTA_C2      32.70


volatile float y;
uint32_t utmp32 = 0;
uint16_t dac_buff[DAC_BUFF_SIZE];

void getData4DacUSART2(uint16_t * dac_buff, uint8_t note, uint8_t octave);
void playNote(float noteFrequency, float t, uint8_t octave);

int main(void)
{	
	initUSART2(USART2_BAUDRATE_921600);
	enIrqUSART2();
	initSYSTIM();
	
	getData4DacUSART2(dac_buff, 0, 1);
	initDmaDAC1(dac_buff, DAC_BUFF_SIZE);					// init ADC1 in double buffer DMA mode
	
	printUSART2("\nwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww\n");
	printUSART2("|                                                       Piano		                		                         |");
	printUSART2("\nwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww\n");
	
	initCS43L22(30, 48000);
	
	utmp32 = getSYSTIM();
	
	printUSART2(" Enter next letters to play notes: \na(note C), s(note D), d(note E), f(note F), g(note G), h(note A), j(note H), k(note C)");
	printUSART2(" \nw(note Cis), e(note Dis), t(note Fis), y(note Gis), u(note Ais):\n");
	
	uint32_t k = 0;
	while(1)
	{
		// send dummy data causing the I2S interface to generate the MCK
		while((SPI3->SR & 0x00000002) == 0);
		SPI3->DR = 0x00; 

		chkBuffUSART2();
		getData4DacUSART2(dac_buff, note, octave);
		
	}
}

void getData4DacUSART2(uint16_t* dac_buff, uint8_t note, uint8_t octave)
{
	float t =0;
    uint8_t n;
			
	for(n=0; n<(DAC_BUFF_SIZE); n++)
	{
		switch (note)
        {
            case 0:
                y = 0;       // Pause
                break;
            case 1:
                playNote(NOTA_C, t, octave);
                break;
            case 2:
                playNote(NOTA_Cis, t, octave);
                break;
            case 3:
                playNote(NOTA_D, t, octave);
                break;
            case 4:
                playNote(NOTA_Dis, t, octave);
                break;
            case 5:
                playNote(NOTA_E, t, octave);
                break;
            case 6:
                playNote(NOTA_F, t, octave);
                break;
            case 7:
                playNote(NOTA_Fis, t, octave);
                break;
            case 8:
                playNote(NOTA_G, t, octave);
                break;
            case 9:
                playNote(NOTA_Gis, t, octave);
                break;
            case 10:
                playNote(NOTA_A, t, octave);
                break;
            case 11:
                playNote(NOTA_Ais, t, octave);
                break;
            case 12:
                playNote(NOTA_H, t, octave);
                break;
            case 13:
                playNote(NOTA_C2, t, octave);
                break;
            default:
                y = 0; 
                break;
        }
		
		
		dac_buff[n] = (uint16_t)(y*4090);
		
		t = t + T;

        if (octave >= 8) {
			octave = 8;
		}
		if (octave <= 1) {
			octave = 1;
		}
	}
}

void playNote(float noteFrequency, float t, uint8_t octave)
{
	float Frequency = noteFrequency * powf(2, octave-1);
	float w = 2 * PI * Frequency;
	y = sinf(w * t);       
}





 
		
