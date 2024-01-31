/* the linkerScript parts is used by the startup code to 
 * copy the initial values of data from flash to RAM
 * and to zero-fill the uninitialized data area
 * 
 * the .isr_vector section is used by the startup code to 
 * copy the initial values of data from flash to RAM
 * and to zero-fill the uninitialized data area
 * 
 * the .init section is used by the startup code to 
 * copy the initial values of data from flash to RAM
 * and to zero-fill the uninitialized data area
 * 
 * the .data section is used by the startup code to 
 * copy the initial values of data from flash to RAM
 * and to zero-fill the uninitialized data area
 * 
 * the .bss section is used by the startup code to 
 * copy the initial values of data from flash to RAM
 * and to zero-fill the uninitialized data area
 * 
 * the .text section is used by the startup code to 
 * copy the initial values of data from flash to RAM
 * and to zero-fill the uninitialized data area
 * 
 * the .rodata section is used by the startup code to 
 * copy the initial values of data from flash to RAM
 * and to zero-fill the uninitialized data area
 * 
 */


_estack = ORIGIN(RAM) + LENGTH(RAM);

MEMORY
{
    RAM (xrw) : ORIGIN = 0x20000000, LENGTH = 64k
    FLASH (rx) : ORIGIN = 0x08000000, LENGTH = 256K
}


SECTIONS{
    /************************************************************************************/
    /*******************************   .isr_vector   ************************************/
    /************************************************************************************/
    
    .isr_vector :
    {
        *(.isr_vector)
        *(.isr_vector*)


    }>FLASH



    /************************************************************************************/
    /*******************************   .init   ************************************/
    /************************************************************************************/


    .init:{
        *(.init)
        *(.init*)
    }>FLASH



_sdata_FLASH = LOADADDR(.data);
 


    /************************************************************************************/
    /*******************************   .data   ************************************/
    /************************************************************************************/



    .data:{
        _sdata = .; 
        *(.data)
        *(.data*)
        _edata = .;

    }>RAM AT>FLASH


    /************************************************************************************/
    /*******************************   .bss   ************************************/
    /************************************************************************************/



    .bss:{
        _sbss_Ram= .;
        *(.bss)
        *(.bss*)
        _ebss_Ram=.;

    }>RAM   



    /************************************************************************************/
    /*******************************   .text   ************************************/
    /************************************************************************************/




    .text:{
        *(.text)
        *(.text*)

    }>FLASH




    /************************************************************************************/
    /*******************************   .rodata   ************************************/
    /************************************************************************************/



    .rodata:{
        *(.rodata)
        *(.rodata*)


    }>FLASH


    
}