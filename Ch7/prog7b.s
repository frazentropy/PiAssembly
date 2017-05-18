/*
	Using Syscall 3 to read from keyboard
*/

	.global _start
	
_start:

_read:

	MOV R7, #3			@ Read syscall
	MOV R0, #0			@ stdin is keyboard
	MOV R2, #5			@ read first 5 characters
	LDR R1, =string		@ place string at string:
	SWI 0

_write:
	MOV R7, #4			@ Write syscall
	MOV R0, #1			@ stdout is monitor
	MOV R2, #19			@ string is 19 chars long
	LDR R1, =string		@ string located at string:
	SWI 0
	
_exit:
	MOV R7, #1			@ exit syscall
	SWI 0

.data
string:
.ascii "Hello World String\n"
