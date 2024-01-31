/*****************************  Makefile to automate the compiling process  *****************************/
/********************************************************************************************************/

main.o : main.c
	arm-none-eabi-gcc -c -mcpu=cortex-m4 -mthumb main.c -o main.o
//the program will compile main.o but with dependance of main.c "means that main.c should exist"*****



RCC-Program.o : RCC-Program.c
	arm-none-eabi-gcc -c -mcpu=arm-cortex-m4 -mthumb RCC-Program.c -o RCC-Program.o



GPIO-Program.o : GPIO-Program.c
	arm-none-eabi-gcc -c -mcpu=arm-cortex-m4 -mthumb RCC-Program.c -o GPIO-Program.o


StartupCode-Stm32f401.o : StartupCode-Stm32f401.c
	arm-none-eabi-gcc -c -mcpu=arm-cortex-m4 -mthumb StartupCode-Stm32f401.c -o StartupCode-Stm32f401.o

//now we have all the object files that we need to generate the hex file , now we will automate that

//berfore the hex we should get the elf file

app.elf: main.o RCC-Program.o GPIO-Program.o StartupCode-Stm32f401.o 
	arm-none-eabi-T 