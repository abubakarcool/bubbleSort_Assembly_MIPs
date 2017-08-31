#  Auther: Abubakar Cool
#  NUST, CEME, Rawalpindi
	.data
array: .word 0:4
	.text
	.globl main
main:
	li $s5,4
	la $s0,array
	li $t1,4 #length of array t1
	li $t0,0 #for input iterator t0
aa:	beq $t0,$t1,e1
	li $v0,5
	syscall
	move $t3,$v0
	sw $t3,($s0) #in s0 base address of array is present
	addi $s0,$s0,4
	addi $t0,$t0,1
	j aa
e1: 
	la $s0,array
	li $t1,4 #length of array n=4
	li $t0, #i=0
bb:	beq $t0,$t1,e2 #(i<n)
	li $t2,0		#j=0
	add $t3,$t1,-1	#t3=4-1
	sub $t3,$t3,$t0	#t3=t3-i
cc:	beq $t2,$t3,ff	#(j<t3)
	mul $t5,$t2,$s5	
	add $t6,$s0,$t5 # t6= adress of array[j]
	addi $t7,$t6,4	#t7	= adress of array[j+1]
	lw $s6,($t6)    #s6=arr[j]
	lw $s7,($t7)	#s7=arr[j+1]
	blt $s6,$s7,J2
	add $s6,$s6,$s7 # arr[j] = arr[j]+arr[j+1]
	sub $s7,$s6,$s7 # arr[j+1] = arr[j]-arr[j + 1]
	sub $s6,$s6,$s7 # arr[j] = arr[j]-arr[j + 1]
	move $a0,$s6
	li $v0,1
	syscall
	move $a0,$s7
	li $v0,1
	syscall
	sw $s6,($t6)
	sw $s7,($t7)
J2: addi $t2,$t2,1 #j++
	j cc
ff: addi $t0,$t0,1 #i++
	j bb
e2: #li $v0,10	#exit
	#syscall
.end main