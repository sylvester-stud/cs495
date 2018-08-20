;Lab2_3
SECTION .data

SECTION .text
global _start

_start:
	mov rax, rsp
	mov rbx, rbp
	push 1
	push 2
	push 3
	mov rcx, rsp
	mov rdx, rbp
	pop r8
	pop r9
	pop r10
	mov rsi, rsp
	mov rdi, rbp
	call .callTest
	mov rax, 60
	xor rdx, rdx
	syscall
.callTest:
	push rbp
	mov rbp, rsp
	mov rax, rsp
	mov rbx, rbp
	push 1
	push 2
	push 3
	mov rcx, rsp
	mov rdx, rbp
	pop r8
	pop r9
	pop r10
	mov rsi, rsp
	mov rdi, rbp
	leave
	ret
