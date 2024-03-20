1.

seštevanje 32b:

.text
.org 0x20
@spremenljivke
STEV1: .word 10
STEV2: .word 5
REZ: .space 4

.align
.global _start
_start:
@program
adr r0, STEV1
ldr r1, [r0]
adr r0, STEV2
ldr r2, [r0]
add r3, r1, r2
adr r0, REZ
str r3, [r0]

end: b end	

odštevanje 32b:

.text
.org 0x20
@spremenljivke
STEV1: .word 10
STEV2: .word 5
REZ: .space 4

.align
.global _start
_start:
@program
adr r0, STEV1
ldr r1, [r0]
adr r0, STEV2
ldr r2, [r0]
sub r3, r1, r2
adr r0, REZ
str r3, [r0]

end: b end	

seštevanje 16b:

.text
.org 0x20
@spremenljivke
STEV1: .hword 10
STEV2: .hword 5
REZ: .space 2

.align
.global _start
_start:
@program
adr r0, STEV1
ldrh r1, [r0]
adr r0, STEV2
ldrh r2, [r0]
add r3, r1, r2
adr r0, REZ
strh r3, [r0]

end: b end

odštevanje 16b:

.text
.org 0x20
@spremenljivke
STEV1: .hword 10
STEV2: .hword 5
REZ: .space 2

.align
.global _start
_start:
@program
adr r0, STEV1
ldrh r1, [r0]
adr r0, STEV2
ldrh r2, [r0]
sub r3, r1, r2
adr r0, REZ
strh r3, [r0]

end: b end	

seštevanje 8b:

.text
.org 0x20
@spremenljivke
STEV1: .byte 10
STEV2: .byte 5
REZ: .space 1

.align
.global _start
_start:
@program
adr r0, STEV1
ldrb r1, [r0]
adr r0, STEV2
ldrb r2, [r0]
add r3, r1, r2
adr r0, REZ
strb r3, [r0]

end: b end	

odštevanje 8b:

.text
.org 0x20
@spremenljivke
STEV1: .byte 10
STEV2: .byte 5
REZ: .space 1

.align
.global _start
_start:
@program
adr r0, STEV1
ldrb r1, [r0]
adr r0, STEV2
ldrb r2, [r0]
sub r3, r1, r2
adr r0, REZ
strb r3, [r0]

end: b end	


2.

.text
.org 0x20
@spremenljivke
STEV1: .word 0x50
STEV2: .word 100
STEV3: .word 0x2f

.align
.global _start
_start:
@program
adr r0, STEV1
ldr r1, [r0]
adr r0, STEV2
ldr r2, [r0]
adr r0, STEV3
ldr r3, [r0]
add r4, r3, r2
sub r1, r4, r1
adr r0, STEV1
str r1, [r0]

end: b end	

3.

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
ldr r1, [r0]
adr r0, STEV2
ldrb r2, [r0]
ldrsb r3, [r0]
adr r0, STEV3
ldrh r4, [r0]
ldrsh r5, [r0]

end: b end


4.

a)

.text
.org 0x20
@spremenljivke
STEV1: .byte 15
STEV2: .byte 130


.align
.global _start
_start:
@program
adr r0, STEV1
ldrb r1, [r0]
adr r0, STEV2
ldrb r2, [r0]
add r1, r1, r2
adr r0, STEV1
strb r1, [r0]

end: b end	


b)

.text
.org 0x20
@spremenljivke
STEV1: .byte 15
STEV2: .byte 130


.align
.global _start
_start:
@program
adr r0, STEV1
ldrsb r1, [r0]
adr r0, STEV2
ldrsb r2, [r0]
add r1, r1, r2
adr r0, STEV1
strb r1, [r0]

end: b end	

c)

.text
.org 0x20
@spremenljivke
STEV1: .word 128
STEV2: .byte 128


.align
.global _start
_start:
@program
adr r0, STEV1
ldr r1, [r0]
adr r0, STEV2
ldrsb r2, [r0]
add r1, r1, r2
adr r0, STEV1
str r1, [r0]

end: b end	