%include "io.mac"

section .text
    global bin_to_hex
    extern printf
section .rodata
    hex: db "0123456789abcdef"

bin_to_hex:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     edx, [ebp + 8]      ; hexa_value
    mov     esi, [ebp + 12]     ; bin_sequence; el are eax
    mov     ecx, [ebp + 16]     ; length
    ;; DO NOT MODIFY


    ;; TODO: Implement bin to hex

    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY