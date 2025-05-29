section .data
    num1 dw 50         ; Primer número (16 bits)
    num2 dw 20         ; Segundo número (16 bits)
    num3 dw 10         ; Tercer número (16 bits)
    msg db "Resultado: ", 0xA  ; Mensaje + salto de línea
    msg_len equ $ - msg
    buffer times 5 db 0 ; Buffer para almacenar dígitos ASCII

section .text
    global _start

_start:
    ;  Resta usando solo registros de 16 bits 
    mov ax, [num1]     ; ax = num1 (16 bits)
    sub ax, [num2]     ; ax = ax - num2 (16 bits)
    sub ax, [num3]     ; ax = ax - num3 (16 bits)
    ; El resultado está en AX (16 bits)

    ;  Convertir el resultado a ASCII 
    ; Usamos registros de 32 bits solo por compactibilidad 
    movzx eax, ax      ; Extender AX a 32 bits (sin signo)
    mov ebx, 10        ; Divisor (para convertir dígitos)
    mov ecx, buffer + 4 ; Puntero al final del buffer
    mov byte [ecx], 0  ; Null-terminator

    convertir_digitos:
        xor edx, edx   ; Limpiar EDX 
        div ebx        ; eax = eax / 10, edx = resto
        add dl, '0'    ; Convertir resto a ASCII
        dec ecx        ; Mover el puntero hacia atrás
        mov [ecx], dl  ; Almacenar el dígito
        test eax, eax  ;
        jnz convertir_digitos

    ; === Imprimir el mensaje ===
    mov eax, 4         ; sys_write
    mov ebx, 1         ; stdout
    mov ecx, msg       ; Mensaje
    mov edx, msg_len   ; Longitud del mensaje
    int 0x80

    ; === Imprimir el resultado ===
    mov eax, 4         ; sys_write
    mov ebx, 1         ; stdout
    mov edx, buffer + 5
    sub edx, ecx       ; Calcular longitud del número
    int 0x80

    ; === Salir ===
    mov eax, 1         ; sys_exit
    xor ebx, ebx       ; Código de retorno 0
    int 0x80
