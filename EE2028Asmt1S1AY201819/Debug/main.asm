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
  20:../src/main.c **** 	for(i=0; i<M; i++){
  51              		.loc 1 20 0
  52 0012 0023     		movs	r3, #0
  53 0014 FB60     		str	r3, [r7, #12]
  54 0016 2BE0     		b	.L2
  55              	.L6:
  21:../src/main.c **** 		if(i!=index){
  56              		.loc 1 21 0
  57 0018 FA68     		ldr	r2, [r7, #12]
  58 001a 3B68     		ldr	r3, [r7]
  59 001c 9A42     		cmp	r2, r3
  60 001e 24D0     		beq	.L3
  22:../src/main.c **** 			for(j=0; j<M; j++) {
  61              		.loc 1 22 0
  62 0020 0023     		movs	r3, #0
  63 0022 BB60     		str	r3, [r7, #8]
  64 0024 10E0     		b	.L4
  65              	.L5:
  23:../src/main.c **** 				notm += *((CM+i*M) + j);
  66              		.loc 1 23 0 discriminator 3
  67 0026 FA68     		ldr	r2, [r7, #12]
  68 0028 1346     		mov	r3, r2
  69 002a 5B00     		lsls	r3, r3, #1
  70 002c 1344     		add	r3, r3, r2
  71 002e 1A46     		mov	r2, r3
  72 0030 BB68     		ldr	r3, [r7, #8]
  73 0032 1344     		add	r3, r3, r2
  74 0034 9B00     		lsls	r3, r3, #2
  75 0036 7A68     		ldr	r2, [r7, #4]
  76 0038 1344     		add	r3, r3, r2
  77 003a 1B68     		ldr	r3, [r3]
  78 003c 3A69     		ldr	r2, [r7, #16]
  79 003e 1344     		add	r3, r3, r2
  80 0040 3B61     		str	r3, [r7, #16]
  22:../src/main.c **** 			for(j=0; j<M; j++) {
  81              		.loc 1 22 0 discriminator 3
  82 0042 BB68     		ldr	r3, [r7, #8]
  83 0044 0133     		adds	r3, r3, #1
  84 0046 BB60     		str	r3, [r7, #8]
  85              	.L4:
  22:../src/main.c **** 			for(j=0; j<M; j++) {
  86              		.loc 1 22 0 is_stmt 0 discriminator 1
  87 0048 BB68     		ldr	r3, [r7, #8]
  88 004a 022B     		cmp	r3, #2
  89 004c EBDD     		ble	.L5
  24:../src/main.c **** 			}
  25:../src/main.c **** 			false_pos += *((CM+i*M) + index);
  90              		.loc 1 25 0 is_stmt 1
  91 004e FA68     		ldr	r2, [r7, #12]
  92 0050 1346     		mov	r3, r2
  93 0052 5B00     		lsls	r3, r3, #1
  94 0054 1344     		add	r3, r3, r2
  95 0056 1A46     		mov	r2, r3
  96 0058 3B68     		ldr	r3, [r7]
  97 005a 1344     		add	r3, r3, r2
  98 005c 9B00     		lsls	r3, r3, #2
  99 005e 7A68     		ldr	r2, [r7, #4]
 100 0060 1344     		add	r3, r3, r2
 101 0062 1B68     		ldr	r3, [r3]
 102 0064 7A69     		ldr	r2, [r7, #20]
 103 0066 1344     		add	r3, r3, r2
 104 0068 7B61     		str	r3, [r7, #20]
 105              	.L3:
  20:../src/main.c **** 		if(i!=index){
 106              		.loc 1 20 0 discriminator 2
 107 006a FB68     		ldr	r3, [r7, #12]
 108 006c 0133     		adds	r3, r3, #1
 109 006e FB60     		str	r3, [r7, #12]
 110              	.L2:
  20:../src/main.c **** 		if(i!=index){
 111              		.loc 1 20 0 is_stmt 0 discriminator 1
 112 0070 FB68     		ldr	r3, [r7, #12]
 113 0072 022B     		cmp	r3, #2
 114 0074 D0DD     		ble	.L6
  26:../src/main.c **** 		}
  27:../src/main.c **** 	}
  28:../src/main.c **** 
  29:../src/main.c **** 	return ((float)false_pos/(float)notm);
 115              		.loc 1 29 0 is_stmt 1
 116 0076 7869     		ldr	r0, [r7, #20]
 117 0078 FFF7FEFF 		bl	__aeabi_i2f
 118 007c 0446     		mov	r4, r0
 119 007e 3869     		ldr	r0, [r7, #16]
 120 0080 FFF7FEFF 		bl	__aeabi_i2f
 121 0084 0346     		mov	r3, r0
 122 0086 1946     		mov	r1, r3
 123 0088 2046     		mov	r0, r4
 124 008a FFF7FEFF 		bl	__aeabi_fdiv
 125 008e 0346     		mov	r3, r0
  30:../src/main.c **** }
 126              		.loc 1 30 0
 127 0090 1846     		mov	r0, r3
 128 0092 1C37     		adds	r7, r7, #28
 129              		.cfi_def_cfa_offset 12
 130 0094 BD46     		mov	sp, r7
 131              		.cfi_def_cfa_register 13
 132              		@ sp needed
 133 0096 90BD     		pop	{r4, r7, pc}
 134              		.cfi_endproc
 135              	.LFE0:
 137              		.global	__aeabi_i2d
 138              		.global	__aeabi_ddiv
 139              		.section	.rodata
 140              		.align	2
 141              	.LC1:
 142 0000 2566200A 		.ascii	"%f \012\000"
 142      00
 143 0005 000000   		.align	2
 144              	.LC2:
 145 0008 0A00     		.ascii	"\012\000"
 146              		.global	__aeabi_f2d
 147 000a 0000     		.align	2
 148              	.LC0:
 149 000c 3C000000 		.word	60
 150 0010 02000000 		.word	2
 151 0014 03000000 		.word	3
 152 0018 0B000000 		.word	11
 153 001c 2F000000 		.word	47
 154 0020 07000000 		.word	7
 155 0024 1B000000 		.word	27
 156 0028 0E000000 		.word	14
 157 002c 18000000 		.word	24
 158              		.section	.text.main,"ax",%progbits
 159              		.align	2
 160              		.global	main
 161              		.thumb
 162              		.thumb_func
 164              	main:
 165              	.LFB1:
  31:../src/main.c **** 
  32:../src/main.c **** int main(void)
  33:../src/main.c **** {
 166              		.loc 1 33 0
 167              		.cfi_startproc
 168              		@ args = 0, pretend = 0, frame = 40
 169              		@ frame_needed = 1, uses_anonymous_args = 0
 170 0000 B0B5     		push	{r4, r5, r7, lr}
 171              		.cfi_def_cfa_offset 16
 172              		.cfi_offset 4, -16
 173              		.cfi_offset 5, -12
 174              		.cfi_offset 7, -8
 175              		.cfi_offset 14, -4
 176 0002 8AB0     		sub	sp, sp, #40
 177              		.cfi_def_cfa_offset 56
 178 0004 00AF     		add	r7, sp, #0
 179              		.cfi_def_cfa_register 7
  34:../src/main.c **** 	// Variable definitions
  35:../src/main.c **** 	int index;
  36:../src/main.c **** 	// Note: different initialisation list is needed for different M
  37:../src/main.c **** 	int CM[M][M]={{60,2,3},
 180              		.loc 1 37 0
 181 0006 284B     		ldr	r3, .L14+8
 182 0008 3C46     		mov	r4, r7
 183 000a 1D46     		mov	r5, r3
 184 000c 0FCD     		ldmia	r5!, {r0, r1, r2, r3}
 185 000e 0FC4     		stmia	r4!, {r0, r1, r2, r3}
 186 0010 0FCD     		ldmia	r5!, {r0, r1, r2, r3}
 187 0012 0FC4     		stmia	r4!, {r0, r1, r2, r3}
 188 0014 2B68     		ldr	r3, [r5]
 189 0016 2360     		str	r3, [r4]
  38:../src/main.c **** 				  {11,47,7},
  39:../src/main.c **** 				  {27,14,24}};
  40:../src/main.c **** 
  41:../src/main.c **** 	// Part I: PDm: Call assembly language function pdm() for each class m
  42:../src/main.c **** 	// note: index = m - 1
  43:../src/main.c **** 	for (index=0; index<M; index++)
 190              		.loc 1 43 0
 191 0018 0023     		movs	r3, #0
 192 001a 7B62     		str	r3, [r7, #36]
 193 001c 18E0     		b	.L9
 194              	.L10:
  44:../src/main.c **** 		printf("%f \n", pdm((int*)CM,M,index)/10000.0);
 195              		.loc 1 44 0 discriminator 3
 196 001e 3B46     		mov	r3, r7
 197 0020 7A6A     		ldr	r2, [r7, #36]
 198 0022 0321     		movs	r1, #3
 199 0024 1846     		mov	r0, r3
 200 0026 FFF7FEFF 		bl	pdm
 201 002a 0346     		mov	r3, r0
 202 002c 1846     		mov	r0, r3
 203 002e FFF7FEFF 		bl	__aeabi_i2d
 204 0032 1BA3     		adr	r3, .L14
 205 0034 D3E90023 		ldrd	r2, [r3]
 206 0038 FFF7FEFF 		bl	__aeabi_ddiv
 207 003c 0346     		mov	r3, r0
 208 003e 0C46     		mov	r4, r1
 209 0040 1A46     		mov	r2, r3
 210 0042 2346     		mov	r3, r4
 211 0044 1948     		ldr	r0, .L14+12
 212 0046 FFF7FEFF 		bl	printf
  43:../src/main.c **** 		printf("%f \n", pdm((int*)CM,M,index)/10000.0);
 213              		.loc 1 43 0 discriminator 3
 214 004a 7B6A     		ldr	r3, [r7, #36]
 215 004c 0133     		adds	r3, r3, #1
 216 004e 7B62     		str	r3, [r7, #36]
 217              	.L9:
  43:../src/main.c **** 		printf("%f \n", pdm((int*)CM,M,index)/10000.0);
 218              		.loc 1 43 0 is_stmt 0 discriminator 1
 219 0050 7B6A     		ldr	r3, [r7, #36]
 220 0052 022B     		cmp	r3, #2
 221 0054 E3DD     		ble	.L10
  45:../src/main.c **** 
  46:../src/main.c **** 	printf("\n");
 222              		.loc 1 46 0 is_stmt 1
 223 0056 1648     		ldr	r0, .L14+16
 224 0058 FFF7FEFF 		bl	printf
  47:../src/main.c **** 
  48:../src/main.c **** 	for (index=0; index<M; index++)
 225              		.loc 1 48 0
 226 005c 0023     		movs	r3, #0
 227 005e 7B62     		str	r3, [r7, #36]
 228 0060 12E0     		b	.L11
 229              	.L12:
  49:../src/main.c **** 		printf("%f \n", pfa((int*)CM, index)); // modify to pfa(CM,M,index)
 230              		.loc 1 49 0 discriminator 3
 231 0062 3B46     		mov	r3, r7
 232 0064 796A     		ldr	r1, [r7, #36]
 233 0066 1846     		mov	r0, r3
 234 0068 FFF7FEFF 		bl	pfa
 235 006c 0346     		mov	r3, r0
 236 006e 1846     		mov	r0, r3
 237 0070 FFF7FEFF 		bl	__aeabi_f2d
 238 0074 0346     		mov	r3, r0
 239 0076 0C46     		mov	r4, r1
 240 0078 1A46     		mov	r2, r3
 241 007a 2346     		mov	r3, r4
 242 007c 0B48     		ldr	r0, .L14+12
 243 007e FFF7FEFF 		bl	printf
  48:../src/main.c **** 		printf("%f \n", pfa((int*)CM, index)); // modify to pfa(CM,M,index)
 244              		.loc 1 48 0 discriminator 3
 245 0082 7B6A     		ldr	r3, [r7, #36]
 246 0084 0133     		adds	r3, r3, #1
 247 0086 7B62     		str	r3, [r7, #36]
 248              	.L11:
  48:../src/main.c **** 		printf("%f \n", pfa((int*)CM, index)); // modify to pfa(CM,M,index)
 249              		.loc 1 48 0 is_stmt 0 discriminator 1
 250 0088 7B6A     		ldr	r3, [r7, #36]
 251 008a 022B     		cmp	r3, #2
 252 008c E9DD     		ble	.L12
 253              	.L13:
  50:../src/main.c **** 
  51:../src/main.c **** 	// Enter an infinite loop, just incrementing a counter
  52:../src/main.c **** 	volatile static int loop = 0;
  53:../src/main.c **** 	while (1) {
  54:../src/main.c **** 		loop++;
 254              		.loc 1 54 0 is_stmt 1 discriminator 1
 255 008e 094B     		ldr	r3, .L14+20
 256 0090 1B68     		ldr	r3, [r3]
 257 0092 0133     		adds	r3, r3, #1
 258 0094 074A     		ldr	r2, .L14+20
 259 0096 1360     		str	r3, [r2]
  55:../src/main.c **** 	}
 260              		.loc 1 55 0 discriminator 1
 261 0098 F9E7     		b	.L13
 262              	.L15:
 263 009a 00BFAFF3 		.align	3
 263      0080
 264              	.L14:
 265 00a0 00000000 		.word	0
 266 00a4 0088C340 		.word	1086556160
 267 00a8 0C000000 		.word	.LC0
 268 00ac 00000000 		.word	.LC1
 269 00b0 08000000 		.word	.LC2
 270 00b4 00000000 		.word	loop.4037
 271              		.cfi_endproc
 272              	.LFE1:
 274              		.bss
 275              		.align	2
 276              	loop.4037:
 277 0000 00000000 		.space	4
 278              		.text
 279              	.Letext0:
DEFINED SYMBOLS
                            *ABS*:0000000000000000 main.c
/var/folders/qx/3thh6vs13c76w0sbjx53xp240000gn/T//ccah8krW.s:22     .text.pfa:0000000000000000 $t
/var/folders/qx/3thh6vs13c76w0sbjx53xp240000gn/T//ccah8krW.s:27     .text.pfa:0000000000000000 pfa
/var/folders/qx/3thh6vs13c76w0sbjx53xp240000gn/T//ccah8krW.s:140    .rodata:0000000000000000 $d
/var/folders/qx/3thh6vs13c76w0sbjx53xp240000gn/T//ccah8krW.s:159    .text.main:0000000000000000 $t
/var/folders/qx/3thh6vs13c76w0sbjx53xp240000gn/T//ccah8krW.s:164    .text.main:0000000000000000 main
/var/folders/qx/3thh6vs13c76w0sbjx53xp240000gn/T//ccah8krW.s:265    .text.main:00000000000000a0 $d
/var/folders/qx/3thh6vs13c76w0sbjx53xp240000gn/T//ccah8krW.s:276    .bss:0000000000000000 loop.4037
/var/folders/qx/3thh6vs13c76w0sbjx53xp240000gn/T//ccah8krW.s:275    .bss:0000000000000000 $d
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
