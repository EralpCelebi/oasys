#include <efi.h>
#include <efilib.h>
#include <oasys/oasys.h>

EFI_STATUS efi_main(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE* SystemTable) {
    EFI_STATUS    Status;
    EFI_INPUT_KEY Key;

    ST = SystemTable;

    Status = ST->ConOut->OutputString(ST->ConOut, L"OaSYS.Kernel\r\n");
    if (EFI_ERROR(Status)) return Status;

    Status = ST->ConIn->Reset(ST->ConIn, FALSE);
    if (EFI_ERROR(Status)) return Status;

#ifdef CONFIG_BOOT_GREET
    CHAR16* Messages[] = { L"Architecture: ", L"Toolchain: ", L"Version: " };
    CHAR16* Outputs[]  = { CONFIG_ARCH L"\r\n", CONFIG_TOOLCHAIN L"\r\n", OASYS_VERSION L"\r\n" };

    for (uint8_t Index; Index < 3; Index++) {
        Status = ST->ConOut->OutputString(ST->ConOut, Messages[Index]);
        if (EFI_ERROR(Status)) return Status;

        Status = ST->ConOut->OutputString(ST->ConOut, Outputs[Index]);
        if (EFI_ERROR(Status)) return Status;

        Status = ST->ConIn->Reset(ST->ConIn, FALSE);
        if (EFI_ERROR(Status)) return Status;
    }
#endif

    while ((Status = ST->ConIn->ReadKeyStroke(ST->ConIn, &Key)) == EFI_NOT_READY) {}

    return Status;
}
