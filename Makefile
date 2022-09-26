microcontrollerName = atmega32
clockFrequency = 8000000UL
sourceFiles = main.c LED_program.c DIO_program.c TIMER0_program.c
compilerName = avr-gcc
target = main

all: $(sourceFiles)
	@$(compilerName) -mmcu=$(microcontrollerName) -DF_CPU=$(clockFrequency) $^ -o $(target).o
	@avr-objcopy -j .text -j .data -O ihex $(target).o $(target).hex
	@avr-size --format=berkeley $(target).hex