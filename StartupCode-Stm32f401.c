/******************** Startup Code to be in .init *********************/
//2. intialize the stack pointer
extern int _estack;
extern int _sdata_FLASH;/*here we extern the varialbles of the addresses of the data section of the RAM*/
extern int _sdata;/*start and end (e & s) and the start of the data of flash*/
extern int _edata;/*so we can move the with startup code from Flash to ram with ((*sdata_Flash++ = *sdata++)) so
                    we loop on the size of the .data section we have till we transfer all the data*/


void Reset_Handler(void);
void NMI_Handler(void);
void HardFault_Handler(void);
void MemManage_Handler(void);
void BusFault_Handler(void);
void UsageFault_Handler(void);
void SVCall_Handler(void);
void DebugMonitor_Handler(void);
void PendCV_Handler(void);
void Systick_Handler(void);
void WWDG_Handler(void);
void PVD_Handler(Void);
void TAMP_STAMP_Handler(Void);

//********************BUT if we forgot an impelemntation for any function the program will make error
/***** to solve this we make an attribute functionwith weak argument to tell the program if the the funtion
 * not implemented use the default function with no error , and this default function we define! 
*/

//for example we will make this to the header(prototype) of the function
void __attribute__ ((weak,alias ("default_Handler")))    EXTI0_Handler(void);
//we here tell the program if the EXTI0_Handler isn't defined"hasn't implemented" we will use the default handler







// 1. setting the interrupt vector table on [.isr_vector] section

typedef void (*const PF_Handler)(void);   //make a pointer to function with data type
//then I want to make the vector table array below be in the ((isr vctr)) in the flash 
__attribute__((section(".isr_vector"),used)) //used keyword is used to guide all the content to be in the flash don't matter it's used or not


//the PF_Handler is datatype now for a pointer point to function with it's address so the if we need to make an interrupt we use the pointer that holds the address of the function to be excuted


//making the vector table and filling it with the data from the datasheet
PF_Handler Vector_table[]={ 
    (PF_Handler)&_estack,
    Reset_Handler,
    NMI_Handler,          
    HardFault_Handler,    
    MemManage_Handler,
    BusFault_Handler,
    UsageFault_Handler,
    0,
    0,
    0,
    0,
    SVCall_Handler,
    DebugMonitor_Handler,
    0,
    PendCV_Handler,
    Systick_Handler,
    

    /******************************************************************************************************/
    /**************************************      External Intrrupts    ************************************/
    /******************************************************************************************************/    
    WWDG_Handler,
    PVD_Handler,
    TAMP_STAMP_Handler,




              };


//impelementation for the functions of the inttrupt table
void __attribute__ ((section(".init"),used)) default_Handler(void){
    while (1)
    {
        /* code */
    }
    
}

//the real usage of the startup code goes here ,where the startup code start when we Reset or start from zer0!

void __attribute__((section(".isr_vector"),used)) Reset_Handler(void){

//3.copy [.data] section from Flash to RAM

//4. Reverse[.bss] section on Ram and initialize with zero

//5. call main() function


}
void NMI_Handler(void){

}

void HardFault_Handler(void){

    
}

void MemManage_Handler(void){


    
}
void BusFault_Handler(void){



}
void UsageFault_Handler(void){


}
void SVCall_Handler(void){


}
void DebugMonitor_Handler(void){


}
void PendCV_Handler(void){


}
void Systick_Handler(void){


}
void WWDG_Handler(void){


}
void PVD_Handler(Void){


}
void TAMP_STAMP_Handler(Void){


}









