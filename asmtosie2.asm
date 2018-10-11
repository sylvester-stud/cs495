Welcome to the asmtosie server!
Do you prefer AT&T or Intel syntax for assembly? 
Intel
[setting asm to intel syntax]
Please provide us a function with the following protype:
      int testb(int,int)

Which has the same functionality as the following assembly:

testa:
.LFB0:
	push	ebp
	mov	ebp, esp
	push	ebx
	call	__x86.get_pc_thunk.ax
	add	eax, OFFSET FLAT:_GLOBAL_OFFSET_TABLE_
	mov	eax, DWORD PTR 8[ebp]
	imul	edx, eax, -668203060
	mov	eax, DWORD PTR 8[ebp]
	add	eax, 1
	imul	eax, DWORD PTR 12[ebp]
	lea	ecx, 1039577924[eax]
	mov	eax, DWORD PTR 12[ebp]
	imul	eax, ecx
	add	edx, eax
	mov	eax, DWORD PTR 8[ebp]
	imul	edx, eax
	mov	ecx, DWORD PTR 12[ebp]
	mov	eax, DWORD PTR 8[ebp]
	imul	eax, eax, 2027837521
	sub	ecx, eax
	mov	eax, DWORD PTR 8[ebp]
	lea	ebx, [eax+eax]
	mov	eax, DWORD PTR 12[ebp]
	add	eax, ebx
	mov	ebx, eax
	mov	eax, DWORD PTR 12[ebp]
	add	eax, ebx
	add	eax, 1357278678
	imul	eax, ecx
	cmp	edx, eax
	jbe	.L2
	mov	eax, DWORD PTR 8[ebp]
	imul	edx, eax, 820626909
	mov	eax, DWORD PTR 8[ebp]
	add	eax, edx
	jmp	.L3
.L2:
	mov	eax, DWORD PTR 8[ebp]
	neg	eax
	mov	edx, eax
	mov	eax, DWORD PTR 8[ebp]
	sub	edx, eax
	mov	eax, edx
	add	eax, 1374624060
.L3:
	pop	ebx
	pop	ebp
	ret
.LFE0:
	.size	testa, .-testa
	.section	.text.__x86.get_pc_thunk.ax,"axG",@progbits,__x86.get_pc_thunk.ax,comdat
	.globl	__x86.get_pc_thunk.ax
	.hidden	__x86.get_pc_thunk.ax
	.type	__x86.get_pc_thunk.ax, @function
__x86.get_pc_thunk.ax:
.LFB1:
	mov	eax, DWORD PTR [esp]

