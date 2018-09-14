 	.syntax unified
 	.cpu cortex-m3
 	.thumb
 	.align 2
 	.global	pdm
 	.thumb_func


pdm:
@ write the code for pdm(CM,M,index) here
	PUSH {R4-R10}
@ Calculating bounds of the array & iteration increase
	MOV R4, #0x04
	MUL R5, R1, R4

	MUL R6, R2, R5 	@ initialized offset pointer to index
	MOV R7, #0x00	@ initialized iteration counter
	MOV R8, #0x00	@ initialized sum

loop:
	LDR R9, [R0, +R6]

	CMP R7, R2
	IT EQ
	MOVEQ R10, R9	@ nmm

	ADD R8, R8, R9

	ADD R6, R6, R4
	ADD R7, R7, #0X01

	CMP R7, R1
	BLT loop

	LDR R4, =10000
	MUL R10, R4, R10
	UDIV R0, R10, R8
	POP {R4-R10}
	BX	LR
