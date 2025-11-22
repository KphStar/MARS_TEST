.data
fizz:       .asciiz "Fizz\n"
buzz:       .asciiz "Buzz\n"
fizzbuzz:   .asciiz "FizzBuzz\n"
newline:    .asciiz "\n"

.text
.globl main

main:
    li $t0, 1           # n = 1
    li $t1, 100         # limit = 100

loop:
    bgt $t0, $t1, end   # if n > 100 -> end

    # Check if divisible by 15
    li $t2, 15
    div $t0, $t2
    mfhi $t3            # remainder in $t3
    beqz $t3, print_fizzbuzz

    # Check if divisible by 3
    li $t2, 3
    div $t0, $t2
    mfhi $t3
    beqz $t3, print_fizz

    # Check if divisible by 5
    li $t2, 5
    div $t0, $t2
    mfhi $t3
    beqz $t3, print_buzz

    # Otherwise print the number
    move $a0, $t0
    li $v0, 1           # print integer syscall
    syscall

    # Print newline
    la $a0, newline
    li $v0, 4
    syscall

    j increment

print_fizzbuzz:
    la $a0, fizzbuzz
    li $v0, 4
    syscall
    j increment

print_fizz:
    la $a0, fizz
    li $v0, 4
    syscall
    j increment

print_buzz:
    la $a0, buzz
    li $v0, 4
    syscall
    j increment

increment:
    addi $t0, $t0, 1
    j loop

end:
    li $v0, 10          # exit
    syscall
