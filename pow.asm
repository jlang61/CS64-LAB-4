# pow.asm program
#

# C++ (NON-RECURSIVE) code snippet of pow(x,n):
#   int x, n, pow=1; 
#   cout << "Enter a number x:\n"; 
#   cin >> x;
#   cout << "Enter the exponent n:\n"; 
#   cin >> n; 
#   for (int i = 1; i <= n; i++) { 
#   	pow = pow * x; 
#   } 
#   cout << "Power(x,n) is:\n" << pow << "\n";
#
# Assembly (NON-RECURSIVE) code version of pow(x,n):
#
.data
	number: .asciiz "Enter a number x:\n"
	exponent: .asciiz "Enter the exponent n:\n"
	output: .asciiz "Power(x,n) is:\n"
	newline: .asciiz "\n"
	# TODO: Write your initializations here

#Text Area (i.e. instructions)
.text
main:
	# t0 contains number while t1 contains exponent
	li $v0 4 
	la $a0 number
	syscall 

	li $v0 5 
	syscall 
	move $t0 $v0 

	li $v0 4
	la $a0 exponent
	syscall 

	li $v0 5 
	syscall 
	move $t1 $v0 
	

	
	
	# t2 contains copy of t0
	move $t2 $t0 



	bne $t1 0 loop

	li $t2 1
	j print
	 



loop:

	beq $t1, 1, print	
	mult $t2, $t0 
	mflo $t2 
	addi $t1, $t1, -1
	j loop 

print:
	
	li $v0 4 
	la $a0 output
	syscall 

	li $v0 1 
	move $a0 $t2 
	syscall 

	li $v0 4 
	la $a0 newline
	syscall
	 
	j exit

exit:
	li $v0 10 
	syscall 
	# TODO: Write code to properly exit a SPIM simulation
