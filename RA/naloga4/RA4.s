1.


.text
.org 0x20
@spremenljivke
STEV1: .word 0x11111111
STEV2: .word 0x22222222

.align
.global _start
_start:
@program

adr r0, STEV1
ldr r1, [r0]
adr r0, STEV2
ldr r2, [r0]
str r1, [r0]
adr r0, STEV1
str r2, [r0]

end: b end	


2.


.text
.org 0x20
@spremenljivke
TABELA: .space 5

.align
.global _start
_start:
@program

adr r0, TABELA
mov r1, #0xFF
strb r1, [r0]
strb r1, [r0,#1]
strb r1, [r0,#2]
strb r1, [r0,#3]
strb r1, [r0,#4]

end: b end	


3.


.text
.org 0x20
@spremenljivke
TABELA: .space 6

.align
.global _start
_start:
@program

adr r0, TABELA
mov r1, #1
strb r1, [r0]
mov r1, #2
strb r1, [r0,#1]
mov r1, #3
strb r1, [r0,#2]
mov r1, #4
strb r1, [r0,#3]
mov r1, #5
strb r1, [r0,#4]
mov r1, #6
strb r1, [r0,#5]

@obratni vrstni red

ldrb r1, [r0]
ldrb r2, [r0,#5]
strb r2, [r0]
strb r1, [r0,#5]

ldrb r1, [r0,#1]
ldrb r2, [r0,#4]
strb r2, [r0,#1]
strb r1, [r0,#4]

ldrb r1, [r0,#2]
ldrb r2, [r0,#3]
strb r2, [r0,#2]
strb r1, [r0,#3]


end: b end	


4.


.text
.org 0x20
@spremenljivke
STEV1: .word 0x12345678
STEV2: .space 4

.align
.global _start
_start:
@program

adr r0, STEV1
adr r1, STEV2
ldrb r2, [r0]
strb r2, [r1,#3]
ldrb r2, [r0,#1]
strb r2, [r1,#2]
ldrb r2, [r0,#2]
strb r2, [r1,#1]
ldrb r2, [r0,#3]
strb r2, [r1]
end: b end
