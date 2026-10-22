
.data
msg1: .asciiz "Digite um numero (negativo para terminar): "
msg2: .asciiz "Valor invalido! Digite de 0 a 100.\n"
msg3: .asciiz "\nQuantidade de 0 a 25: "
msg4: .asciiz "\nQuantidade de 26 a 50: "
msg5: .asciiz "\nQuantidade de 51 a 75: "
msg6: .asciiz "\nQuantidade de 76 a 100: "

.text
.globl main
main:
    # Inicializar contadores
    li $t0, 0
    li $t1, 0
    li $t2, 0
    li $t3, 0

ler:
    li $v0, 4
    la $a0, msg1
    syscall
    li $v0, 5
    syscall
    move $t4, $v0

    # Negativo encerra a entrada
    blt $t4, $zero, mostrar

    # Validar limite superior
    bgt $t4, 100, invalido

    # Intervalo de 0 a 25
    ble $t4, 25, faixa1

    # Intervalo de 26 a 50
    ble $t4, 50, faixa2

    # Intervalo de 51 a 75
    ble $t4, 75, faixa3

    # Intervalo de 76 a 100
    addi $t3, $t3, 1
    j ler

faixa1:
    addi $t0, $t0, 1
    j ler

faixa2:
    addi $t1, $t1, 1
    j ler

faixa3:
    addi $t2, $t2, 1
    j ler

invalido:
    li $v0, 4
    la $a0, msg2
    syscall
    j ler

mostrar:
    li $v0, 4
    la $a0, msg3
    syscall
    li $v0, 1
    move $a0, $t0
    syscall

    li $v0, 4
    la $a0, msg4
    syscall
    li $v0, 1
    move $a0, $t1
    syscall

    li $v0, 4
    la $a0, msg5
    syscall
    li $v0, 1
    move $a0, $t2
    syscall

    li $v0, 4
    la $a0, msg6
    syscall
    li $v0, 1
    move $a0, $t3
    syscall

    li $v0, 10
    syscall
