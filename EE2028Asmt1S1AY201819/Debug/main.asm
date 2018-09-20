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
  14              		.syntax unified
  15              		.file	"main.c"
  16              		.text
  17              	.Ltext0:
  18              		.cfi_sections	.debug_frame
  19              		.global	__aeabi_i2f
  20              		.global	__aeabi_fdiv
  21              		.section	.text.pfa,"ax",%progbits
  22              		.align	2
  23              		.global	pfa
  24              		.thumb
  25              		.thumb_func
  27              	pfa:
  28              	.LFB0:
  29              		.file 1 "../src/main.c"
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
  30              		.loc 1 14 0
  31              		.cfi_startproc
  32              		@ args = 0, pretend = 0, frame = 24
  33              		@ frame_needed = 1, uses_anonymous_args = 0
  34 0000 90B5     		push	{r4, r7, lr}
  35              		.cfi_def_cfa_offset 12
  36              		.cfi_offset 4, -12
  37              		.cfi_offset 7, -8
  38              		.cfi_offset 14, -4
  39 0002 87B0     		sub	sp, sp, #28
  40              		.cfi_def_cfa_offset 40
  41 0004 00AF     		add	r7, sp, #0
  42              		.cfi_def_cfa_register 7
  43 0006 7860     		str	r0, [r7, #4]
  44 0008 3960     		str	r1, [r7]
  15:../src/main.c **** 	// write the code for pfa(CM,M,index) here
  16:../src/main.c **** 	int false_pos = 0;
  45              		.loc 1 16 0
  46 000a 0023     		movs	r3, #0
  47 000c 7B61     		str	r3, [r7, #20]
  17:../src/main.c **** 	int notm = 0;
  48              		.loc 1 17 0
  49 000e 0023     		movs	r3, #0
  50 0010 3B61     		str	r3, [r7, #16]
  18:../src/main.c **** 	int i,j;
  19:../src/main.c **** 
  20:../src/main.c **** 	// gets all the false positives
  21:../src/main.c **** 	for(i=0; i<M; i++){
  51              		.loc 1 21 0
  52 0012 0023     		movs	r3, #0
  53 0014 FB60     		str	r3, [r7, #12]
  54 0016 14E0     		b	.L2
  55              	.L4:
  22:../src/main.c **** 		if(i!=index)
  56              		.loc 1 22 0
  57 0018 FA68     		ldr	r2, [r7, #12]
  58 001a 3B68     		ldr	r3, [r7]
  59 001c 9A42     		cmp	r2, r3
  60 001e 0DD0     		beq	.L3
  23:../src/main.c **** 			false_pos += *((CM+i*M) + index);
  61              		.loc 1 23 0
  62 0020 FA68     		ldr	r2, [r7, #12]
  63 0022 1346     		mov	r3, r2
  64 0024 5B00     		lsls	r3, r3, #1
  65 0026 1344     		add	r3, r3, r2
  66 0028 1A46     		mov	r2, r3
  67 002a 3B68     		ldr	r3, [r7]
  68 002c 1344     		add	r3, r3, r2
  69 002e 9B00     		lsls	r3, r3, #2
  70 0030 7A68     		ldr	r2, [r7, #4]
  71 0032 1344     		add	r3, r3, r2
  72 0034 1B68     		ldr	r3, [r3]
  73 0036 7A69     		ldr	r2, [r7, #20]
  74 0038 1344     		add	r3, r3, r2
  75 003a 7B61     		str	r3, [r7, #20]
  76              	.L3:
  21:../src/main.c **** 		if(i!=index)
  77              		.loc 1 21 0 discriminator 2
  78 003c FB68     		ldr	r3, [r7, #12]
  79 003e 0133     		adds	r3, r3, #1
  80 0040 FB60     		str	r3, [r7, #12]
  81              	.L2:
  21:../src/main.c **** 		if(i!=index)
  82              		.loc 1 21 0 is_stmt 0 discriminator 1
  83 0042 FB68     		ldr	r3, [r7, #12]
  84 0044 022B     		cmp	r3, #2
  85 0046 E7DD     		ble	.L4
  24:../src/main.c **** 	}
  25:../src/main.c **** 
  26:../src/main.c **** 	for(i=0; i<M; i++){
  86              		.loc 1 26 0 is_stmt 1
  87 0048 0023     		movs	r3, #0
  88 004a FB60     		str	r3, [r7, #12]
  89 004c 1DE0     		b	.L5
  90              	.L9:
  27:../src/main.c **** 		if(i!=index){
  91              		.loc 1 27 0
  92 004e FA68     		ldr	r2, [r7, #12]
  93 0050 3B68     		ldr	r3, [r7]
  94 0052 9A42     		cmp	r2, r3
  95 0054 16D0     		beq	.L6
  28:../src/main.c **** 			for(j=0; j<M; j++) {
  96              		.loc 1 28 0
  97 0056 0023     		movs	r3, #0
  98 0058 BB60     		str	r3, [r7, #8]
  99 005a 10E0     		b	.L7
 100              	.L8:
  29:../src/main.c **** 				notm += *((CM+i*M) + j);
 101              		.loc 1 29 0 discriminator 3
 102 005c FA68     		ldr	r2, [r7, #12]
 103 005e 1346     		mov	r3, r2
 104 0060 5B00     		lsls	r3, r3, #1
 105 0062 1344     		add	r3, r3, r2
 106 0064 1A46     		mov	r2, r3
 107 0066 BB68     		ldr	r3, [r7, #8]
 108 0068 1344     		add	r3, r3, r2
 109 006a 9B00     		lsls	r3, r3, #2
 110 006c 7A68     		ldr	r2, [r7, #4]
 111 006e 1344     		add	r3, r3, r2
 112 0070 1B68     		ldr	r3, [r3]
 113 0072 3A69     		ldr	r2, [r7, #16]
 114 0074 1344     		add	r3, r3, r2
 115 0076 3B61     		str	r3, [r7, #16]
  28:../src/main.c **** 			for(j=0; j<M; j++) {
 116              		.loc 1 28 0 discriminator 3
 117 0078 BB68     		ldr	r3, [r7, #8]
 118 007a 0133     		adds	r3, r3, #1
 119 007c BB60     		str	r3, [r7, #8]
 120              	.L7:
  28:../src/main.c **** 			for(j=0; j<M; j++) {
 121              		.loc 1 28 0 is_stmt 0 discriminator 1
 122 007e BB68     		ldr	r3, [r7, #8]
 123 0080 022B     		cmp	r3, #2
 124 0082 EBDD     		ble	.L8
 125              	.L6:
  26:../src/main.c **** 		if(i!=index){
 126              		.loc 1 26 0 is_stmt 1 discriminator 2
 127 0084 FB68     		ldr	r3, [r7, #12]
 128 0086 0133     		adds	r3, r3, #1
 129 0088 FB60     		str	r3, [r7, #12]
 130              	.L5:
  26:../src/main.c **** 		if(i!=index){
 131              		.loc 1 26 0 is_stmt 0 discriminator 1
 132 008a FB68     		ldr	r3, [r7, #12]
 133 008c 022B     		cmp	r3, #2
 134 008e DEDD     		ble	.L9
  30:../src/main.c **** 			}
  31:../src/main.c **** 		}
  32:../src/main.c **** 	}
  33:../src/main.c **** 
  34:../src/main.c **** 	return ((float)false_pos/(float)notm);
 135              		.loc 1 34 0 is_stmt 1
 136 0090 7869     		ldr	r0, [r7, #20]
 137 0092 FFF7FEFF 		bl	__aeabi_i2f
 138 0096 0446     		mov	r4, r0
 139 0098 3869     		ldr	r0, [r7, #16]
 140 009a FFF7FEFF 		bl	__aeabi_i2f
 141 009e 0346     		mov	r3, r0
 142 00a0 1946     		mov	r1, r3
 143 00a2 2046     		mov	r0, r4
 144 00a4 FFF7FEFF 		bl	__aeabi_fdiv
 145 00a8 0346     		mov	r3, r0
  35:../src/main.c **** }
 146              		.loc 1 35 0
 147 00aa 1846     		mov	r0, r3
 148 00ac 1C37     		adds	r7, r7, #28
 149              		.cfi_def_cfa_offset 12
 150 00ae BD46     		mov	sp, r7
 151              		.cfi_def_cfa_register 13
 152              		@ sp needed
 153 00b0 90BD     		pop	{r4, r7, pc}
 154              		.cfi_endproc
 155              	.LFE0:
 157              		.global	__aeabi_i2d
 158              		.global	__aeabi_ddiv
 159 00b2 00BF     		.section	.rodata
 160              		.align	2
 161              	.LC1:
 162 0000 2566200A 		.ascii	"%f \012\000"
 162      00
 163 0005 000000   		.align	2
 164              	.LC2:
 165 0008 0A00     		.ascii	"\012\000"
 166              		.global	__aeabi_f2d
 167 000a 0000     		.align	2
 168              	.LC0:
 169 000c 3C000000 		.word	60
 170 0010 02000000 		.word	2
 171 0014 03000000 		.word	3
 172 0018 0B000000 		.word	11
 173 001c 2F000000 		.word	47
 174 0020 07000000 		.word	7
 175 0024 1B000000 		.word	27
 176 0028 0E000000 		.word	14
 177 002c 18000000 		.word	24
 178              		.section	.text.main,"ax",%progbits
 179              		.align	2
 180              		.global	main
 181              		.thumb
 182              		.thumb_func
 184              	main:
 185              	.LFB1:
  36:../src/main.c **** 
  37:../src/main.c **** int main(void)
  38:../src/main.c **** {
 186              		.loc 1 38 0
 187              		.cfi_startproc
 188              		@ args = 0, pretend = 0, frame = 40
 189              		@ frame_needed = 1, uses_anonymous_args = 0
 190 0000 B0B5     		push	{r4, r5, r7, lr}
 191              		.cfi_def_cfa_offset 16
 192              		.cfi_offset 4, -16
 193              		.cfi_offset 5, -12
 194              		.cfi_offset 7, -8
 195              		.cfi_offset 14, -4
 196 0002 8AB0     		sub	sp, sp, #40
 197              		.cfi_def_cfa_offset 56
 198 0004 00AF     		add	r7, sp, #0
 199              		.cfi_def_cfa_register 7
  39:../src/main.c **** 	// Variable definitions
  40:../src/main.c **** 	int index;
  41:../src/main.c **** 	// Note: different initialisation list is needed for different M
  42:../src/main.c **** 	int CM[M][M]={{60,2,3},{11,47,7},{27,14,24}};
 200              		.loc 1 42 0
 201 0006 284B     		ldr	r3, .L17+8
 202 0008 3C46     		mov	r4, r7
 203 000a 1D46     		mov	r5, r3
 204 000c 0FCD     		ldmia	r5!, {r0, r1, r2, r3}
 205 000e 0FC4     		stmia	r4!, {r0, r1, r2, r3}
 206 0010 0FCD     		ldmia	r5!, {r0, r1, r2, r3}
 207 0012 0FC4     		stmia	r4!, {r0, r1, r2, r3}
 208 0014 2B68     		ldr	r3, [r5]
 209 0016 2360     		str	r3, [r4]
  43:../src/main.c **** 
  44:../src/main.c **** 	// Part I: PDm: Call assembly language function pdm() for each class m
  45:../src/main.c **** 	// note: index = m - 1
  46:../src/main.c **** 	for (index=0; index<M; index++)
 210              		.loc 1 46 0
 211 0018 0023     		movs	r3, #0
 212 001a 7B62     		str	r3, [r7, #36]
 213 001c 18E0     		b	.L12
 214              	.L13:
  47:../src/main.c **** 		printf("%f \n", pdm((int*)CM,M,index)/10000.0);
 215              		.loc 1 47 0 discriminator 3
 216 001e 3B46     		mov	r3, r7
 217 0020 7A6A     		ldr	r2, [r7, #36]
 218 0022 0321     		movs	r1, #3
 219 0024 1846     		mov	r0, r3
 220 0026 FFF7FEFF 		bl	pdm
 221 002a 0346     		mov	r3, r0
 222 002c 1846     		mov	r0, r3
 223 002e FFF7FEFF 		bl	__aeabi_i2d
 224 0032 1BA3     		adr	r3, .L17
 225 0034 D3E90023 		ldrd	r2, [r3]
 226 0038 FFF7FEFF 		bl	__aeabi_ddiv
 227 003c 0346     		mov	r3, r0
 228 003e 0C46     		mov	r4, r1
 229 0040 1A46     		mov	r2, r3
 230 0042 2346     		mov	r3, r4
 231 0044 1948     		ldr	r0, .L17+12
 232 0046 FFF7FEFF 		bl	printf
  46:../src/main.c **** 		printf("%f \n", pdm((int*)CM,M,index)/10000.0);
 233              		.loc 1 46 0 discriminator 3
 234 004a 7B6A     		ldr	r3, [r7, #36]
 235 004c 0133     		adds	r3, r3, #1
 236 004e 7B62     		str	r3, [r7, #36]
 237              	.L12:
  46:../src/main.c **** 		printf("%f \n", pdm((int*)CM,M,index)/10000.0);
 238              		.loc 1 46 0 is_stmt 0 discriminator 1
 239 0050 7B6A     		ldr	r3, [r7, #36]
 240 0052 022B     		cmp	r3, #2
 241 0054 E3DD     		ble	.L13
  48:../src/main.c **** 
  49:../src/main.c **** 	printf("\n");
 242              		.loc 1 49 0 is_stmt 1
 243 0056 1648     		ldr	r0, .L17+16
 244 0058 FFF7FEFF 		bl	printf
  50:../src/main.c **** 
  51:../src/main.c **** 	for (index=0; index<M; index++)
 245              		.loc 1 51 0
 246 005c 0023     		movs	r3, #0
 247 005e 7B62     		str	r3, [r7, #36]
 248 0060 12E0     		b	.L14
 249              	.L15:
  52:../src/main.c **** 		printf("%f \n", pfa((int*)CM, index)); // modify to pfa(CM,M,index)
 250              		.loc 1 52 0 discriminator 3
 251 0062 3B46     		mov	r3, r7
 252 0064 796A     		ldr	r1, [r7, #36]
 253 0066 1846     		mov	r0, r3
 254 0068 FFF7FEFF 		bl	pfa
 255 006c 0346     		mov	r3, r0
 256 006e 1846     		mov	r0, r3
 257 0070 FFF7FEFF 		bl	__aeabi_f2d
 258 0074 0346     		mov	r3, r0
 259 0076 0C46     		mov	r4, r1
 260 0078 1A46     		mov	r2, r3
 261 007a 2346     		mov	r3, r4
 262 007c 0B48     		ldr	r0, .L17+12
 263 007e FFF7FEFF 		bl	printf
  51:../src/main.c **** 		printf("%f \n", pfa((int*)CM, index)); // modify to pfa(CM,M,index)
 264              		.loc 1 51 0 discriminator 3
 265 0082 7B6A     		ldr	r3, [r7, #36]
 266 0084 0133     		adds	r3, r3, #1
 267 0086 7B62     		str	r3, [r7, #36]
 268              	.L14:
  51:../src/main.c **** 		printf("%f \n", pfa((int*)CM, index)); // modify to pfa(CM,M,index)
 269              		.loc 1 51 0 is_stmt 0 discriminator 1
 270 0088 7B6A     		ldr	r3, [r7, #36]
 271 008a 022B     		cmp	r3, #2
 272 008c E9DD     		ble	.L15
 273              	.L16:
  53:../src/main.c **** 
  54:../src/main.c **** 	// Enter an infinite loop, just incrementing a counter
  55:../src/main.c **** 	volatile static int loop = 0;
  56:../src/main.c **** 	while (1) {
  57:../src/main.c **** 		loop++;
 274              		.loc 1 57 0 is_stmt 1 discriminator 1
 275 008e 094B     		ldr	r3, .L17+20
 276 0090 1B68     		ldr	r3, [r3]
 277 0092 0133     		adds	r3, r3, #1
 278 0094 074A     		ldr	r2, .L17+20
 279 0096 1360     		str	r3, [r2]
  58:../src/main.c **** 	}
 280              		.loc 1 58 0 discriminator 1
 281 0098 F9E7     		b	.L16
 282              	.L18:
 283 009a 00BFAFF3 		.align	3
 283      0080
 284              	.L17:
 285 00a0 00000000 		.word	0
 286 00a4 0088C340 		.word	1086556160
 287 00a8 0C000000 		.word	.LC0
 288 00ac 00000000 		.word	.LC1
 289 00b0 08000000 		.word	.LC2
 290 00b4 00000000 		.word	loop.4040
 291              		.cfi_endproc
 292              	.LFE1:
 294              		.bss
 295              		.align	2
 296              	loop.4040:
 297 0000 00000000 		.space	4
 298              		.text
 299              	.Letext0:
DEFINED SYMBOLS
                            *ABS*:0000000000000000 main.c
/var/folders/qx/3thh6vs13c76w0sbjx53xp240000gn/T//ccVX0ejP.s:22     .text.pfa:0000000000000000 $t
/var/folders/qx/3thh6vs13c76w0sbjx53xp240000gn/T//ccVX0ejP.s:27     .text.pfa:0000000000000000 pfa
/var/folders/qx/3thh6vs13c76w0sbjx53xp240000gn/T//ccVX0ejP.s:160    .rodata:0000000000000000 $d
/var/folders/qx/3thh6vs13c76w0sbjx53xp240000gn/T//ccVX0ejP.s:179    .text.main:0000000000000000 $t
/var/folders/qx/3thh6vs13c76w0sbjx53xp240000gn/T//ccVX0ejP.s:184    .text.main:0000000000000000 main
/var/folders/qx/3thh6vs13c76w0sbjx53xp240000gn/T//ccVX0ejP.s:285    .text.main:00000000000000a0 $d
/var/folders/qx/3thh6vs13c76w0sbjx53xp240000gn/T//ccVX0ejP.s:296    .bss:0000000000000000 loop.4040
/var/folders/qx/3thh6vs13c76w0sbjx53xp240000gn/T//ccVX0ejP.s:295    .bss:0000000000000000 $d
                     .debug_frame:0000000000000010 $d
                           .group:0000000000000000 wm4.0.0c5e979f1ec464b8f03bc190bd321363
                           .group:0000000000000000 wm4.redlib_version.h.14.62abddb5b4efb2dd619a7dca5647eb78
                           .group:0000000000000000 wm4.libconfigarm.h.18.48d18a57a6aa6fedadbcea02294a713f
                           .group:0000000000000000 wm4.stdio.h.44.4674ea39c56924a8b52db7db756a4792

UNDEFINED SYMBOLS
__aeabi_i2f
__aeabi_fdiv
__aeabi_i2d
__aeabi_ddiv
__aeabi_f2d
pdm
printf
