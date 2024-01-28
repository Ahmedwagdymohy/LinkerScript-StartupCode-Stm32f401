_estack = ORIGIN(RAM) + LENGTH(RAM);

MEMORY
{
    RAM (xrw) : ORIGIN = 0x20000000, LENGTH = 64k
    FLASH (rx) : ORIGIN = 0x08000000, LENGTH = 256K
}


SECTIONS{
    
    .isr_vector :
    {
        *(.isr_vector)
        *(.isr_vector*)


    }>FLASH



    .init:{
        *(.init)
        *(.init*)
    }>FLASH



_sdata_FLASH = LOADADDR(.data);
 

    .data:{
        _sdata = .; 
        *(.data)
        *(.data*)
        _edata = .;

    }>RAM AT>FLASH



    .bss:{
        *(.bss)
        *(.bss*)

    }>RAM



    .text:{
        *(.text)
        *(.text*)

    }>FLASH


    .rodata:{
        *(.rodata)
        *(.rodata*)


    }>FLASH


    
}