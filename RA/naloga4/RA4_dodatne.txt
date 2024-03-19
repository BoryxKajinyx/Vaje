1.


.text
.org 0x20
@spremenljivke
STEV1: .word 0x11111111

.align
.global _start
_start:
@program
adr r0, STEV1
ldr r1, [r0]
mov r2, r1
add r1, r1, r2
add r1, r1, r2
add r1, r1, r2
add r1, r1, r2
str r1, [r0]

end: b end


2.


.text
.org 0x20
@spremenljivke
TABELA: .space 16

.align
.global _start
_start:
@program
adr r0, TABELA
str r0, [r0]
add r0, r0, #4
str r0, [r0]
add r0, r0, #4
str r0, [r0]
add r0, r0, #4
str r0, [r0]

end: b end


3.

.text
.org 0x20
@spremenljivke
TABELA: .hword 1,2,3,4,5
SUM: .space 4

.align
.global _start
_start:
@program
adr r0, TABELA
ldrh r1, [r0]
ldrh r2, [r0,#2]
add r1, r1, r2
ldrh r2, [r0,#4]
add r1, r1, r2
ldrh r2, [r0,#6]
add r1, r1, r2
ldrh r2, [r0,#8]
add r1, r1, r2
adr r0, SUM
strh r1, [r0]

end: b end