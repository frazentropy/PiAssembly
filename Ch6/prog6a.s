/*
	Perform R0=R1+R2
*/

	.global _start

_start:
	MOV R1, #50			@ Put 50 in R1
	MOV R2, #60			@ Put 60 in R2
	ADDS R0, R1, R2		@ Add the two, result in R0, set flags
	
	MOV R7, #1			@ Exit through syscall
	SWI 0
