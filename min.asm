# min.asm program
#

.data

        # TODO: Complete these declarations / initializations

    prompt: .asciiz "Enter the next number:\n"
    min: .asciiz "Minimum: "
    newline: .asciiz "\n"

#Text Area (i.e. instructions)
.text

main:

    li $v0 4
    la $a0 prompt
    syscall 

    li $v0 5
    syscall
    move $t0 $v0

    li $v0 4
    la $a0 prompt
    syscall 

    li $v0 5
    syscall
    move $t1 $v0
    
    li $v0 4
    la $a0 prompt
    syscall 

    li $v0 5
    syscall
    move $t2 $v0

    li $v0 4
    la $a0 min
    syscall
    # COMPARE FIRST AND SECOND TO DETERMINE WHICH ONE IS SMALLER
    # THEN COMPARE SECOND AND THIRD TO DETERMINE WHICH ONE IS SMALLER 

    # sets t3 to 1 if first source is less than the second source 
    ble $t0, $t1, firstNumberSmaller
    j secondNumberSmaller

firstNumberSmaller:
    ble $t0, $t2, firstNumberFINAL
    j thirdNumberFINAL

secondNumberSmaller:
    ble $t1, $t2, secondNumberFINAL
    j thirdNumberFINAL
    

firstNumberFINAL:
    li $v0 1
    move $a0 $t0
    syscall
    j exit

secondNumberFINAL:
    li $v0 1
    move $a0 $t1
    syscall
    j exit

thirdNumberFINAL:
    li $v0 1
    move $a0 $t2
    syscall
    j exit
        # TODO: Write your code here
    # You can have other labels expressed here, if you need to

exit:
    li $v0 10 
    syscall
        # TODO: Write code to properly exit a SPIM simulation