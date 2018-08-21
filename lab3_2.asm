;Lab3_2 Shell with Syscalls
SECTION .data
shell db "/bin/sh"

SECTION .text
global _start

_start:
	mov rax, 59
	mov rdi, shell
	syscall
	mov rax, 60
	mov rdi, 0
	syscall

