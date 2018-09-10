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
  19              		.section	.text.pfa,"ax",%progbits
  20              		.align	2
  21              		.global	pfa
  22              		.thumb
  23              		.thumb_func
  25              	pfa:
  26              	.LFB0:
  27              		.file 1 "../src/main.c"
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
  13:../src/main.c **** float pfa()
  14:../src/main.c **** {
  28              		.loc 1 14 0
  29              		.cfi_startproc
  30              		@ args = 0, pretend = 0, frame = 0
  31              		@ frame_needed = 1, uses_anonymous_args = 0
  32              		@ link register save eliminated.
  33 0000 80B4     		push	{r7}
  34              		.cfi_def_cfa_offset 4
  35              		.cfi_offset 7, -4
  36 0002 00AF     		add	r7, sp, #0
  37              		.cfi_def_cfa_register 7
  15:../src/main.c **** 	// write the code for pfa(CM,M,index) here
  16:../src/main.c **** 	return 1.234;
  38              		.loc 1 16 0
  39 0004 024B     		ldr	r3, .L3
  17:../src/main.c **** }
  40              		.loc 1 17 0
  41 0006 1846     		mov	r0, r3
  42 0008 BD46     		mov	sp, r7
  43              		.cfi_def_cfa_register 13
  44              		@ sp needed
  45 000a 80BC     		pop	{r7}
  46              		.cfi_restore 7
  47              		.cfi_def_cfa_offset 0
  48 000c 7047     		bx	lr
  49              	.L4:
  50 000e 00BF     		.align	2
  51              	.L3:
  52 0010 B6F39D3F 		.word	1067316150
  53              		.cfi_endproc
  54              	.LFE0:
  56              		.global	__aeabi_i2d
  57              		.global	__aeabi_ddiv
  58              		.section	.rodata
  59              		.align	2
  60              	.LC1:
  61 0000 2566200A 		.ascii	"%f \012\000"
  61      00
  62 0005 000000   		.align	2
  63              	.LC2:
  64 0008 0A00     		.ascii	"\012\000"
  65              		.global	__aeabi_f2d
  66 000a 0000     		.align	2
  67              	.LC0:
  68 000c 3C000000 		.word	60
  69 0010 02000000 		.word	2
  70 0014 03000000 		.word	3
  71 0018 0B000000 		.word	11
  72 001c 2F000000 		.word	47
  73 0020 07000000 		.word	7
  74 0024 1B000000 		.word	27
  75 0028 0E000000 		.word	14
  76 002c 18000000 		.word	24
  77              		.section	.text.main,"ax",%progbits
  78              		.align	2
  79              		.global	main
  80              		.thumb
  81              		.thumb_func
  83              	main:
  84              	.LFB1:
  18:../src/main.c **** 
  19:../src/main.c **** int main(void)
  20:../src/main.c **** {
  85              		.loc 1 20 0
  86              		.cfi_startproc
  87              		@ args = 0, pretend = 0, frame = 40
  88              		@ frame_needed = 1, uses_anonymous_args = 0
  89 0000 B0B5     		push	{r4, r5, r7, lr}
  90              		.cfi_def_cfa_offset 16
  91              		.cfi_offset 4, -16
  92              		.cfi_offset 5, -12
  93              		.cfi_offset 7, -8
  94              		.cfi_offset 14, -4
  95 0002 8AB0     		sub	sp, sp, #40
  96              		.cfi_def_cfa_offset 56
  97 0004 00AF     		add	r7, sp, #0
  98              		.cfi_def_cfa_register 7
  21:../src/main.c **** 	// Variable definitions
  22:../src/main.c **** 	int index;
  23:../src/main.c **** 	// Note: different initialisation list is needed for different M
  24:../src/main.c **** 	int CM[M][M]={{60,2,3},{11,47,7},{27,14,24}};
  99              		.loc 1 24 0
 100 0006 264B     		ldr	r3, .L11+8
 101 0008 3C46     		mov	r4, r7
 102 000a 1D46     		mov	r5, r3
 103 000c 0FCD     		ldmia	r5!, {r0, r1, r2, r3}
 104 000e 0FC4     		stmia	r4!, {r0, r1, r2, r3}
 105 0010 0FCD     		ldmia	r5!, {r0, r1, r2, r3}
 106 0012 0FC4     		stmia	r4!, {r0, r1, r2, r3}
 107 0014 2B68     		ldr	r3, [r5]
 108 0016 2360     		str	r3, [r4]
  25:../src/main.c **** 
  26:../src/main.c **** 	// Part I: PDm: Call assembly language function pdm() for each class m
  27:../src/main.c **** 	// note: index = m - 1
  28:../src/main.c **** 	for (index=0; index<M; index++)
 109              		.loc 1 28 0
 110 0018 0023     		movs	r3, #0
 111 001a 7B62     		str	r3, [r7, #36]
 112 001c 18E0     		b	.L6
 113              	.L7:
  29:../src/main.c **** 		printf("%f \n", pdm((int*)CM,M,index)/10000.0);
 114              		.loc 1 29 0 discriminator 3
 115 001e 3B46     		mov	r3, r7
 116 0020 7A6A     		ldr	r2, [r7, #36]
 117 0022 0321     		movs	r1, #3
 118 0024 1846     		mov	r0, r3
 119 0026 FFF7FEFF 		bl	pdm
 120 002a 0346     		mov	r3, r0
 121 002c 1846     		mov	r0, r3
 122 002e FFF7FEFF 		bl	__aeabi_i2d
 123 0032 19A3     		adr	r3, .L11
 124 0034 D3E90023 		ldrd	r2, [r3]
 125 0038 FFF7FEFF 		bl	__aeabi_ddiv
 126 003c 0346     		mov	r3, r0
 127 003e 0C46     		mov	r4, r1
 128 0040 1A46     		mov	r2, r3
 129 0042 2346     		mov	r3, r4
 130 0044 1748     		ldr	r0, .L11+12
 131 0046 FFF7FEFF 		bl	printf
  28:../src/main.c **** 		printf("%f \n", pdm((int*)CM,M,index)/10000.0);
 132              		.loc 1 28 0 discriminator 3
 133 004a 7B6A     		ldr	r3, [r7, #36]
 134 004c 0133     		adds	r3, r3, #1
 135 004e 7B62     		str	r3, [r7, #36]
 136              	.L6:
  28:../src/main.c **** 		printf("%f \n", pdm((int*)CM,M,index)/10000.0);
 137              		.loc 1 28 0 is_stmt 0 discriminator 1
 138 0050 7B6A     		ldr	r3, [r7, #36]
 139 0052 022B     		cmp	r3, #2
 140 0054 E3DD     		ble	.L7
  30:../src/main.c **** 
  31:../src/main.c **** 	printf("\n");
 141              		.loc 1 31 0 is_stmt 1
 142 0056 1448     		ldr	r0, .L11+16
 143 0058 FFF7FEFF 		bl	printf
  32:../src/main.c **** 
  33:../src/main.c **** 	for (index=0; index<M; index++)
 144              		.loc 1 33 0
 145 005c 0023     		movs	r3, #0
 146 005e 7B62     		str	r3, [r7, #36]
 147 0060 0FE0     		b	.L8
 148              	.L9:
  34:../src/main.c **** 		printf("%f \n", pfa()); // modify to pfa(CM,M,index)
 149              		.loc 1 34 0 discriminator 3
 150 0062 FFF7FEFF 		bl	pfa
 151 0066 0346     		mov	r3, r0
 152 0068 1846     		mov	r0, r3
 153 006a FFF7FEFF 		bl	__aeabi_f2d
 154 006e 0346     		mov	r3, r0
 155 0070 0C46     		mov	r4, r1
 156 0072 1A46     		mov	r2, r3
 157 0074 2346     		mov	r3, r4
 158 0076 0B48     		ldr	r0, .L11+12
 159 0078 FFF7FEFF 		bl	printf
  33:../src/main.c **** 		printf("%f \n", pfa()); // modify to pfa(CM,M,index)
 160              		.loc 1 33 0 discriminator 3
 161 007c 7B6A     		ldr	r3, [r7, #36]
 162 007e 0133     		adds	r3, r3, #1
 163 0080 7B62     		str	r3, [r7, #36]
 164              	.L8:
  33:../src/main.c **** 		printf("%f \n", pfa()); // modify to pfa(CM,M,index)
 165              		.loc 1 33 0 is_stmt 0 discriminator 1
 166 0082 7B6A     		ldr	r3, [r7, #36]
 167 0084 022B     		cmp	r3, #2
 168 0086 ECDD     		ble	.L9
 169              	.L10:
  35:../src/main.c **** 
  36:../src/main.c **** 	// Enter an infinite loop, just incrementing a counter
  37:../src/main.c **** 	volatile static int loop = 0;
  38:../src/main.c **** 	while (1) {
  39:../src/main.c **** 		loop++;
 170              		.loc 1 39 0 is_stmt 1 discriminator 1
 171 0088 084B     		ldr	r3, .L11+20
 172 008a 1B68     		ldr	r3, [r3]
 173 008c 0133     		adds	r3, r3, #1
 174 008e 074A     		ldr	r2, .L11+20
 175 0090 1360     		str	r3, [r2]
  40:../src/main.c **** 	}
 176              		.loc 1 40 0 discriminator 1
 177 0092 F9E7     		b	.L10
 178              	.L12:
 179 0094 AFF30080 		.align	3
 180              	.L11:
 181 0098 00000000 		.word	0
 182 009c 0088C340 		.word	1086556160
 183 00a0 0C000000 		.word	.LC0
 184 00a4 00000000 		.word	.LC1
 185 00a8 08000000 		.word	.LC2
 186 00ac 00000000 		.word	loop.4025
 187              		.cfi_endproc
 188              	.LFE1:
 190              		.bss
 191              		.align	2
 192              	loop.4025:
 193 0000 00000000 		.space	4
 194              		.text
 195              	.Letext0:
DEFINED SYMBOLS
                            *ABS*:0000000000000000 main.c
/var/folders/qx/3thh6vs13c76w0sbjx53xp240000gn/T//ccVBxBRh.s:20     .text.pfa:0000000000000000 $t
/var/folders/qx/3thh6vs13c76w0sbjx53xp240000gn/T//ccVBxBRh.s:25     .text.pfa:0000000000000000 pfa
/var/folders/qx/3thh6vs13c76w0sbjx53xp240000gn/T//ccVBxBRh.s:52     .text.pfa:0000000000000010 $d
/var/folders/qx/3thh6vs13c76w0sbjx53xp240000gn/T//ccVBxBRh.s:59     .rodata:0000000000000000 $d
/var/folders/qx/3thh6vs13c76w0sbjx53xp240000gn/T//ccVBxBRh.s:78     .text.main:0000000000000000 $t
/var/folders/qx/3thh6vs13c76w0sbjx53xp240000gn/T//ccVBxBRh.s:83     .text.main:0000000000000000 main
/var/folders/qx/3thh6vs13c76w0sbjx53xp240000gn/T//ccVBxBRh.s:181    .text.main:0000000000000098 $d
/var/folders/qx/3thh6vs13c76w0sbjx53xp240000gn/T//ccVBxBRh.s:192    .bss:0000000000000000 loop.4025
/var/folders/qx/3thh6vs13c76w0sbjx53xp240000gn/T//ccVBxBRh.s:191    .bss:0000000000000000 $d
                     .debug_frame:0000000000000010 $d
                           .group:0000000000000000 wm4.0.0c5e979f1ec464b8f03bc190bd321363
                           .group:0000000000000000 wm4.redlib_version.h.14.62abddb5b4efb2dd619a7dca5647eb78
                           .group:0000000000000000 wm4.libconfigarm.h.18.48d18a57a6aa6fedadbcea02294a713f
                           .group:0000000000000000 wm4.stdio.h.44.4674ea39c56924a8b52db7db756a4792

UNDEFINED SYMBOLS
__aeabi_i2d
__aeabi_ddiv
__aeabi_f2d
pdm
printf
