/*
	Add two 64-bit numbers together
*/

	.global _start

_start:

	MOV R2, #0xFFFFFFFF		@ Number 1, low byte
	MOV R3, #0x1			@ Number 1, high byte
	MOV R4, #0xFFFFFFFF		@ Number 2, low byte
	MOV R5, #0xFF			@ Number 2, high byte
	ADDS R0, R2, R4			@ Add low and set flags
	ADCS R1, R3, R5			@ Add high with carry
	
	MOV R7, #1				@ Exit through syscall
	SWI 0
