;Lab3_3 Remote Hello World
SECTION .data
	msg db "Hello, World!", 10, 0

SECTION .text
global _start

_start:
	mov rax, 41
	mov rdi, 2			;inet
	mov rsi, 1			;sock_stream
	mov rdx, 0			;proto
	syscall	;sys_socket
	mov rdi, rax			;fd
	mov rax, 42
	mov rsi, ;	need the pointer to the value not the data@ rsp [rsp]			;sock_addr
	mov rdx, 16			;addrlen
	mov dword [rsp-4], 0x0100007f	;inet addr 127.0.0.1
	mov word [rsp-6], 0x5c11	;port 4444
	mov byte [rsp-8], 2		;inet
	sub rsp, 8			;stack alignment
	syscall ;sys_connect
	mov rax, 44
	mov rsi, msg			;send hello world
	mov rdx, 16			;length of msg
	mov r10, 0			;flags
	mov r9, [rsp]			;sock_addr
	mov r8, 8			;addrlen
	syscall ;sys_sendto
	mov rax, 60
	mov rdi, 0
	syscall ;sys_exit

