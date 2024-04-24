CMAKE_MINIMUM_REQUIRED(VERSION 3.1...3.29)

MESSAGE(STATUS "OaSYS.Kernel")

OPTION(CONFIG_BOOT "Boot: Builds and packages a bootloader alongside the kernel." ON) 
OPTION(CONFIG_BOOT_EFI "Boot: Builds EFI-capable image." ON)
OPTION(CONFIG_BOOT_EFI_PACK "Boot: Creates EFI-capable boot media." ON)

PROJECT(
	OASYS
	VERSION 1.1.1.1
	LANGUAGES C ASM)

SET(SCRIPTS ${PROJECT_SOURCE_DIR}/scripts)
INCLUDE(${SCRIPTS}/OaSYS.cmake)

CONFIGURE_FILE(
    "${PROJECT_SOURCE_DIR}/include/oasys/oasys.h.in"
    "${PROJECT_BINARY_DIR}/include/oasys/oasys.h")
