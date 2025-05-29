section .data
    dividendo dd 50      ; 32 bits
    divisor dd 3         ; 32 bits
    msg_cociente db "Cociente: ", 0
    msg_resto db "Resto: ", 0
    newline db 0xA

section .bss
    buffer resb 10       ; Buffer para conversión

section .text
    global _start

_start:
    ; División
    mov eax, [dividendo] ; Cargar dividendo
    xor edx, edx         ; Limpiar EDX (¡IMPORTANTE!)
    div dword [divisor]  ; EAX = cociente, EDX = resto

    ; Imprimir cociente
    push edx             ; Preservar resto
    push eax             ; Preservar cociente
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_cociente
    mov edx, 10
    int 0x80

    pop eax              ; Recuperar cociente
    call imprimir_numero

    ; Imprimir resto
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_resto
    mov edx, 7
    int 0x80

    pop eax              ; Recuperar resto (estaba en EDX)
    call imprimir_numero

    ; Salir
    mov eax, 1
    xor ebx, ebx
    int 0x80

imprimir_numero:
    mov edi, buffer + 9
    mov byte [edi], 0
    mov ebx, 10

    convertir:
        xor edx, edx
        div ebx
        add dl, '0'
        dec edi
        mov [edi], dl
        test eax, eax
        jnz convertir

    mov eax, 4
    mov ebx, 1
    mov ecx, edi
    mov edx, buffer + 10
    sub edx, edi
    int 0x80

    ; Imprimir newline
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80
    ret
