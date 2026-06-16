[bits 16]
[org 0x7C00]

mov ax, 0x07C0
mov ds, ax

mov si, msg

print:
    lodsb
    or al, al
    jz halt
    mov ah, 0x0E
    int 0x10
    jmp print

halt:
    cli
    hlt

msg db "Pie Kernel v0.1", 0

times 510-($-$$) db 0
dw 0xAA55