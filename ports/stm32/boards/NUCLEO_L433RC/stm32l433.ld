/*
    GNU linker script for STM32L433RC
*/

/* Specify the memory areas */
MEMORY
{
    FLASH (rx)      : ORIGIN = 0x08000000, LENGTH = 230K /* sectors  */
    FLASH_FS (r)    : ORIGIN = 0x08039800, LENGTH = 26K /* sectors  */
    RAM (xrw)       : ORIGIN = 0x20000000, LENGTH = 64K /* SRAM1, 48K + SRAM2, 16K */
}

/* produce a link error if there is not this amount of RAM for these sections */
_minimum_stack_size = 2K;
_minimum_heap_size = 16K;

/* Define the stack.  The stack is full descending so begins just above last byte of RAM,
   or bottom of FS cache..  Note that EABI requires the stack to be 8-byte aligned for a call. */

/* RAM extents for the garbage collector */
_ram_start = ORIGIN(RAM);
_ram_end = ORIGIN(RAM) + LENGTH(RAM);

_micropy_hw_internal_flash_storage_ram_cache_end = _ram_end;
_micropy_hw_internal_flash_storage_ram_cache_start = _micropy_hw_internal_flash_storage_ram_cache_end - 2K; /* fs cache = 2K */

_estack = _micropy_hw_internal_flash_storage_ram_cache_start - _estack_reserve;
_sstack = _estack - 10K; /* stack = 10K */

_heap_start = _ebss; /* heap starts just after statically allocated memory */
_heap_end = _sstack; /* bss + heap = 52K, tunable by adjusting stack size */

_micropy_hw_internal_flash_storage_start = ORIGIN(FLASH_FS);
_micropy_hw_internal_flash_storage_end   = ORIGIN(FLASH_FS) + LENGTH(FLASH_FS);
