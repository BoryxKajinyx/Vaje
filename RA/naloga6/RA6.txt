@ 1.



.text
.org 0x20
@spremenljivke

.align
.global _start
_start:
@program                       zast                        reg                  nepr            pred
movs r0, #0         @          Z=1, N=0                    0x00000000            0               0
subs r0, r0, #1     @          Z=0, N=1, C=0, V=0          0xffffffff          MAKS.             -1
adds r0, r0, #2     @          Z=0, N=0, C=1, V=0          0x00000001           1                1

end: b end	


@ 2.

.text
.org 0x20
@spremenljivke

.align
.global _start
_start:
@program             zastavice                   register        nepr       pred
movs r0, #1    @     N=0, Z=0, C=0, V=0          0x01            1          1
subs r0, #1    @     N=0, Z=1, C=1, V=0          0x00            0          0
subs r0, #1    @     N=1, Z=0, C=0, V=0          0xffffffff      maks       -1

end: b end


@ 3.


.text
.org 0x20
@spremenljivke
stev1: .hword -10
stev2: .byte   0x64
stev3: .byte  -2

.align
.global _start
_start:
@program
adr r0, stev1
ldrsh r1, [r0]
adr r0, stev2
ldrsb r2, [r0]
adr r0, stev3
ldrsb r3,[r0]

adds r4, r3, r2  @ 0x64 + 0xfe = 0x62, C=1 (prenos, ker je ubistvu odštevanje)

subs r1, r4, r1  @ 0x62 - 0xff f6= 0x6c , N=0, C=1 (ni prenosa) (98 - (-10)= 108 = 0x6c)

adr r0, stev1
strh r1, [r0]

end: b end