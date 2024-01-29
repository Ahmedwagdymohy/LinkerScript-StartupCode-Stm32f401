/******************** Startup Code *********************/

extern int _estack;
void Reset_Handler(void);
void NMI_Handler(void);
void HardFault_Handler(void);
// 1. setting the interrupt vector table on [.isr_vector] section

typedef void (*const PF_Handler)(void);   //make a pointer to function with data type
//then I want to make the vector table array below be in the ((isr vctr)) in the flash 
__attribute__((section(".isr_vector"),used)) //used keyword is used to guide all the content to be in the flash don't matter it's used or not


//the PF_Handler is datatype now for a pointer point to function with it's address so the if we need to make an interrupt we use the pointer that holds the address of the function to be excuted


//making the vector table and filling it with the data from the datasheet
PF_Handler Vector_table[]={ 
    (PF_Handler)&_estack,
    &Reset_Handler,
    &NMI_Handler,          
    &HardFault_Handler,    

              };


//impelementation for the functions of the inttrupt table

void Reset_Handler(void){

}
void NMI_Handler(void){

}

void HardFault_Handler(void){

    
}
//2. intialize the stack pointer

//3.copy [.data] section from Flash to RAM

//4. Reverse[.bss] section on Ram and initialize with zero

//5. call main() function


