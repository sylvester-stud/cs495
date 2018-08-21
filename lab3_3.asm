;Lab3_3 Remote Hello World
SECTION .data
	msg db "Hello, World!", 10, 0

SECTION .text
global _start

_start:
	mov dword [rsp-4], 0x0100007f	;inet addr 127.0.0.1
	mov word [rsp-6], 0x5c11
	mov byte [rsp-8], 2
	sub rsp, 8
	mov rax, 41
	
	syscall	;sys_socket
	mov rax, 42
	mov rdi, 1
	mov rsi, [rsp]
	mov rdx, 8
	syscall ;sys_connect
	mov rax, 44
	mov rdi, 1
	mov rsi, msg
	mov rdx, 16
	mov r10, 0
	mov r9, [rsp]
	mov r8, 8
	syscall ;sys_sendto
	mov rax, 60
	mov rdi, 0
	syscall ;sys_exit

