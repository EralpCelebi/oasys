SET(CMAKE_SYSTEM_NAME Generic)
SET(CMAKE_C_COMPILER   clang)
SET(CMAKE_ASM_COMPILER clang)

SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

SET(CMAKE_COMPILE_OPTIONS -I/usr/local/include/efi -ffreestanding -target aarch64-unknown-windows -ffreestanding -fshort-wchar -mno-red-zone)
SET(CMAKE_LINK_OPTIONS -target aarchs64-unknown-windows -nostdlib -Wl,-entry:efi_main -Wl,-subsystem:efi_application -fuse-ld=lld-link)