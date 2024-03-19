1.

e3 a0 10 80

R1    0x00 ----> 0x80
R15   0x20 ----> 0x24


2.

.text
.org 0x20
@spremenljivke
STEV1: .word 0x12345678
STEV2: .byte 128
.align
STEV3: .hword 0xf123

.align
.global _start
_start:
@program
adr r0, STEV1
ldr r1,[r0]
adr r0, STEV2
ldrb r1, [r0]
adr r0, STEV3
ldrh r1, [r0]

end: b end


3.

a) 32-bitne spremenljivke

.text
.org 0x20
@spremenljivke
STEV1: .word 0x12345678
STEV2: .word 0x00

.align
.global _start
_start:
@program
adr r0, STEV1
ldr r1,[r0]
adr r0, STEV2
str r1, [r0]

end: b end

b) 16-bitne spremenljivke

.text
.org 0x20
@spremenljivke
STEV1: .hword 0x1234
STEV2: .hword 0x00

.align
.global _start
_start:
@program
adr r0, STEV1
ldrh r1,[r0]
adr r0, STEV2
strh r1, [r0]

end: b end

c) 8-bitne spremenljivke

.text
.org 0x20
@spremenljivke
STEV1: .byte 0x12
STEV2: .byte 0x00

.align
.global _start
_start:
@program
adr r0, STEV1
ldrb r1,[r0]
adr r0, STEV2
strb r1, [r0]

end: b end

