INCLUDE(CMakeDependentOption)

OPTION(CONFIG_BOOT "Boot: Builds and packages a bootloader alongside the kernel." ON) 
CMAKE_DEPENDENT_OPTION(CONFIG_BOOT_EFI "Boot: Builds EFI-capable image." ON "CONFIG_BOOT" OFF)
CMAKE_DEPENDENT_OPTION(CONFIG_BOOT_EFI_PACK "Boot: Creates EFI-capable boot media." ON "CONFIG_BOOT_EFI" OFF)

INCLUDE(${SCRIPTS}/OaSYS.BOOT.cmake)