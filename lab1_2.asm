;Lab1_2 to set registers and loops

SECTION .text

global _start:

_start:
	mov R8, 0x8000000000000000
	mov R10, 0x8000000000000000
	mov R9, 0x1
	mov R11, 0x1
	mov ECX, 65
Shifts:
	shr R8, 1
	shl R9, 1
	sar R10, 1
	sal R11, 1
	loop	Shifts
