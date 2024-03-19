@1.

.text
.org 0x20
@spremenljivke
tab: .space 8

.align
.global _start
_start:
@program
adr r0, tab
mov r1, #8
mov r10, #0xff
zanka:
strb r10, [r0]
add r0, r0, #1
subs r1, r1, #1
bhi zanka

end: b end


@2. a)

.text
.org 0x20
@spremenljivke
tabela: .byte 1,100,255,24,88,31,56,192,155,224
rezultat: .space 2

.align
.global _start
_start:
@program
adr r0, tabela
mov r1, #10
zanka:
ldrb r3, [r0]
add r2, r2, r3
add r0, r0, #1
subs r1, r1, #1
bhi zanka
adr r0, rezultat
strh r2, [r0]

end: b end	


@2. b)

.text
.org 0x20
@spremenljivke
tabela: .hword 1,100,255,24,88,31,56,192,155,224
rezultat: .space 4

.align
.global _start
_start:
@program
adr r0, tabela
mov r1, #10
zanka:
ldrh r3, [r0]
add r2, r2, r3
add r0, r0, #1
subs r1, r1, #1
bhi zanka
adr r0, rezultat
str r2, [r0]

end: b end	


@3.

.text
.org 0x20
@spremenljivke
tabela: .byte 192,155,224,48,0,128,99,147,177,100
rezultat: .space 2

.align
.global _start
_start:
@program
adr r0, tabela
mov r2, #10
mov r1, #0
zanka:
ldrsb r3, [r0]
cmp r3, #100
addgt r1, r1, #1
add r0, r0, #1
subs r2, r2, #1
bhi zanka

end: b end

@4.


.text
.org 0x20
@spremenljivke
niz: .asciz "Zunaj je tema!"

.align
.global _start
_start:
@program
adr r0, niz
mov r1, #0
mov r2, #' '
zanka:
ldrb r3, [r0]
cmp r3, #0
beq konec
cmp r3, r2
addeq r1, r1, #1
add r0, r0, #1
b zanka
konec:
@ rez. je v R1

end: b end	