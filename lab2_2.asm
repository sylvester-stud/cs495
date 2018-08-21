;Lab 2_1
SECTION .data
	msg db "Hello World!", 10, 0

SECTION .text

global _start

_start:
	mov rax, $
	mov rbx, [rel $]
	lea rcx, [rel $]
	mov rax, msg
	mov rbx, [rel msg]
	lea rcx, [rel msg+6]
	mov r9, msg
	mov r10, [rel msg]

