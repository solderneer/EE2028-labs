   1              		.syntax unified
   2              		.cpu cortex-m3
   3              		.fpu softvfp
   4              		.eabi_attribute 20, 1
   5              		.eabi_attribute 21, 1
   6              		.eabi_attribute 23, 3
   7              		.eabi_attribute 24, 1
   8              		.eabi_attribute 25, 1
   9              		.eabi_attribute 26, 1
  10              		.eabi_attribute 30, 6
  11              		.eabi_attribute 34, 1
  12              		.eabi_attribute 18, 4
  13              		.thumb
  14              		.file	"main.c"
  15              		.text
  16              	.Ltext0:
  17              		.cfi_sections	.debug_frame
  18              		.global	__aeabi_i2f
  19              		.global	__aeabi_fdiv
  20              		.section	.text.pfa,"ax",%progbits
  21              		.align	2
  22              		.global	pfa
  23              		.thumb
  24              		.thumb_func
  26              	pfa:
  27              	.LFB0:
  28              		.file 1 "../src/main.c"
   1:../src/main.c **** #include "stdio.h"
   2:../src/main.c **** 
   3:../src/main.c **** extern int pdm(int* base, int ncol, int index);
   4:../src/main.c **** 
   5:../src/main.c **** // EE2028 Assignment 1, Sem 1, AY 2018/19
   6:../src/main.c **** // (c) CK Tham, ECE NUS, 2018
   7:../src/main.c **** 
   8:../src/main.c **** // Dimension of confusion matrix, i.e. MxM square matrix
   9:../src/main.c **** // Note: pdm() must work for different values of M, e.g. M=10
  10:../src/main.c **** #define M 3
  11:../src/main.c **** 
  12:../src/main.c **** // Part II: PFAm
  13:../src/main.c **** float pfa(int* CM, int index)
  14:../src/main.c **** {
  29              		.loc 1 14 0
  30              		.cfi_startproc
  31              		@ args = 0, pretend = 0, frame = 24
  32              		@ frame_needed = 1, uses_anonymous_args = 0
  33 0000 90B5     		push	{r4, r7, lr}
  34              	.LCFI0:
  35              		.cfi_def_cfa_offset 12
  36              		.cfi_offset 14, -4
  37              		.cfi_offset 7, -8
  38              		.cfi_offset 4, -12
  39 0002 87B0     		sub	sp, sp, #28
  40              	.LCFI1:
  41              		.cfi_def_cfa_offset 40
  42 0004 00AF     		add	r7, sp, #0
  43              	.LCFI2:
  44              		.cfi_def_cfa_register 7
  45 0006 7860     		str	r0, [r7, #4]
  46 0008 3960     		str	r1, [r7, #0]
  15:../src/main.c **** 	// write the code for pfa(CM,M,index) here
  16:../src/main.c **** 	int false_pos = 0;
  47              		.loc 1 16 0
  48 000a 4FF00003 		mov	r3, #0
  49 000e 7B61     		str	r3, [r7, #20]
  17:../src/main.c **** 	int notm = 0;
  50              		.loc 1 17 0
  51 0010 4FF00003 		mov	r3, #0
  52 0014 3B61     		str	r3, [r7, #16]
  18:../src/main.c **** 	int i,j;
  19:../src/main.c **** 
  20:../src/main.c **** 	// gets all the false positives
  21:../src/main.c **** 	for(i=0; i<M; i++){
  53              		.loc 1 21 0
  54 0016 4FF00003 		mov	r3, #0
  55 001a FB60     		str	r3, [r7, #12]
  56 001c 17E0     		b	.L2
  57              	.L4:
  22:../src/main.c **** 		if(i!=index)
  58              		.loc 1 22 0
  59 001e FA68     		ldr	r2, [r7, #12]
  60 0020 3B68     		ldr	r3, [r7, #0]
  61 0022 9A42     		cmp	r2, r3
  62 0024 0FD0     		beq	.L3
  23:../src/main.c **** 			false_pos += *((CM+i*M) + index);
  63              		.loc 1 23 0
  64 0026 FA68     		ldr	r2, [r7, #12]
  65 0028 1346     		mov	r3, r2
  66 002a 4FEA4303 		lsl	r3, r3, #1
  67 002e 9B18     		adds	r3, r3, r2
  68 0030 1A46     		mov	r2, r3
  69 0032 3B68     		ldr	r3, [r7, #0]
  70 0034 D318     		adds	r3, r2, r3
  71 0036 4FEA8303 		lsl	r3, r3, #2
  72 003a 7A68     		ldr	r2, [r7, #4]
  73 003c D318     		adds	r3, r2, r3
  74 003e 1B68     		ldr	r3, [r3, #0]
  75 0040 7A69     		ldr	r2, [r7, #20]
  76 0042 D318     		adds	r3, r2, r3
  77 0044 7B61     		str	r3, [r7, #20]
  78              	.L3:
  21:../src/main.c **** 	for(i=0; i<M; i++){
  79              		.loc 1 21 0
  80 0046 FB68     		ldr	r3, [r7, #12]
  81 0048 03F10103 		add	r3, r3, #1
  82 004c FB60     		str	r3, [r7, #12]
  83              	.L2:
  21:../src/main.c **** 	for(i=0; i<M; i++){
  84              		.loc 1 21 0 is_stmt 0 discriminator 1
  85 004e FB68     		ldr	r3, [r7, #12]
  86 0050 022B     		cmp	r3, #2
  87 0052 E4DD     		ble	.L4
  24:../src/main.c **** 	}
  25:../src/main.c **** 
  26:../src/main.c **** 	for(i=0; i<M; i++){
  88              		.loc 1 26 0 is_stmt 1
  89 0054 4FF00003 		mov	r3, #0
  90 0058 FB60     		str	r3, [r7, #12]
  91 005a 22E0     		b	.L5
  92              	.L9:
  27:../src/main.c **** 		if(i!=index){
  93              		.loc 1 27 0
  94 005c FA68     		ldr	r2, [r7, #12]
  95 005e 3B68     		ldr	r3, [r7, #0]
  96 0060 9A42     		cmp	r2, r3
  97 0062 1AD0     		beq	.L6
  28:../src/main.c **** 			for(j=0; j<M; j++) {
  98              		.loc 1 28 0
  99 0064 4FF00003 		mov	r3, #0
 100 0068 BB60     		str	r3, [r7, #8]
 101 006a 13E0     		b	.L7
 102              	.L8:
  29:../src/main.c **** 				notm += *((CM+i*M) + j);
 103              		.loc 1 29 0 discriminator 2
 104 006c FA68     		ldr	r2, [r7, #12]
 105 006e 1346     		mov	r3, r2
 106 0070 4FEA4303 		lsl	r3, r3, #1
 107 0074 9B18     		adds	r3, r3, r2
 108 0076 1A46     		mov	r2, r3
 109 0078 BB68     		ldr	r3, [r7, #8]
 110 007a D318     		adds	r3, r2, r3
 111 007c 4FEA8303 		lsl	r3, r3, #2
 112 0080 7A68     		ldr	r2, [r7, #4]
 113 0082 D318     		adds	r3, r2, r3
 114 0084 1B68     		ldr	r3, [r3, #0]
 115 0086 3A69     		ldr	r2, [r7, #16]
 116 0088 D318     		adds	r3, r2, r3
 117 008a 3B61     		str	r3, [r7, #16]
  28:../src/main.c **** 			for(j=0; j<M; j++) {
 118              		.loc 1 28 0 discriminator 2
 119 008c BB68     		ldr	r3, [r7, #8]
 120 008e 03F10103 		add	r3, r3, #1
 121 0092 BB60     		str	r3, [r7, #8]
 122              	.L7:
  28:../src/main.c **** 			for(j=0; j<M; j++) {
 123              		.loc 1 28 0 is_stmt 0 discriminator 1
 124 0094 BB68     		ldr	r3, [r7, #8]
 125 0096 022B     		cmp	r3, #2
 126 0098 E8DD     		ble	.L8
 127              	.L6:
  26:../src/main.c **** 	for(i=0; i<M; i++){
 128              		.loc 1 26 0 is_stmt 1
 129 009a FB68     		ldr	r3, [r7, #12]
 130 009c 03F10103 		add	r3, r3, #1
 131 00a0 FB60     		str	r3, [r7, #12]
 132              	.L5:
  26:../src/main.c **** 	for(i=0; i<M; i++){
 133              		.loc 1 26 0 is_stmt 0 discriminator 1
 134 00a2 FB68     		ldr	r3, [r7, #12]
 135 00a4 022B     		cmp	r3, #2
 136 00a6 D9DD     		ble	.L9
  30:../src/main.c **** 			}
  31:../src/main.c **** 		}
  32:../src/main.c **** 	}
  33:../src/main.c **** 
  34:../src/main.c **** 	return ((float)false_pos/(float)notm);
 137              		.loc 1 34 0 is_stmt 1
 138 00a8 7869     		ldr	r0, [r7, #20]
 139 00aa FFF7FEFF 		bl	__aeabi_i2f
 140 00ae 0446     		mov	r4, r0
 141 00b0 3869     		ldr	r0, [r7, #16]
 142 00b2 FFF7FEFF 		bl	__aeabi_i2f
 143 00b6 0346     		mov	r3, r0
 144 00b8 2046     		mov	r0, r4
 145 00ba 1946     		mov	r1, r3
 146 00bc FFF7FEFF 		bl	__aeabi_fdiv
 147 00c0 0346     		mov	r3, r0
  35:../src/main.c **** }
 148              		.loc 1 35 0
 149 00c2 1846     		mov	r0, r3
 150 00c4 07F11C07 		add	r7, r7, #28
 151 00c8 BD46     		mov	sp, r7
 152 00ca 90BD     		pop	{r4, r7, pc}
 153              		.cfi_endproc
 154              	.LFE0:
 156              		.section	.rodata
 157              		.align	2
 158              	.LC1:
 159 0000 2566200A 		.ascii	"%f \012\000"
 159      00
 160              		.global	__aeabi_i2d
 161              		.global	__aeabi_ddiv
 162 0005 000000   		.align	2
 163              	.LC2:
 164 0008 0A00     		.ascii	"\012\000"
 165              		.global	__aeabi_f2d
 166 000a 0000     		.align	2
 167              	.LC0:
 168 000c 3C000000 		.word	60
 169 0010 02000000 		.word	2
 170 0014 03000000 		.word	3
 171 0018 0B000000 		.word	11
 172 001c 2F000000 		.word	47
 173 0020 07000000 		.word	7
 174 0024 1B000000 		.word	27
 175 0028 0E000000 		.word	14
 176 002c 18000000 		.word	24
 177              		.section	.text.main,"ax",%progbits
 178              		.align	2
 179              		.global	main
 180              		.thumb
 181              		.thumb_func
 183              	main:
 184              	.LFB1:
  36:../src/main.c **** 
  37:../src/main.c **** int main(void)
  38:../src/main.c **** {
 185              		.loc 1 38 0
 186              		.cfi_startproc
 187              		@ args = 0, pretend = 0, frame = 40
 188              		@ frame_needed = 1, uses_anonymous_args = 0
 189 0000 B0B5     		push	{r4, r5, r7, lr}
 190              	.LCFI3:
 191              		.cfi_def_cfa_offset 16
 192              		.cfi_offset 14, -4
 193              		.cfi_offset 7, -8
 194              		.cfi_offset 5, -12
 195              		.cfi_offset 4, -16
 196 0002 8AB0     		sub	sp, sp, #40
 197              	.LCFI4:
 198              		.cfi_def_cfa_offset 56
 199 0004 00AF     		add	r7, sp, #0
 200              	.LCFI5:
 201              		.cfi_def_cfa_register 7
  39:../src/main.c **** 	// Variable definitions
  40:../src/main.c **** 	int index;
  41:../src/main.c **** 	// Note: different initialisation list is needed for different M
  42:../src/main.c **** 	int CM[M][M]={{60,2,3},{11,47,7},{27,14,24}};
 202              		.loc 1 42 0
 203 0006 40F20003 		movw	r3, #:lower16:.LC0
 204 000a C0F20003 		movt	r3, #:upper16:.LC0
 205 000e 3C46     		mov	r4, r7
 206 0010 1D46     		mov	r5, r3
 207 0012 0FCD     		ldmia	r5!, {r0, r1, r2, r3}
 208 0014 0FC4     		stmia	r4!, {r0, r1, r2, r3}
 209 0016 0FCD     		ldmia	r5!, {r0, r1, r2, r3}
 210 0018 0FC4     		stmia	r4!, {r0, r1, r2, r3}
 211 001a 2B68     		ldr	r3, [r5, #0]
 212 001c 2360     		str	r3, [r4, #0]
  43:../src/main.c **** 
  44:../src/main.c **** 	// Part I: PDm: Call assembly language function pdm() for each class m
  45:../src/main.c **** 	// note: index = m - 1
  46:../src/main.c **** 	for (index=0; index<M; index++)
 213              		.loc 1 46 0
 214 001e 4FF00003 		mov	r3, #0
 215 0022 7B62     		str	r3, [r7, #36]
 216 0024 20E0     		b	.L11
 217              	.L12:
  47:../src/main.c **** 		printf("%f \n", pdm((int*)CM,M,index)/10000.0);
 218              		.loc 1 47 0 discriminator 2
 219 0026 40F20004 		movw	r4, #:lower16:.LC1
 220 002a C0F20004 		movt	r4, #:upper16:.LC1
 221 002e 3B46     		mov	r3, r7
 222 0030 1846     		mov	r0, r3
 223 0032 4FF00301 		mov	r1, #3
 224 0036 7A6A     		ldr	r2, [r7, #36]
 225 0038 FFF7FEFF 		bl	pdm
 226 003c 0346     		mov	r3, r0
 227 003e 1846     		mov	r0, r3
 228 0040 FFF7FEFF 		bl	__aeabi_i2d
 229 0044 0246     		mov	r2, r0
 230 0046 0B46     		mov	r3, r1
 231 0048 1046     		mov	r0, r2
 232 004a 1946     		mov	r1, r3
 233 004c 20A3     		adr	r3, .L16
 234 004e D3E90023 		ldrd	r2, [r3]
 235 0052 FFF7FEFF 		bl	__aeabi_ddiv
 236 0056 0246     		mov	r2, r0
 237 0058 0B46     		mov	r3, r1
 238 005a 2046     		mov	r0, r4
 239 005c FFF7FEFF 		bl	printf
  46:../src/main.c **** 	for (index=0; index<M; index++)
 240              		.loc 1 46 0 discriminator 2
 241 0060 7B6A     		ldr	r3, [r7, #36]
 242 0062 03F10103 		add	r3, r3, #1
 243 0066 7B62     		str	r3, [r7, #36]
 244              	.L11:
  46:../src/main.c **** 	for (index=0; index<M; index++)
 245              		.loc 1 46 0 is_stmt 0 discriminator 1
 246 0068 7B6A     		ldr	r3, [r7, #36]
 247 006a 022B     		cmp	r3, #2
 248 006c DBDD     		ble	.L12
  48:../src/main.c **** 
  49:../src/main.c **** 	printf("\n");
 249              		.loc 1 49 0 is_stmt 1
 250 006e 40F20003 		movw	r3, #:lower16:.LC2
 251 0072 C0F20003 		movt	r3, #:upper16:.LC2
 252 0076 1846     		mov	r0, r3
 253 0078 FFF7FEFF 		bl	printf
  50:../src/main.c **** 
  51:../src/main.c **** 	for (index=0; index<M; index++)
 254              		.loc 1 51 0
 255 007c 4FF00003 		mov	r3, #0
 256 0080 7B62     		str	r3, [r7, #36]
 257 0082 15E0     		b	.L13
 258              	.L14:
  52:../src/main.c **** 		printf("%f \n", pfa((int*)CM, index)); // modify to pfa(CM,M,index)
 259              		.loc 1 52 0 discriminator 2
 260 0084 40F20004 		movw	r4, #:lower16:.LC1
 261 0088 C0F20004 		movt	r4, #:upper16:.LC1
 262 008c 3B46     		mov	r3, r7
 263 008e 1846     		mov	r0, r3
 264 0090 796A     		ldr	r1, [r7, #36]
 265 0092 FFF7FEFF 		bl	pfa
 266 0096 0346     		mov	r3, r0
 267 0098 1846     		mov	r0, r3
 268 009a FFF7FEFF 		bl	__aeabi_f2d
 269 009e 0246     		mov	r2, r0
 270 00a0 0B46     		mov	r3, r1
 271 00a2 2046     		mov	r0, r4
 272 00a4 FFF7FEFF 		bl	printf
  51:../src/main.c **** 	for (index=0; index<M; index++)
 273              		.loc 1 51 0 discriminator 2
 274 00a8 7B6A     		ldr	r3, [r7, #36]
 275 00aa 03F10103 		add	r3, r3, #1
 276 00ae 7B62     		str	r3, [r7, #36]
 277              	.L13:
  51:../src/main.c **** 	for (index=0; index<M; index++)
 278              		.loc 1 51 0 is_stmt 0 discriminator 1
 279 00b0 7B6A     		ldr	r3, [r7, #36]
 280 00b2 022B     		cmp	r3, #2
 281 00b4 E6DD     		ble	.L14
 282              	.L15:
  53:../src/main.c **** 
  54:../src/main.c **** 	// Enter an infinite loop, just incrementing a counter
  55:../src/main.c **** 	volatile static int loop = 0;
  56:../src/main.c **** 	while (1) {
  57:../src/main.c **** 		loop++;
 283              		.loc 1 57 0 is_stmt 1 discriminator 1
 284 00b6 40F20003 		movw	r3, #:lower16:loop.3838
 285 00ba C0F20003 		movt	r3, #:upper16:loop.3838
 286 00be 1B68     		ldr	r3, [r3, #0]
 287 00c0 03F10102 		add	r2, r3, #1
 288 00c4 40F20003 		movw	r3, #:lower16:loop.3838
 289 00c8 C0F20003 		movt	r3, #:upper16:loop.3838
 290 00cc 1A60     		str	r2, [r3, #0]
  58:../src/main.c **** 	}
 291              		.loc 1 58 0 discriminator 1
 292 00ce F2E7     		b	.L15
 293              	.L17:
 294              		.align	3
 295              	.L16:
 296 00d0 00000000 		.word	0
 297 00d4 0088C340 		.word	1086556160
 298              		.cfi_endproc
 299              	.LFE1:
 301              		.bss
 302              		.align	2
 303              	loop.3838:
 304 0000 00000000 		.space	4
 305              		.text
 306              	.Letext0:
DEFINED SYMBOLS
                            *ABS*:00000000 main.c
C:\Users\Student\AppData\Local\Temp\cchyqn4k.s:21     .text.pfa:00000000 $t
C:\Users\Student\AppData\Local\Temp\cchyqn4k.s:26     .text.pfa:00000000 pfa
C:\Users\Student\AppData\Local\Temp\cchyqn4k.s:157    .rodata:00000000 $d
C:\Users\Student\AppData\Local\Temp\cchyqn4k.s:158    .rodata:00000000 .LC1
C:\Users\Student\AppData\Local\Temp\cchyqn4k.s:163    .rodata:00000008 .LC2
C:\Users\Student\AppData\Local\Temp\cchyqn4k.s:167    .rodata:0000000c .LC0
C:\Users\Student\AppData\Local\Temp\cchyqn4k.s:178    .text.main:00000000 $t
C:\Users\Student\AppData\Local\Temp\cchyqn4k.s:183    .text.main:00000000 main
C:\Users\Student\AppData\Local\Temp\cchyqn4k.s:303    .bss:00000000 loop.3838
C:\Users\Student\AppData\Local\Temp\cchyqn4k.s:296    .text.main:000000d0 $d
C:\Users\Student\AppData\Local\Temp\cchyqn4k.s:302    .bss:00000000 $d
                     .debug_frame:00000010 $d

UNDEFINED SYMBOLS
__aeabi_i2f
__aeabi_fdiv
__aeabi_i2d
__aeabi_ddiv
__aeabi_f2d
pdm
printf
