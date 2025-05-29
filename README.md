# Portafolio de Ejercicios en Ensamblador - MM23084 

Este portafolio contiene una serie de ejercicios desarrollados en lenguaje ensamblador. Cada ejercicio implementa una operación aritmética básica utilizando instrucciones de bajo nivel. El propósito de estos ejercicios es reforzar el entendimiento del manejo de registros, operaciones aritméticas y la lógica de programación en ensamblador.

## Contenido

### Ejercicio 1 - Resta de 16 bits
- **Archivo fuente:** `resta_16bits.asm`
- **Descripción:** Resta dos números de 16 bits utilizando instrucciones aritméticas básicas del procesador.
- **Compilación:**
  ```bash
  nasm -f elf32 resta_16bits.asm -o resta_16bits.o
  ld -m elf_i386 resta_16bits.o -o resta_16bits
  ```
- **Ejecución:**
  ```bash
  ./resta_16bits
  ```

---

### Ejercicio 2 - Multiplicación de 8 bits
- **Archivo fuente:** `multiplicacion_8bits.asm`
- **Descripción:** Multiplica dos números de 8 bits usando registros apropiados para asegurar el resultado correcto.
- **Compilación:**
  ```bash
  nasm -f elf32 multiplicacion_8bits.asm -o multiplicacion_8bits.o
  ld -m elf_i386 multiplicacion_8bits.o -o multiplicacion_8bits
  ```
- **Ejecución:**
  ```bash
  ./multiplicacion_8bits
  ```

---

### Ejercicio 3 - División de 32 bits
- **Archivo fuente:** `division_32bits.asm`
- **Descripción:** Realiza la división de dos números de 32 bits, mostrando el cociente y el residuo.
- **Compilación:**
  ```bash
  nasm -f elf32 division_32bits.asm -o division_32bits.o
  ld -m elf_i386 division_32bits.o -o division_32bits
  ```
- **Ejecución:**
  ```bash
  ./division_32bits
  ```

---

## Requisitos

- NASM (Netwide Assembler)
- Sistema Linux con soporte para ejecutables ELF de 32 bits
- (Opcional) GDB para depuración

## Autor

Ricardo Antonio Mora Morales - MM23084 
Estudiante de Ingeniería en Desarrollo de Software  
Universidad de El Salvador
