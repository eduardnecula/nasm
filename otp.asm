;NECULA EDUARD-IONUT 322CA @2020
%include "io.mac"

BUFMAX equ 128

section .bss
	buffer resb 128

section .text
    global otp
    extern printf

otp:

    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     edx, [ebp + 8]      ; ciphertext
    mov     esi, [ebp + 12]     ; plaintext
    mov     edi, [ebp + 16]     ; key
    mov     ecx, [ebp + 20]     ; length
    ;; DO NOT MODIFY
    ;; TODO: Implement the One Time Pad cipher
    ;iterez caracter cu caracter, apoi xorez
top:
	mov bl, byte [esi]; iau primul byte din mesaj
	xor bl, byte [edi]; iau primul byte din cheie
	mov byte [edx], bl; le xorez si le pun in edx

	inc esi; trec la urmatorul byte
	inc edi; trec la urm byte
	inc edx; trec la urm byte

	loop top; cat timp ecx > 0

    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY