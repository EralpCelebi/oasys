CMAKE_MINIMUM_REQUIRED(VERSION 3.1...3.29)

MESSAGE(STATUS "OaSYS.Kernel")

OPTION(CONFIG_BOOT_EFI "Boot: Builds EFI-capable image." ON)

PROJECT(
	OASYS
	VERSION 1.1.1.1
	LANGUAGES C ASM)

IF(CONFIG_BOOT_EFI)
	add_subdirectory(boot)
ENDIF()

CONFIGURE_FILE(
    "${PROJECT_SOURCE_DIR}/include/oasys/oasys.h.in"
    "${PROJECT_BINARY_DIR}/include/oasys/oasys.h")
