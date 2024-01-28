MEMORY
{
    RAM (xrw) : ORIGIN = 0x20000000, LENGTH = 64k
    FLASH (rx) : ORIGIN = 0x08000000, LENGTH = 256K
}

SECTIONS{
    
    .isr_vector :
    {

    }>FLASH



    .init:{
        
    }>FLASH



    .data:{

    }>RAM AT>FLASH



    .bss:{

    }>RAM



    .text:{

    }>FLASH


    .rodata:{

    }>FLASH


    
}