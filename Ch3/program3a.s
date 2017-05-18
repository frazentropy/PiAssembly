@ program3a.s -- A simple assembler file

.global _start

_start:
	MOV R0, #49
	MOV R7, #1
	SWI 0
