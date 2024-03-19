@1.

.text
.org 0x20
@spremenljivke
stev1: .space 4
stev2: .word 0x7fffffff
stev3: .word 0x80000001

.align
.global _start
_start:
@program
adr r0, stev2
ldr r2, [r0]
adr r0, stev3
ldr r3, [r0]
adr r0, stev1
adds r1, r2, r3  @ 0x7fffffff + 0x 80000001 = 0x100000000 N=0, Z=1, C=1, V=0
str r1, [r0]     @ Vsota je 0. Zgodi se prenos. Ni preliva.

end: b end
@    7fffffff
@   +80000001   = 7fffffff(2'k)
@   __________
@   100000000


@2.
.text
.org 0x20
@spremenljivke
stev2: .word 0
stev3: .word 0xffffffff

.align
.global _start
_start:
@program
adr r0, stev3
ldr r3, [r0]
adr r0, stev2
ldr r2, [r0]
adds r2, r2, r3 @ N=1, Z=0, C=0, V=0 => ni 0, ni prenosa, ni preliva
str r2, [r0]    @ 0 + 0xffffffff = 0xffffffff = -1(predznačeno) => N=1

end: b end	

@3.
@ zastavice: N=1, C=0, Z=0, V=0
bcc@(C==0) se izvede
bne@(Z==0) se izvede
bge@(N==V) se ne izvede
bls@(C==0) se izvede
bmi@(N==1) se izvede
bcs@(C==1) se ne izvede
blt@(Z==0, N!=V) se izvede

@4.
a)
zanka: movs r1, #127 @ N=0, Z=0, C=0, V=0
bne zanka @(Z==0) se izvede => neskončna zanka
b)
zanka: movs r1, #127 @ N=0, Z=0, C=0, V=0
beq zanka @(Z==1) se ne izvede => ni zanka
c)
zanka: movs r1, #0 @ N=0, Z=1, C=0, V=0
beq zanka @(Z==1) se izvede => neskončna zanka
d)
zanka: mov r1, #1
cmp r1, #25        @ N=1, Z=0, C=0, V=0
bmi zanka @(N==1) se izvede => neskončna zanka
