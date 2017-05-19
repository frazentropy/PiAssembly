/*
	Convert to binary for printing
*/

	.global _start

_start:
	MOV R6, #251				@ Number to print in R6
	MOV R10, #1					@ Set up mask
	Mov R9, R10, LSL #31		@ Shift to start mask bit as MSB
	LDR R1, =string				@ Point R1 to string:
	
_bits:
	TST R6, R9					@ AND, set flags
	MOVEQ R0, #48				@ ASCII '0'
	MOVNE R0, #49				@ ASCII '1'
	STR R0, [R1]				@ Store '1' or '0' in string
	MOV R8, R6					@ MOV preserve, number
	BL _write					@ Call write to screen subroutine
	MOV R6, R8					@ MOV number, preserve
	
	MOVS R9, R9, LSR #1			@ Shuffle mask bits
	BNE _bits					@ If R9 != 0, loopback
	
	MOV R0, #10					@ ASCII '\n'
	STR R0, [R1]				@ Store '\n' in string
	BL _write					@ Call write to screen subroutine

_exit:
	MOV R7, #1					@ syscall for exit
	SWI 0

_write:
	MOV R0, #1
	MOV R2, #1
	MOV R7, #4					@ syscall for write
	SWI 0
	BX LR						@ Return to caller

.data
string: .ascii " "
