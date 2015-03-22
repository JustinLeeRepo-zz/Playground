#Justin Lee
#997416419

# Lab 6 Skeleton. Add your code to this file
# EEC 70, Winter 2013
#

	.data

# Note I have created a graph with 10 nodes, but I am using only 7
# Your program should work with any number of nodes less than 10

Graph:
	.word	0, 1, 1, 0, 0, 1, 1, 0, 0, 0
	.word	1, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.word	1, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.word	0, 0, 0, 0, 1, 1, 0, 0, 0, 0
	.word	0, 0, 0, 1, 0, 1, 1, 0, 0, 0
	.word	1, 0, 0, 1, 1, 0, 0, 0, 0, 0
	.word	1, 0, 0, 0, 1, 0, 0, 0, 0, 0
	.word	0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.word	0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.word	0, 0, 0, 0, 0, 0, 0, 0, 0, 0


welcomemsg:
	.asciiz "\nWelcome to Depth First Search Traversal in MAL\n"

# Your data declarations here
#16 user input
#30 graph address
#23 discovered address
discovered:
	.word	0, 0, 0, 0, 0, 0, 0, 0, 0, 0
A:	.byte	'A'
B:	.byte	'B'
C:	.byte	'C'
D:	.byte	'D'
E:	.byte	'E'
F:	.byte	'F'
G:	.byte	'G'
H:	.byte	'H'
I:	.byte	'I'
J:	.byte	'J'

prompt:
	.asciiz "\nEnter a rood node number. Enter 0 to quit: "
arrow:
	.asciiz	" -> "

	.text
	.align 2				# this is to say that code is aligned. Not strictly needed but good practice
	.globl main			# --start gets replaced by main in MAL and it is a global symbol

main:
	li	$v0, 4			# Print welcome message $v0 contains the code and $a0 is pointer to the beginning of the message
	la	$a0, welcomemsg
	syscall

# Your code starts here

#user prompt

	li	$v0, 4			#outputs input prompt
	la	$a0, prompt 
	syscall


	la	$30, Graph

	la	$23, discovered
	li	$8, 0

initialize:
	sw	$0, 0($23)		#reinitialize all values in stack to 0
	add	$23, $23, 4		#increment stack address
	add	$8, $8, 1
	beq	$8, 10, end_init
	j	initialize
#user input
end_init:
	la	$23, discovered		#restore address because of previous increments
	li	$v0, 5
	syscall	
	add	$16, $v0, 0		#store int user inputs
	
	beqz	$16, rdone		#exit if user inputs 0

	mul	$8, $16, 4
	sub	$8, $8, 4
	add	$9, $23, $8
	sw	$16, ($9)		#save first vertex into used stack

	add	$4, $0, $16		#pass in parameter to print first vertex
	jal	print
	jal	DFS
	j	rerun		#once done looking at all adjacent edges and childs

r_DFS:	sw	$31, 0($sp)	#come here if child n
	add	$sp, $sp, -4
	add	$16, $0, $4	#set parent node as newly discovered node passed in
	jal	DFS
#pop off ra
	add	$sp, $sp, 4
	lw	$31, 0($sp)
	jr	$31

DFS:	sw	$31, 0($sp)
	add	$sp, $sp, -4
	li	$12, 1		#counter varialbe initialized
	sub	$11, $16, 1
	mul	$11, $11, 40	#offset	

for:	li	$9, 11		#check for end of row
	beq	$12, $9, return_

	add	$13, $30, $11	#address of edge to check
	lw	$14, ($13)
	li	$9, 1

	beq	$14, $9, adjacentEdge	#value at address will be 1 if edge
	add	$12, $12, 1
	add	$11, $11, 4
	j	for

return_:

	add	$sp, $sp, 4		#pop off ra
	lw	$31, 0($sp)		
	jr	$31




adjacentEdge:
	lw	$9, 0($23)
	beq	$12, $9, alreadydiscovered

	lw	$9, 4($23)
	beq	$12, $9, alreadydiscovered

	lw	$9, 8($23)
	beq	$12, $9, alreadydiscovered

	lw	$9, 12($23)
	beq	$12, $9, alreadydiscovered

	lw	$9, 16($23)
	beq	$12, $9, alreadydiscovered

	lw	$9, 20($23)
	beq	$12, $9, alreadydiscovered

	lw	$9, 24($23)
	beq	$12, $9, alreadydiscovered

	lw	$9, 28($23)
	beq	$12, $9, alreadydiscovered

	lw	$9, 32($23)
	beq	$12, $9, alreadydiscovered

	lw	$9, 36($23)
	beq	$12, $9, alreadydiscovered

	mul	$8, $12, 4
	sub	$8, $8, 4
	add	$9, $23, $8
#setting vertex as discovered
	
	sw	$12, ($9)	
#print	newly discovered vertex
	add	$4, $0, $12
	jal	print

#save index, offset, and parent node in stack
	sw	$12, 0($sp)
	add	$sp, $sp, -4
	sw	$11, 0($sp)
	add	$sp, $sp, -4
	sw	$16, 0($sp)
	add	$sp, $sp, -4
#pass in child node as parameter
	add	$4, $0, $12


	jal	r_DFS
#restore index, offset, and parent node
	add	$sp, $sp, 4
	lw	$16, 0($sp)
	add	$sp, $sp, 4
	lw	$11, 0($sp)
	add	$sp, $sp, 4
	lw	$12, 0($sp)
	
#pop off ra and return
	add	$12, $12, 1
	add	$11, $11, 4
	j	for	


alreadydiscovered:	#pop ra off and return to continue through parent node row
	add	$12, $12, 1
	add	$11, $11, 4
	j	for









print:	sw	$31, 0($sp)
	add	$sp, $sp, -4

	add	$9, $0, $4	#$4 is $12 new vertex

	li	$8, 1
	beq	$9, $8, print_A

	li	$8, 2
	beq	$9, $8, print_B

	li	$8, 3
	beq	$9, $8, print_C

	li	$8, 4
	beq	$9, $8, print_D

	li	$8, 5
	beq	$9, $8, print_E

	li	$8, 6
	beq	$9, $8, print_F

	li	$8, 7
	beq	$9, $8, print_G

	li	$8, 8
	beq	$9, $8, print_H

	li	$8, 9
	beq	$9, $8, print_I

	li	$8, 10
	beq	$9, $8, print_J

print_A:
	li	$v0, 4
	la	$a0, arrow
	syscall

	li	$v0, 11
	lb	$a0, A
	syscall

	add	$sp, $sp, 4
	lw	$31, 0($sp)
	jr	$31

print_B:
	li	$v0, 4
	la	$a0, arrow
	syscall

	li	$v0, 11
	lb	$a0, B
	syscall

	add	$sp, $sp, 4
	lw	$31, 0($sp)
	jr	$31


print_C:
	li	$v0, 4
	la	$a0, arrow
	syscall

	li	$v0, 11
	lb	$a0, C
	syscall

	add	$sp, $sp, 4
	lw	$31, 0($sp)
	jr	$31


print_D:
	li	$v0, 4
	la	$a0, arrow
	syscall

	li	$v0, 11
	lb	$a0, D
	syscall

	add	$sp, $sp, 4
	lw	$31, 0($sp)
	jr	$31


print_E:
	li	$v0, 4
	la	$a0, arrow
	syscall

	li	$v0, 11
	lb	$a0, E
	syscall

	add	$sp, $sp, 4
	lw	$31, 0($sp)
	jr	$31


print_F:
	li	$v0, 4
	la	$a0, arrow
	syscall

	li	$v0, 11
	lb	$a0, F
	syscall

	add	$sp, $sp, 4
	lw	$31, 0($sp)
	jr	$31


print_G:
	li	$v0, 4
	la	$a0, arrow
	syscall

	li	$v0, 11
	lb	$a0, G
	syscall

	add	$sp, $sp, 4
	lw	$31, 0($sp)
	jr	$31


print_H:
	li	$v0, 4
	la	$a0, arrow
	syscall

	li	$v0, 11
	lb	$a0, H
	syscall

	add	$sp, $sp, 4
	lw	$31, 0($sp)
	jr	$31


print_I:
	li	$v0, 4
	la	$a0, arrow
	syscall

	li	$v0, 11
	lb	$a0, I
	syscall

	add	$sp, $sp, 4
	lw	$31, 0($sp)
	jr	$31


print_J:
	li	$v0, 4
	la	$a0, arrow
	syscall

	li	$v0, 11
	lb	$a0, J
	syscall

	add	$sp, $sp, 4
	lw	$31, 0($sp)
	jr	$31

rerun:	j	main



rdone:	li $v0, 10		       # This is what done really is, a syscall with an appropriate code
	syscall




