;NECULA EDUAR-IONUT 322 CA @2020
%include "io.mac"

section .text
    global vigenere
    extern printf

;section .bss
 ;   buffer resb 128

vigenere:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     edx, [ebp + 8]      ; ciphertext
    mov     esi, [ebp + 12]     ; plaintext
    mov     ecx, [ebp + 16]     ; plaintext_len
    mov     edi, [ebp + 20]     ; key
    mov     ebx, [ebp + 24]     ; key_len
    ;; DO NOT MODIFY
    ;; TODO: Implement the Vigenere cipher

    xor eax, eax
    xor ebx, ebx

vigenere_cipher:
    xor eax, eax
    xor ebx, ebx
                
    mov al, [esi]           ; octetul curent din string
    mov bl, [edi]
                
    test al, al
    jz out
    ;daca dau de urmatoarele caractere, le afisez si atat
    ;nu voi trece la urmatorul caracter din cheie
    cmp al, '_'

    je fara_caractere_speciale

    cmp al, '['
    je fara_caractere_speciale

    cmp al, '\'
    je fara_caractere_speciale

    cmp al, ']'
    je fara_caractere_speciale

    cmp al, '^'
    je fara_caractere_speciale

    cmp al, '`'
    je fara_caractere_speciale

    cmp al, 'A'; daca al < A, printez caracterele
    jb fara_caractere_speciale

    cmp al, 'z'; daca al > z, prntez caracterele
    ja fara_caractere_speciale

    cmp al, 'A'; daca caracterul al > A
    jge litera_mare

    jmp fara_caractere_speciale; in caz ca nu dau peste un caracter alfabetic

litera_mica:
    cmp al, 'z'; se compara caracterul al cu z
    jg next_char; daca caracterul este mai mare se trece la urmatorul caracter
    add bl, 'a' - 'A'; se va transforma caracterul bl din litera mare in litera mica
    sub bl, 'a'; in bl se vor pune nr de permutari ale caracterului al
    add al, bl; se permuta al cu bl
    cmp al, 'z' + 1; se compara caracterul al cu z
    jb put_char; daca al <= z se afiseaza
    xor ebx, ebx
    mov bl,  'z' -'a'; in bl se pune distanta intre z si a
    sub al, bl; se permuta al cu bl
    dec al
    jmp put_char; se afiseaza noul caracter al

litera_mare:
    cmp al, 'Z'; daca caracterul al < Z
    jg litera_mica; daca al > z, ma duc la litera mica
    sub bl, 'A'; in bl se pune nr de permutari
    add al, bl;  la caracter se adauga nr de permutari
    cmp al, 'Z' + 1; compar daca caracterul este mai mare decat Z
    jb put_char; daca este mai mic sau egal cu Z, afisez caracterul
    ;daca ajung aici inseamna ca acest caracter va incepe iar alfabetul
    xor ebx, ebx
    mov bl,  'Z' -'A'; in bl se pune distanta de la Z la A
    sub al, bl; se scade din al, distanta bl 
    dec al
    jmp put_char; afisez noul caracter

put_char:
    inc edi; nu trec la urmatoarea litera din cheie decat daca am un caracter

fara_caractere_speciale:
    mov byte [edx], al; in edx se pune caracterul de afisat
    inc edx; se trece la urmatorul caracter, in care voi afisa
    cmp byte [edi], 0; se verifica terminarea cheii
    jne next_char
    mov edi, [ebp + 20]; daca cheia este goala, se reia
                
next_char:
    inc esi; se trece la urmatorul caracter din mesaj
    xor eax, eax
    loop vigenere_cipher; cat timp nr de caractere din sir este diferit de 0

out:

    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY