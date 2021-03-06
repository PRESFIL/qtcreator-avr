##################################################################################
# "THE ANY BEVERAGE-WARE LICENSE" (Revision 42 - based on beer-ware
# license):
# <dev@layer128.net> wrote this file. As long as you retain this notice
# you can do whatever you want with this stuff. If we meet some day, and
# you think this stuff is worth it, you can buy me a be(ve)er(age) in
# return. (I don't like beer much.)
#
# Matthias Kleemann
##################################################################################

##################################################################################
# Sample CMakeLists.txt for a simple AVR project based on the toolchain
##################################################################################

cmake_minimum_required(VERSION 2.8)

### TOOLCHAIN SETUP AREA #########################################################
# Set any variables used in the toolchain prior project() call. In that
# case they are already set and used.
##################################################################################

##################################################################################
# tools to be used for programming the AVR
##################################################################################
set(AVR_UPLOADTOOL avrdude)
set(AVR_UPLOADTOOL_PORT %PROGPORT%)
set(AVR_PROGRAMMER %PROG%)
set(AVR_UPLOAD_BAUDRATE %UPLOAD_BAUDRATE%)
set(AVR_UPLOADTOOL_OPTIONS %UPLOAD_OPTIONS%)

set(WITH_MCU OFF)
set(WITH_MCU OFF CACHE BOOL "Add the mCU type to the target file name." FORCE)

##################################################################################
# AVR and fuses needs to be set
##################################################################################
set(AVR_MCU %MCU%)
set(AVR_H_FUSE "")
set(AVR_L_FUSE "")
set(AVR_E_FUSE "")

##################################################################################
# needs to be defined for AVR toolchain
##################################################################################
set(AVR_MCU_SPEED "%FREQUENCY%UL")

### END TOOLCHAIN SETUP AREA #####################################################

find_package(Generic-AVR-GCC)

##################################################################################
# name your project
##################################################################################
project(EXAMPLE)
set(CMAKE_BUILD_TYPE Release)

##################################################################################
# set command line arguments for compiler
##################################################################################
add_definitions("-fpack-struct")
add_definitions("-fshort-enums")
add_definitions("-Wall")
add_definitions("-Werror")
# http://gcc.gnu.org/onlinedocs/gcc-4.8.2/gcc/Alternate-Keywords.html#Alternate-Keywords
# [...]-pedantic and other options cause warnings for many GNU C extensions. You can prevent such warnings within
# one expression by writing __extension__ before the expression. __extension__ has no effect aside from this.[...]
add_definitions("-pedantic")
add_definitions("-pedantic-errors")
add_definitions("-funsigned-char")
add_definitions("-funsigned-bitfields")
add_definitions("-ffunction-sections")
add_definitions("-c")
add_definitions("-std=gnu99")

##################################################################################
# add AVR executable - (<executable-name> <sources> <headers>)
##################################################################################
add_avr_executable(
   %ProjectName% main.cpp
)

##################################################################################
# add AVR library
##################################################################################
#add_avr_library(
#   <library-name>
#   <sources> <headers>
#)

##################################################################################
# link library to executable
# NOTE: It needs to be the elf target.
##################################################################################
# target_link_libraries(<executable-name>-${AVR_MCU}.elf <library-name>-${AVR_MCU})
# OR easier
#target_link_libraries(<executable-name> <library-name> <some-external-libary>)
