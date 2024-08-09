/*
******************************************************************************
**
**  File        : LinkerScript.ld
**
**  Author      : STM32CubeIDE
**
**  Abstract    : Linker script for STM32H7 series
**                2048Kbytes FLASH and 1056Kbytes RAM
**
**                Set heap size, stack size and stack location according
**                to application requirements.
**
**                Set memory bank area and size if external memory is used.
**
**  Target      : STMicroelectronics STM32
**
**  Distribution: The file is distributed as is, without any warranty
**                of any kind.
**
*****************************************************************************
** @attention
**
** Copyright (c) 2024 STMicroelectronics.
** All rights reserved.
**
** This software is licensed under terms that can be found in the LICENSE file
** in the root directory of this software component.
** If no LICENSE file comes with this software, it is provided AS-IS.
**
****************************************************************************
*/

/* Entry Point */
ENTRY(Reset_Handler)

/* Highest address of the user mode stack */
_estack = ORIGIN(RAM) + LENGTH(RAM);    /* end of RAM */
/* Generate a link error if heap and stack don't fit into RAM */
_Min_Heap_Size = 0x400;      /* required amount of heap  */
_Min_Stack_Size = 0x400; /* required amount of stack */

/* Specify the memory areas */
MEMORY
{
  DTCMRAM	(xrw)	: ORIGIN = 0x20000000, LENGTH = 128K
  FLASH	(rx)	: ORIGIN = 0x08000000, LENGTH = 2048K
  RxDecripSection	(xrw)	: ORIGIN = 0x30000000, LENGTH = 128
  TxDecripSection	(xrw)	: ORIGIN = 0x30000080, LENGTH = 128
  driver.eth_mac0_tx_buf	(xrw)	: ORIGIN = 0x30001900, LENGTH = 6K
  ITCMRAM	(xrw)	: ORIGIN = 0x00000000, LENGTH = 64K
  RAM_D3	(xrw)	: ORIGIN = 0x38000000, LENGTH = 64K
  RAM_D2	(xrw)	: ORIGIN = 0x30003100, LENGTH = 282368
  RAM	(xrw)	: ORIGIN = 0x24000000, LENGTH = 504K
  driver.mci1	(xrw)	: ORIGIN = 0x2407e000, LENGTH = 8K
  driver.eth_mac0_rx_buf	(xrw)	: ORIGIN = 0x30000100, LENGTH = 6K
}

/* Define output sections */
SECTIONS
{
  /* The startup code goes first into FLASH */
  .isr_vector :
  {
    . = ALIGN(4);
    KEEP(*(.isr_vector)) /* Startup code */
    . = ALIGN(4);
  } >FLASH

  /* The program code and other data goes into FLASH */
  .text :
  {
    . = ALIGN(4);
    *(.text)           /* .text sections (code) */
    *(.text*)          /* .text* sections (code) */
    *(.glue_7)         /* glue arm to thumb code */
    *(.glue_7t)        /* glue thumb to arm code */
    *(.eh_frame)

    KEEP (*(.init))
    KEEP (*(.fini))

    . = ALIGN(4);
    _etext = .;        /* define a global symbols at end of code */
  } >FLASH

  /* Constant data goes into FLASH */
  .rodata :
  {
    . = ALIGN(4);
    *(.rodata)         /* .rodata sections (constants, strings, etc.) */
    *(.rodata*)        /* .rodata* sections (constants, strings, etc.) */
    . = ALIGN(4);
  } >FLASH

  .ARM.extab (READONLY) : /* The READONLY keyword is only supported in GCC11 and later, remove it if using GCC10 or earlier. */
  {
    *(.ARM.extab* .gnu.linkonce.armextab.*)
  } >FLASH
  .ARM (READONLY) : /* The READONLY keyword is only supported in GCC11 and later, remove it if using GCC10 or earlier. */
  {
    __exidx_start = .;
    *(.ARM.exidx*)
    __exidx_end = .;
  } >FLASH

  .preinit_array (READONLY) : /* The READONLY keyword is only supported in GCC11 and later, remove it if using GCC10 or earlier. */
  {
    PROVIDE_HIDDEN (__preinit_array_start = .);
    KEEP (*(.preinit_array*))
    PROVIDE_HIDDEN (__preinit_array_end = .);
  } >FLASH

  .init_array (READONLY) : /* The READONLY keyword is only supported in GCC11 and later, remove it if using GCC10 or earlier. */
  {
    PROVIDE_HIDDEN (__init_array_start = .);
    KEEP (*(SORT(.init_array.*)))
    KEEP (*(.init_array*))
    PROVIDE_HIDDEN (__init_array_end = .);
  } >FLASH

  .fini_array (READONLY) : /* The READONLY keyword is only supported in GCC11 and later, remove it if using GCC10 or earlier. */
  {
    PROVIDE_HIDDEN (__fini_array_start = .);
    KEEP (*(SORT(.fini_array.*)))
    KEEP (*(.fini_array*))
    PROVIDE_HIDDEN (__fini_array_end = .);
  } >FLASH

  /* used by the startup to initialize data */
  _sidata = LOADADDR(.data);

  /* Initialized data sections goes into RAM, load LMA copy after code */
  .data :
  {
    . = ALIGN(4);
    _sdata = .;        /* create a global symbol at data start */
    *(.data)           /* .data sections */
    *(.data*)          /* .data* sections */
    *(.RamFunc)        /* .RamFunc sections */
    *(.RamFunc*)       /* .RamFunc* sections */

    . = ALIGN(4);
    _edata = .;        /* define a global symbol at data end */
  } >RAM AT> FLASH

  /* Uninitialized data section */
  . = ALIGN(4);
  .bss :
  {
    /* This is used by the startup in order to initialize the .bss section */
    _sbss = .;         /* define a global symbol at bss start */
    __bss_start__ = _sbss;
    *(.bss)
    *(.bss*)
    *(COMMON)

    . = ALIGN(4);
    _ebss = .;         /* define a global symbol at bss end */
    __bss_end__ = _ebss;
  } >RAM

  /* User_heap_stack section, used to check that there is enough RAM left */
  ._user_heap_stack :
  {
    . = ALIGN(8);
    PROVIDE ( end = . );
    PROVIDE ( _end = . );
    . = . + _Min_Heap_Size;
    . = . + _Min_Stack_Size;
    . = ALIGN(8);
  } >RAM

  /* Remove information from the standard libraries */
  /DISCARD/ :
  {
    libc.a ( * )
    libm.a ( * )
    libgcc.a ( * )
  }

  .ARM.attributes 0 : { *(.ARM.attributes) }

 /*  Unitialized DTCMRAM section into "DTCMRAM" DTCMRAM type memory */
 .DTCMRAM_Section :
  {
    . = ALIGN(4);
    KEEP (*(.DTCMRAM_Section))
    . = ALIGN(4);
  } >DTCMRAM

 /*  Unitialized RxDecripSection section into "RxDecripSection" RxDecripSection type memory */
 .RxDecripSection_Section :
  {
    . = ALIGN(4);
    KEEP (*(.RxDecripSection))
    . = ALIGN(4);
  } >RxDecripSection

 /*  Unitialized TxDecripSection section into "TxDecripSection" TxDecripSection type memory */
 .TxDecripSection_Section :
  {
    . = ALIGN(4);
    KEEP (*(.TxDecripSection))
    . = ALIGN(4);
  } >TxDecripSection

 /*  Unitialized driver.eth_mac0_tx_buf section into "driver.eth_mac0_tx_buf" driver.eth_mac0_tx_buf type memory */
 .driver.eth_mac0_tx_buf_Section :
  {
    . = ALIGN(4);
    KEEP (*(.driver.eth_mac0_tx_buf))
    . = ALIGN(4);
  } >driver.eth_mac0_tx_buf

 /*  Unitialized ITCMRAM section into "ITCMRAM" ITCMRAM type memory */
 .ITCMRAM_Section :
  {
    . = ALIGN(4);
    KEEP (*(.ITCMRAM_Section))
    . = ALIGN(4);
  } >ITCMRAM

 /*  Unitialized RAM_D3 section into "RAM_D3" RAM_D3 type memory */
 .RAM_D3_Section :
  {
    . = ALIGN(4);
    KEEP (*(.RAM_D3_Section))
    . = ALIGN(4);
  } >RAM_D3

 /*  Unitialized RAM_D2 section into "RAM_D2" RAM_D2 type memory */
 .RAM_D2_Section :
  {
    . = ALIGN(4);
    KEEP (*(.RAM_D2_Section))
    . = ALIGN(4);
  } >RAM_D2

 /*  Unitialized driver.mci1 section into "driver.mci1" driver.mci1 type memory */
 .driver.mci1_Section :
  {
    . = ALIGN(4);
    KEEP (*(.driver.mci1))
    . = ALIGN(4);
  } >driver.mci1

 /*  Unitialized driver.eth_mac0_rx_buf section into "driver.eth_mac0_rx_buf" driver.eth_mac0_rx_buf type memory */
 .driver.eth_mac0_rx_buf_Section :
  {
    . = ALIGN(4);
    KEEP (*(.driver.eth_mac0_rx_buf))
    . = ALIGN(4);
  } >driver.eth_mac0_rx_buf

}


