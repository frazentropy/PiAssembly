/*
	Reading a number using scanf
	via registers and the stack
*/

	.global main
	.func main

	.text
main:
	PUSH {LR}
	SUB SP, SP, #4			@ make room on stack
	LDR R0, addr_format		@ get addr of format
	MOV R1, SP				@ place SP in R1 and
	BL scanf				@ store entry on stack
	LDR R2, [SP]			@ store entry in R2
	LDR R3, addr_number		@ get address of number
	STR R2, [R3]			@ Remember: STR works backward from LDR
	ADD SP, SP, #4			@ restore SP
	POP {PC}				@ restore PC
	
	POP {PC}

_exit:
	MOV PC, LR

addr_format: .word scanformat
addr_number: .word number


	.data
number: 	.word 0
scanformat: .asciz "%d"
