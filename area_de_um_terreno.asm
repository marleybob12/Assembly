
.data
ms1: .asciiz "A area do terreno e: "
ms2: .asciiz "Insira a dimensao do terreno: "
ms3: .asciiz "Insira a outra dimensao: "

.text
.globl main

main:
    # Ler o comprimento
    li $v0, 4
    la $a0, ms2
    syscall

    li $v0, 5
    syscall
    move $t0, $v0

    # Ler a largura
    li $v0, 4
    la $a0, ms3
    syscall

    li $v0, 5
    syscall
    move $t1, $v0

    # Calcular a area
    mul $t2, $t0, $t1

    # Exibir mensagem
    li $v0, 4
    la $a0, ms1
    syscall

    # Exibir resultado
    li $v0, 1
    move $a0, $t2
    syscall

    # Encerrar programa
    li $v0, 10
    syscall
