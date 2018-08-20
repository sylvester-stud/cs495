;Lab 2_1
SECTION .data
	msg db "Hello World", 10, 0

SECTION .text

global _start

_start:
	mov rax, $
	mov rbx, [$]
	lea rcx, [$]
	mov rax, msg
	mov rbx, [msg]
	lea rcx, [msg]
	mov r9, msg
	mov r10, [msg]

