;Lab3_1 ABI intro
SECTION .data
msg db "Hello, World!", 10, 0

SECTION .text
global _start

_start:
	mov rax, 1
	mov rdi, 1
	mov rsi, msg
	mov rdx, 14
	syscall
	mov rax, 60
	mov rdi, 0
	syscall
