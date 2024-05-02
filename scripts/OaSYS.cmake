INCLUDE(CMakeDependentOption)

# Multi-state options.

SET(CONFIG_ARCH "x64" CACHE STRING "Build: Target specified architecture.")
SET_PROPERTY(CACHE CONFIG_ARCH PROPERTY STRINGS "x64;aa64")

SET(CONFIG_TOOLCHAIN "llvm" CACHE STRING "Build: Select active toolchain.")
SET_PROPERTY(CACHE CONFIG_TOOLCHAIN PROPERTY STRINGS "gnu;llvm")

# Conventional options.

OPTION(CONFIG_BOOT "Boot: Builds an EFI-capable bootloader alongside the kernel." ON)
CMAKE_DEPENDENT_OPTION(CONFIG_BOOT_PACK "Boot: Create EFI-capable boot media." ON "CONFIG_BOOT" OFF)
CMAKE_DEPENDENT_OPTION(CONFIG_BOOT_GREET "Boot: Greet user." ON "CONFIG_BOOT" OFF)

INCLUDE(${SCRIPTS}/OaSYS.BOOT.cmake)
