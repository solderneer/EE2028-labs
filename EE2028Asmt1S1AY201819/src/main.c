#include "stdio.h"

extern int pdm(int* base, int ncol, int index);

// EE2028 Assignment 1, Sem 1, AY 2018/19
// (c) CK Tham, ECE NUS, 2018

// Dimension of confusion matrix, i.e. MxM square matrix
// Note: pdm() must work for different values of M, e.g. M=10
#define M 3

// Part II: PFAm
float pfa(int* CM, int index)
{
	// write the code for pfa(CM,M,index) here

	return 1.234;
}

int main(void)
{
	// Variable definitions
	int index;
	// Note: different initialisation list is needed for different M
	int CM[M][M]={{60,2,3},{11,47,7},{27,14,24}};

	// Part I: PDm: Call assembly language function pdm() for each class m
	// note: index = m - 1
	for (index=0; index<M; index++)
		printf("%f \n", pdm((int*)CM,M,index)/10000.0);

	printf("\n");

	for (index=0; index<M; index++)
		printf("%f \n", pfa(CM, index)); // modify to pfa(CM,M,index)

	// Enter an infinite loop, just incrementing a counter
	volatile static int loop = 0;
	while (1) {
		loop++;
	}
}
