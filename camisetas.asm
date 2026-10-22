
.data
msg1: .asciiz "Quantidade de camisetas pequenas: "
msg2: .asciiz "Quantidade de camisetas medias: "
msg3: .asciiz "Quantidade de camisetas grandes: "
msg4: .asciiz "Valor arrecadado: R$ "

.text
.globl main
main:
    li $v0, 4
    la $a0, msg1
    syscall
    li $v0, 5
    syscall
    move $t0, $v0

    li $v0, 4
    la $a0, msg2
    syscall
    li $v0, 5
    syscall
    move $t1, $v0

    li $v0, 4
    la $a0, msg3
    syscall
    li $v0, 5
    syscall
    move $t2, $v0

    # Pequenas * 10
    li $t3, 10
    mul $t0, $t0, $t3

    # Medias * 12
    li $t3, 12
    mul $t1, $t1, $t3

    # Grandes * 15
    li $t3, 15
    mul $t2, $t2, $t3

    # Somar os valores
    add $t4, $t0, $t1
    add $t4, $t4, $t2

    li $v0, 4
    la $a0, msg4
    syscall
    li $v0, 1
    move $a0, $t4
    syscall

    li $v0, 10
    syscall
