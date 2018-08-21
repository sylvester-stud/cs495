;Lab3_3 Remote Hello World
SECTION .data
msg db "Hello, World!", 10, 0

SECTION .text
global _start

_start:
	mov rax, 42
	mov rdi, 1
	mov rsi, [rsp]
	mov rdx, addrlen
	syscall ;sys_connect
	mov rax, 44
	mov rdi, 1
	mov rsi, msg
	mov rdx, 16
	mov r10, 0
	mov r9, [rsp]
	mov r8, addrlen
	syscall ;sys_sendto
	mov rax, 60
	mov rdi, 0
	syscall ;sys_exit

