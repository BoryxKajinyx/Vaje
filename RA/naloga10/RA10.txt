1.

.text
.org 0x20
@spremenljivke
n: .word 48000
.align
.global _start
_start:
@program
adr r0, n
mov r1, #0
mov r2, #500
zanka1:
ldr r3, [r0]
sub r2, #1
zanka2:
sub r3, #1
add r1, #1
cmp r3, #0
bhi zanka2
cmp r2, #0
bhi zanka1

end: b end	


2.

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
mov r2, #0xff
zanka:
strb r2, [r0]
add r0, #1
sub r1, #1
cmp r1, #0
bhi zanka

end: b end	

3.

.text
.org 0x20
@spremenljivke
tab: .byte 192,155,224,48,0,128,99,147,177,100
rez: .space 2
.align
.global _start
_start:
@program
adr r0, tab
mov r1, #0
mov r2, #0xff
mov r4, #0
zanka:
mov r3, r2
ldrsb r2, [r0]
cmp r2, #0
cmpeq r3, #0
beq konec
add r4, r2
cmp r2, #100
addgt r1, #1
add r0, #1
b zanka
konec:
adr r0, rez
strh r4, [r0]
end: b end	


Če so elementi tabele 16-bitni, je treba spremeniti ldrsb v ldrsh in če je rezultat 32-biten je treba spremeniti strh v str.

4.

.text
.org 0x20
@spremenljivke
niz: .asciz "Zunaj je mraz, sneg in poledica."
.align
.global _start
_start:
@program
adr r0, niz
mov r1, #0
mov r4, #0x20
zanka:
ldrb r2, [r0]
cmp r2, r4
addeq r1, #1
cmp r2, #0
add r0, #1
bne zanka
end: b end

5.

.text
.org 0x20
@spremenljivke
tab: .hword 1,100,-255,24,-88,31,56,192,155,-224,0,101,-199,47
.align
.global _start
_start:
@program
adr r0, tab
mov r1, #14
zanka:
ldrsh r2, [r0]
cmp r2, #100
bge naprej
cmplt r2, #-100
blt naprej
mov r2, #0
naprej:
strh r2, [r0]
add r0, #2
subs r1, #1
bne zanka

end: b end	