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
  33 0000 80B5     		push	{r7, lr}
  34              		.cfi_def_cfa_offset 8
  35              		.cfi_offset 7, -8
  36              		.cfi_offset 14, -4
  37 0002 86B0     		sub	sp, sp, #24
  38              		.cfi_def_cfa_offset 32
  39 0004 00AF     		add	r7, sp, #0
  40              		.cfi_def_cfa_register 7
  41 0006 7860     		str	r0, [r7, #4]
  42 0008 3960     		str	r1, [r7]
  15:../src/main.c **** 	// write the code for pfa(CM,M,index) here
  16:../src/main.c **** 	int false_pos;
  17:../src/main.c **** 	int notm;
  18:../src/main.c **** 	int i,j;
  19:../src/main.c **** 
  20:../src/main.c **** 	// gets all the false positives
  21:../src/main.c **** 	for(i=0; i<=M; i++){
  43              		.loc 1 21 0
  44 000a 0023     		movs	r3, #0
  45 000c FB60     		str	r3, [r7, #12]
  46 000e 14E0     		b	.L2
  47              	.L4:
  22:../src/main.c **** 		if(i!=index)
  48              		.loc 1 22 0
  49 0010 FA68     		ldr	r2, [r7, #12]
  50 0012 3B68     		ldr	r3, [r7]
  51 0014 9A42     		cmp	r2, r3
  52 0016 0DD0     		beq	.L3
  23:../src/main.c **** 			false_pos += *((CM+i*M) + index);
  53              		.loc 1 23 0
  54 0018 FA68     		ldr	r2, [r7, #12]
  55 001a 1346     		mov	r3, r2
  56 001c 5B00     		lsls	r3, r3, #1
  57 001e 1344     		add	r3, r3, r2
  58 0020 1A46     		mov	r2, r3
  59 0022 3B68     		ldr	r3, [r7]
  60 0024 1344     		add	r3, r3, r2
  61 0026 9B00     		lsls	r3, r3, #2
  62 0028 7A68     		ldr	r2, [r7, #4]
  63 002a 1344     		add	r3, r3, r2
  64 002c 1B68     		ldr	r3, [r3]
  65 002e 7A69     		ldr	r2, [r7, #20]
  66 0030 1344     		add	r3, r3, r2
  67 0032 7B61     		str	r3, [r7, #20]
  68              	.L3:
  21:../src/main.c **** 		if(i!=index)
  69              		.loc 1 21 0 discriminator 2
  70 0034 FB68     		ldr	r3, [r7, #12]
  71 0036 0133     		adds	r3, r3, #1
  72 0038 FB60     		str	r3, [r7, #12]
  73              	.L2:
  21:../src/main.c **** 		if(i!=index)
  74              		.loc 1 21 0 is_stmt 0 discriminator 1
  75 003a FB68     		ldr	r3, [r7, #12]
  76 003c 032B     		cmp	r3, #3
  77 003e E7DD     		ble	.L4
  24:../src/main.c **** 	}
  25:../src/main.c **** 
  26:../src/main.c **** 	for(i=0; i<=M; i++){
  78              		.loc 1 26 0 is_stmt 1
  79 0040 0023     		movs	r3, #0
  80 0042 FB60     		str	r3, [r7, #12]
  81 0044 1DE0     		b	.L5
  82              	.L9:
  27:../src/main.c **** 		if(i!=index){
  83              		.loc 1 27 0
  84 0046 FA68     		ldr	r2, [r7, #12]
  85 0048 3B68     		ldr	r3, [r7]
  86 004a 9A42     		cmp	r2, r3
  87 004c 16D0     		beq	.L6
  28:../src/main.c **** 			for(j=0; j<=M; j++) {
  88              		.loc 1 28 0
  89 004e 0023     		movs	r3, #0
  90 0050 BB60     		str	r3, [r7, #8]
  91 0052 10E0     		b	.L7
  92              	.L8:
  29:../src/main.c **** 				notm += *((CM+i*M) + j);
  93              		.loc 1 29 0 discriminator 3
  94 0054 FA68     		ldr	r2, [r7, #12]
  95 0056 1346     		mov	r3, r2
  96 0058 5B00     		lsls	r3, r3, #1
  97 005a 1344     		add	r3, r3, r2
  98 005c 1A46     		mov	r2, r3
  99 005e BB68     		ldr	r3, [r7, #8]
 100 0060 1344     		add	r3, r3, r2
 101 0062 9B00     		lsls	r3, r3, #2
 102 0064 7A68     		ldr	r2, [r7, #4]
 103 0066 1344     		add	r3, r3, r2
 104 0068 1B68     		ldr	r3, [r3]
 105 006a 3A69     		ldr	r2, [r7, #16]
 106 006c 1344     		add	r3, r3, r2
 107 006e 3B61     		str	r3, [r7, #16]
  28:../src/main.c **** 			for(j=0; j<=M; j++) {
 108              		.loc 1 28 0 discriminator 3
 109 0070 BB68     		ldr	r3, [r7, #8]
 110 0072 0133     		adds	r3, r3, #1
 111 0074 BB60     		str	r3, [r7, #8]
 112              	.L7:
  28:../src/main.c **** 			for(j=0; j<=M; j++) {
 113              		.loc 1 28 0 is_stmt 0 discriminator 1
 114 0076 BB68     		ldr	r3, [r7, #8]
 115 0078 032B     		cmp	r3, #3
 116 007a EBDD     		ble	.L8
 117              	.L6:
  26:../src/main.c **** 		if(i!=index){
 118              		.loc 1 26 0 is_stmt 1 discriminator 2
 119 007c FB68     		ldr	r3, [r7, #12]
 120 007e 0133     		adds	r3, r3, #1
 121 0080 FB60     		str	r3, [r7, #12]
 122              	.L5:
  26:../src/main.c **** 		if(i!=index){
 123              		.loc 1 26 0 is_stmt 0 discriminator 1
 124 0082 FB68     		ldr	r3, [r7, #12]
 125 0084 032B     		cmp	r3, #3
 126 0086 DEDD     		ble	.L9
  30:../src/main.c **** 			}
  31:../src/main.c **** 		}
  32:../src/main.c **** 	}
  33:../src/main.c **** 
  34:../src/main.c **** 	return (float)(false_pos/notm);
 127              		.loc 1 34 0 is_stmt 1
 128 0088 7A69     		ldr	r2, [r7, #20]
 129 008a 3B69     		ldr	r3, [r7, #16]
 130 008c 92FBF3F3 		sdiv	r3, r2, r3
 131 0090 1846     		mov	r0, r3
 132 0092 FFF7FEFF 		bl	__aeabi_i2f
 133 0096 0346     		mov	r3, r0
  35:../src/main.c **** }
 134              		.loc 1 35 0
 135 0098 1846     		mov	r0, r3
 136 009a 1837     		adds	r7, r7, #24
 137              		.cfi_def_cfa_offset 8
 138 009c BD46     		mov	sp, r7
 139              		.cfi_def_cfa_register 13
 140              		@ sp needed
 141 009e 80BD     		pop	{r7, pc}
 142              		.cfi_endproc
 143              	.LFE0:
 145              		.global	__aeabi_i2d
 146              		.global	__aeabi_ddiv
 147              		.section	.rodata
 148              		.align	2
 149              	.LC1:
 150 0000 2566200A 		.ascii	"%f \012\000"
 150      00
 151 0005 000000   		.align	2
 152              	.LC2:
 153 0008 0A00     		.ascii	"\012\000"
 154              		.global	__aeabi_f2d
 155 000a 0000     		.align	2
 156              	.LC0:
 157 000c 3C000000 		.word	60
 158 0010 02000000 		.word	2
 159 0014 03000000 		.word	3
 160 0018 0B000000 		.word	11
 161 001c 2F000000 		.word	47
 162 0020 07000000 		.word	7
 163 0024 1B000000 		.word	27
 164 0028 0E000000 		.word	14
 165 002c 18000000 		.word	24
 166              		.section	.text.main,"ax",%progbits
 167              		.align	2
 168              		.global	main
 169              		.thumb
 170              		.thumb_func
 172              	main:
 173              	.LFB1:
  36:../src/main.c **** 
  37:../src/main.c **** int main(void)
  38:../src/main.c **** {
 174              		.loc 1 38 0
 175              		.cfi_startproc
 176              		@ args = 0, pretend = 0, frame = 40
 177              		@ frame_needed = 1, uses_anonymous_args = 0
 178 0000 B0B5     		push	{r4, r5, r7, lr}
 179              		.cfi_def_cfa_offset 16
 180              		.cfi_offset 4, -16
 181              		.cfi_offset 5, -12
 182              		.cfi_offset 7, -8
 183              		.cfi_offset 14, -4
 184 0002 8AB0     		sub	sp, sp, #40
 185              		.cfi_def_cfa_offset 56
 186 0004 00AF     		add	r7, sp, #0
 187              		.cfi_def_cfa_register 7
  39:../src/main.c **** 	// Variable definitions
  40:../src/main.c **** 	int index;
  41:../src/main.c **** 	// Note: different initialisation list is needed for different M
  42:../src/main.c **** 	int CM[M][M]={{60,2,3},{11,47,7},{27,14,24}};
 188              		.loc 1 42 0
 189 0006 284B     		ldr	r3, .L17+8
 190 0008 3C46     		mov	r4, r7
 191 000a 1D46     		mov	r5, r3
 192 000c 0FCD     		ldmia	r5!, {r0, r1, r2, r3}
 193 000e 0FC4     		stmia	r4!, {r0, r1, r2, r3}
 194 0010 0FCD     		ldmia	r5!, {r0, r1, r2, r3}
 195 0012 0FC4     		stmia	r4!, {r0, r1, r2, r3}
 196 0014 2B68     		ldr	r3, [r5]
 197 0016 2360     		str	r3, [r4]
  43:../src/main.c **** 
  44:../src/main.c **** 	// Part I: PDm: Call assembly language function pdm() for each class m
  45:../src/main.c **** 	// note: index = m - 1
  46:../src/main.c **** 	for (index=0; index<M; index++)
 198              		.loc 1 46 0
 199 0018 0023     		movs	r3, #0
 200 001a 7B62     		str	r3, [r7, #36]
 201 001c 18E0     		b	.L12
 202              	.L13:
  47:../src/main.c **** 		printf("%f \n", pdm((int*)CM,M,index)/10000.0);
 203              		.loc 1 47 0 discriminator 3
 204 001e 3B46     		mov	r3, r7
 205 0020 7A6A     		ldr	r2, [r7, #36]
 206 0022 0321     		movs	r1, #3
 207 0024 1846     		mov	r0, r3
 208 0026 FFF7FEFF 		bl	pdm
 209 002a 0346     		mov	r3, r0
 210 002c 1846     		mov	r0, r3
 211 002e FFF7FEFF 		bl	__aeabi_i2d
 212 0032 1BA3     		adr	r3, .L17
 213 0034 D3E90023 		ldrd	r2, [r3]
 214 0038 FFF7FEFF 		bl	__aeabi_ddiv
 215 003c 0346     		mov	r3, r0
 216 003e 0C46     		mov	r4, r1
 217 0040 1A46     		mov	r2, r3
 218 0042 2346     		mov	r3, r4
 219 0044 1948     		ldr	r0, .L17+12
 220 0046 FFF7FEFF 		bl	printf
  46:../src/main.c **** 		printf("%f \n", pdm((int*)CM,M,index)/10000.0);
 221              		.loc 1 46 0 discriminator 3
 222 004a 7B6A     		ldr	r3, [r7, #36]
 223 004c 0133     		adds	r3, r3, #1
 224 004e 7B62     		str	r3, [r7, #36]
 225              	.L12:
  46:../src/main.c **** 		printf("%f \n", pdm((int*)CM,M,index)/10000.0);
 226              		.loc 1 46 0 is_stmt 0 discriminator 1
 227 0050 7B6A     		ldr	r3, [r7, #36]
 228 0052 022B     		cmp	r3, #2
 229 0054 E3DD     		ble	.L13
  48:../src/main.c **** 
  49:../src/main.c **** 	printf("\n");
 230              		.loc 1 49 0 is_stmt 1
 231 0056 1648     		ldr	r0, .L17+16
 232 0058 FFF7FEFF 		bl	printf
  50:../src/main.c **** 
  51:../src/main.c **** 	for (index=0; index<M; index++)
 233              		.loc 1 51 0
 234 005c 0023     		movs	r3, #0
 235 005e 7B62     		str	r3, [r7, #36]
 236 0060 12E0     		b	.L14
 237              	.L15:
  52:../src/main.c **** 		printf("%f \n", pfa((int*)CM, index)); // modify to pfa(CM,M,index)
 238              		.loc 1 52 0 discriminator 3
 239 0062 3B46     		mov	r3, r7
 240 0064 796A     		ldr	r1, [r7, #36]
 241 0066 1846     		mov	r0, r3
 242 0068 FFF7FEFF 		bl	pfa
 243 006c 0346     		mov	r3, r0
 244 006e 1846     		mov	r0, r3
 245 0070 FFF7FEFF 		bl	__aeabi_f2d
 246 0074 0346     		mov	r3, r0
 247 0076 0C46     		mov	r4, r1
 248 0078 1A46     		mov	r2, r3
 249 007a 2346     		mov	r3, r4
 250 007c 0B48     		ldr	r0, .L17+12
 251 007e FFF7FEFF 		bl	printf
  51:../src/main.c **** 		printf("%f \n", pfa((int*)CM, index)); // modify to pfa(CM,M,index)
 252              		.loc 1 51 0 discriminator 3
 253 0082 7B6A     		ldr	r3, [r7, #36]
 254 0084 0133     		adds	r3, r3, #1
 255 0086 7B62     		str	r3, [r7, #36]
 256              	.L14:
  51:../src/main.c **** 		printf("%f \n", pfa((int*)CM, index)); // modify to pfa(CM,M,index)
 257              		.loc 1 51 0 is_stmt 0 discriminator 1
 258 0088 7B6A     		ldr	r3, [r7, #36]
 259 008a 022B     		cmp	r3, #2
 260 008c E9DD     		ble	.L15
 261              	.L16:
  53:../src/main.c **** 
  54:../src/main.c **** 	// Enter an infinite loop, just incrementing a counter
  55:../src/main.c **** 	volatile static int loop = 0;
  56:../src/main.c **** 	while (1) {
  57:../src/main.c **** 		loop++;
 262              		.loc 1 57 0 is_stmt 1 discriminator 1
 263 008e 094B     		ldr	r3, .L17+20
 264 0090 1B68     		ldr	r3, [r3]
 265 0092 0133     		adds	r3, r3, #1
 266 0094 074A     		ldr	r2, .L17+20
 267 0096 1360     		str	r3, [r2]
  58:../src/main.c **** 	}
 268              		.loc 1 58 0 discriminator 1
 269 0098 F9E7     		b	.L16
 270              	.L18:
 271 009a 00BFAFF3 		.align	3
 271      0080
 272              	.L17:
 273 00a0 00000000 		.word	0
 274 00a4 0088C340 		.word	1086556160
 275 00a8 0C000000 		.word	.LC0
 276 00ac 00000000 		.word	.LC1
 277 00b0 08000000 		.word	.LC2
 278 00b4 00000000 		.word	loop.4040
 279              		.cfi_endproc
 280              	.LFE1:
 282              		.bss
 283              		.align	2
 284              	loop.4040:
 285 0000 00000000 		.space	4
 286              		.text
 287              	.Letext0:
DEFINED SYMBOLS
                            *ABS*:0000000000000000 main.c
/var/folders/qx/3thh6vs13c76w0sbjx53xp240000gn/T//cc0s38xJ.s:21     .text.pfa:0000000000000000 $t
/var/folders/qx/3thh6vs13c76w0sbjx53xp240000gn/T//cc0s38xJ.s:26     .text.pfa:0000000000000000 pfa
/var/folders/qx/3thh6vs13c76w0sbjx53xp240000gn/T//cc0s38xJ.s:148    .rodata:0000000000000000 $d
/var/folders/qx/3thh6vs13c76w0sbjx53xp240000gn/T//cc0s38xJ.s:167    .text.main:0000000000000000 $t
/var/folders/qx/3thh6vs13c76w0sbjx53xp240000gn/T//cc0s38xJ.s:172    .text.main:0000000000000000 main
/var/folders/qx/3thh6vs13c76w0sbjx53xp240000gn/T//cc0s38xJ.s:273    .text.main:00000000000000a0 $d
/var/folders/qx/3thh6vs13c76w0sbjx53xp240000gn/T//cc0s38xJ.s:284    .bss:0000000000000000 loop.4040
/var/folders/qx/3thh6vs13c76w0sbjx53xp240000gn/T//cc0s38xJ.s:283    .bss:0000000000000000 $d
                     .debug_frame:0000000000000010 $d
                           .group:0000000000000000 wm4.0.0c5e979f1ec464b8f03bc190bd321363
                           .group:0000000000000000 wm4.redlib_version.h.14.62abddb5b4efb2dd619a7dca5647eb78
                           .group:0000000000000000 wm4.libconfigarm.h.18.48d18a57a6aa6fedadbcea02294a713f
                           .group:0000000000000000 wm4.stdio.h.44.4674ea39c56924a8b52db7db756a4792

UNDEFINED SYMBOLS
__aeabi_i2f
__aeabi_i2d
__aeabi_ddiv
__aeabi_f2d
pdm
printf
