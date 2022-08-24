MCU_SERIES = l4
CMSIS_MCU = STM32L452xx
AF_FILE = boards/NUCLEO_L433RC/stm32l433_af.csv
LD_FILES = boards/NUCLEO_L433RC/stm32l433.ld boards/common_basic.ld
OPENOCD_CONFIG = boards/openocd_stm32l4.cfg

# MicroPython settings
MICROPY_VFS_FAT = 1
MICROPY_VFS_LFS1 ?= 0

# Don't include default frozen modules because MCU is tight on flash space
FROZEN_MANIFEST ?=

# LTO reduces final binary size, may be slower to build depending on gcc version and hardware
LTO ?= 1
