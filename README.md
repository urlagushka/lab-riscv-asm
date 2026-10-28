# lab-riscv-asm

В данном репозитории представлен набор файлов, которые соответствуют программе, решающую следующую задачу:
```txt
Найти сумму положительных элементов массива. (N = 4, M = 2)
```
Файлы:
* `task.c` - программа на языке C,
* `task.S` - программа на языке ASM RISC-V,
* `task.dump` - ASM dump файл.

## Компиляция C программы в исполняемый файл
```sh
gcc task.c -o task
```

## Компиляция ASM программы в ELF файл (ISA ILP32)
```sh
riscv64-unknown-elf-gcc -march=rv32i -mabi=ilp32 task.c -o task.elf
```

## Получение ASM dump файла
```sh
riscv64-unknown-elf-objdump -D task.elf > task.dump
```
