;NECULA EDUARD-IONUT 322 CA @2020
%include "io.mac"

section .text
    global caesar
    extern printf

caesar:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     edx, [ebp + 8]      ; ciphertext;
    mov     esi, [ebp + 12]     ; plaintext;
    mov     edi, [ebp + 16]     ; key
    mov     ecx, [ebp + 20]     ; length;
    ;; DO NOT MODIFY
    ;; TODO: Implement the caesar cipher

    xor eax, eax
    cmp eax, edi; daca nu fac permutari
    jz fara_permutari
    cmp eax, edi; daca fac permutari
    jl top
 
fara_permutari:
    mov bl, [esi]; iau primul byte din mesaj
    mov byte [edx], bl;
    inc esi; trec la urm byte
    inc edx; trec la urm byte
    loop fara_permutari; cat timp ecx > 0
    jmp out

process_small_char:
    mov bl, 'a'
    dec ecx
    jmp for

process_big_char: 
    mov bl, 'A'
    dec ecx
    jmp for

spatiu:
    dec bl
    jmp jump_in_for

ch_special_1:
    dec bl 
    jmp jump_in_for
;aici incepe functia principala
;iterez caracter cu caracter prin mesaj
top:
    mov bl, [esi]; iau primul byte din mesaj
    push ecx; in ecx se tine cheia, pentru a o folosi in for
    xor ecx, ecx
    mov ecx, edi
    
for:
    inc bl; incrementez caracterul pana cand se termina valoarea cheii

    ;caracterele speciale dintre [0- 64]
    cmp bl, 65; A
    jl ch_special_1

    ;caracterele speciale dintre [123- 127]
    cmp bl, 127;
    je ch_special_1

    cmp bl, 126
    je ch_special_1

    cmp bl, 125
    je ch_special_1

    cmp bl, 124
    je ch_special_1

    ;caracterele speciale dintre [91- 96]
    cmp bl, 92
    je ch_special_1

    cmp bl, 93
    je ch_special_1

    cmp bl, 94
    je ch_special_1

    cmp bl, 95
    je ch_special_1

    cmp bl, 96
    je ch_special_1

    cmp bl, 97
    je ch_special_1

    ;alfabetul [a- z]
    cmp bl, 122
    jg process_small_char ;daca este mai mare decat z, devine a

    ;alfabetul [A- Z]
    cmp bl, 91
    je process_big_char ;daca este mai mare decat Z, devine A

jump_in_for:

    dec ecx
    cmp ecx, 0
    jne for;daca cheia nu se termina, se revine in for
    pop ecx

    mov byte [edx], bl; caracterul se pune in edx
    inc esi; trec la urmatorul byte
    inc edx; trec la urmatorul byte
    loop top; cat timp ecx > 0

    ;; DO NOT MODIFY

out:

    popa
    leave
    ret
    ;; DO NOT MODIFY