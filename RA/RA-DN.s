.text
.org 0x20
izvorna_koda: .asciz " \n\n stev1: .var 0xf123 @ komentar 1\n @prazna vrstica \n stev2: .var 15\nstev3: .var 128\n_start:\n mov r1, #5 @v r1 premakni 5\nmov r2, #1\nukaz3: add r1, #1\nb _start"
.align
izvorna_koda_pocisceno: .space 120
.align
tabela_oznak: .space 100
.align
.global _start
_start:

adr r0, izvorna_koda
mov r1, #0x20 @Trenuten znak
adr r3, izvorna_koda_pocisceno

korak_1:
mov r2, r1

ldrb r1, [r0]
cmp r1, #0
streqb r1, [r3]
beq konec1

cmp r1, #0x9
moveq r1, #0x20

cmp r1, #0x0a
cmpeq r2, #0x3a
moveq r1, #0x20

cmp r1, #0x20
cmpeq r2, #0x20
addeq r0, r0, #1
beq korak_1

cmp r1, #0x20
cmpeq r2, #0x0a
addeq r0, r0, #1
beq korak_1

cmp r1, #0x40
beq komentar

strb r1, [r3], #1

add r0, r0, #1
b korak_1

komentar:
add r0, #1
ldrb r1, [r0]
cmp r1, #0x0a
bne komentar
b korak_1


konec1: 


adr r0, izvorna_koda_pocisceno
mov r1, #0x0a @Trenuten znak
adr r3, izvorna_koda
mov r4, #0 @Znak v izvorni kodi


korak_2:
mov r2, r1
ldrb r1, [r0]


cmp r1, #0
beq brisanje

cmp r1, #0x0a
cmpeq r2, #0x0a
addeq r0, #1
beq korak_2

strb r1, [r3], #1
add r0, #1
b korak_2

brisanje:
ldrb r4, [r3]
cmp r4, #0
beq konec_2
strb r1, [r3], #1
b brisanje


konec_2: 


adr r0, izvorna_koda
mov r1, #0 @Trenutni znak
mov r2, #0x0  @Naslov v programu
adr r3, tabela_oznak
mov r5, r0 @najbližja nova vrstica
sub r5, #1
mov r6, #0 @konec oznake


korak_3: 
ldrb r1, [r0]

cmp r1, #0x0
beq konec3

cmp r1, #0x0a
addeq r2, r2, #1
moveq r5, r0

cmp r1, #0x3a
moveq r6, r0
bleq oznaka

add r0, #1
b korak_3


oznaka: 
mov r0, r5
add r0, #1
ozn_zanka: 
ldrb r1, [r0], #1
strb r1, [r3], #1
cmp r0, r6
blo ozn_zanka

mov r1, #0x00
tst r3, #1
strneb r1, [r3], #1
strh r2, [r3] ,#2
mov r0, r6
bx lr


konec3: 
mov r1, #0x0
strh r1, [r3]


end: b end