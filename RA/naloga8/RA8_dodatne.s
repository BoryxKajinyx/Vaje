1.
.text
.org 0x20
@spremenljivke
stev1: .space 4
stev2: .word 0x22
stev3: .word 0x33
.align
.global _start
_start:
@program
adr r0, stev3
ldr r3, [r0]
adr r0, stev2
ldr r2, [r0]

mov r1, r2
cmp r2, r3
movlo r1, r3

adr r0, stev1
str r1, [r0]
end: b end

2.

.text
.org 0x20
@spremenljivke
stev1: .space 4
stev2: .word 0x22
stev3: .word 0x33
.align
.global _start
_start:
@program
adr r0, stev3
ldr r3, [r0]
adr r0, stev2
ldr r2, [r0]

mov r1, r2
cmp r2, r3
movhi r1, r3

adr r0, stev1
str r1, [r0]
end: b end


3.
a) max
.text
.org 0x20
@spremenljivke
stev1: .space 4
stev2: .word 0x22
stev3: .word 0x33
.align
.global _start
_start:
@program
adr r0, stev3
ldr r3, [r0]
adr r0, stev2
ldr r2, [r0]

mov r1, r2
cmp r2, r3
movlt r1, r3

adr r0, stev1
str r1, [r0]
end: b end

b) min
.text
.org 0x20
@spremenljivke
stev1: .space 4
stev2: .word 0x22
stev3: .word 0x33
.align
.global _start
_start:
@program
adr r0, stev3
ldr r3, [r0]
adr r0, stev2
ldr r2, [r0]

mov r1, r2
cmp r2, r3
movlt r1, r3

adr r0, stev1
str r1, [r0]
end: b end

4.
.text
.org 0x20
@spremenljivke
stev1: .word 372985
stev2: .word 270933
del: .space 4
.align
.global _start
_start:
@postavljanje operandov v registre
adr r0, stev1
ldr r1, [r0]
adr r0, stev2
ldr r2, [r0]

@program
zanka:
cmp r1, r2
sublo r2,r2,r1
subhi r1,r1,r2
bne zanka

@spravljanje rezultata v pomnilnik
adr r0, del
str r1, [r0]
end: b end