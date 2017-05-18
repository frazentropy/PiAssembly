/*
	Perform R0=R1*R2+R3
*/

	.global _start
	
_start:
	MOV R1, #20
	MOV R2, #5
	MOV R3, #10
	MLA R0, R1, R2, R3
	
	MOV R7, #1		@ Exit through syscall
	SWI 0
