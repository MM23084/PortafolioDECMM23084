section .data
    num1 db 5          ; Primer número (8 bits)
    num2 db 3          ; Segundo número (8 bits)
    msg db "Resultado: ", 0xA  ; Mensaje + salto de línea
    msg_len equ $ - msg
    buffer times 4 db 0 ; Buffer para dígitos ASCII (máx 3 dígitos + null)

section .text
    global _start

_start:
    ; Multiplicación (8 bits) 
    mov al, [num1]     ; al = num1 (8 bits)
    mov bl, [num2]     ; bl = num2 (8 bits)
    mul bl             ; ax = al * bl (resultado en AX)

    ; Convertir resultado a ASCII
    ; El resultado está en AX (pero como usamos números pequeños, solo usamos AL)
    movzx eax, al      ; Extender AL a 32 bits (para división)
    mov ebx, 10        ; Divisor
    mov ecx, buffer + 3 ; Puntero al final del buffer
    mov byte [ecx], 0  ; Null-terminator

    convertir_digitos:
        xor edx, edx   ; Limpiar EDX
        div ebx        ; eax = eax / 10, edx = resto
        add dl, '0'    ; Convertir resto a ASCII
        dec ecx        ; Mover puntero hacia atrás
        mov [ecx], dl  ; Almacenar dígito
        test eax, eax  ; 
        jnz convertir_digitos

    ; Imprimir mensaje
    mov eax, 4         ; sys_write
    mov ebx, 1         ; stdout
    mov ecx, msg       ; Mensaje
    mov edx, msg_len   ; Longitud
    int 0x80

    ; Imprimir resultado
    mov eax, 4
    mov ebx, 1
    mov edx, buffer + 4
    sub edx, ecx       ; Calcular longitud del número
    int 0x80

    ; === Salir ===
    mov eax, 1         ; sys_exit
    xor ebx, ebx       ; Código de retorno 0
    int 0x80
