INCLUDE(CMakeDependentOption)

SET(CONFIG_ARCH "x64" CACHE STRING "Build: Targets specified architecture.")
SET_PROPERTY(CACHE CONFIG_ARCH PROPERTY STRINGS "x64;aa64")

SET(CONFIG_TOOLCHAIN "llvm" CACHE STRING "Build: Selects active toolchain.")
SET_PROPERTY(CACHE CONFIG_TOOLCHAIN PROPERTY STRINGS "gnu;llvm")

OPTION(CONFIG_BOOT "Boot: Builds an EFI-capable bootloader alongside the kernel." ON)
CMAKE_DEPENDENT_OPTION(CONFIG_BOOT_PACK "Boot: Creates EFI-capable boot media." ON "CONFIG_BOOT" OFF)

INCLUDE(${SCRIPTS}/OaSYS.BOOT.cmake)