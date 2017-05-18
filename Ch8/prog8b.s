/*
	Convert number to binary for printing
*/

	.global _start

.text
_start:
	MOV R6, #251			@ number to print in R6
	MOV R10, #1				@ set up mask
	MOV R9, R10, LSL #31	@ shift bit into b31
	LDR R1, =string			@ point R1 to string
	
_bits:
	TST R6, R9				@ TST number, mask; Equivalent to AND, ORR, set Z flag
	BEQ _print0				@ if bit b21 is set, branch to _print0
	MOV R8, R6				@ MOV preserve, number
	MOV R0, #49				@ ASCII '1'
	STR R0, [R1]			@ Store '1' in string
	BL _write				@ call write to string subroutine
	MOV R6, R8				@ MOV number, preserve
	BAL _noprint1			@ branch to _noprint1

_print0:
	MOV R8, R6				@ MOV preserve, number
	MOV R0, #48				@ ASCII '0'
	STR R0, [R1]			@ store '0' in string
	BL _write				@ call write to string subroutine
	MOV R6, R8				@ MOV number, preserve
	
_noprint1:
	MOVS R9, R9, LSR #1		@ Shuffle mask bits
	BNE _bits				@ if (what values?) not equal, start _bits
	
_exit:
	MOV R7, #1				@ syscall for exit
	SWI 0

_write:
	MOV R0, #1				@ stdout is monitor
	MOV R2, #1				@ write 1 character
	MOV R7, #4				@ syscall for write
	SWI 0
	MOV PC, LR				@ return control to caller

.data
string:
	.ascii " "
