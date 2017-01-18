// Naeem Hossain
// January 18, 2017
// Basic Calculator app to get back into C Programming

// ON MAC:
// gcc calculator.c 
// ./a.out
// ~

// Convert to assembly:
// gcc -S calculator.c

// ON DESKTOP:
// gcc calculator.c 
// a
// ~

#include <stdio.h>

//Array of funciton pointers
int sum(int a, int b);
int sub(int a, int b);
int mul(int a, int b);
int div(int a, int b);

int(*p[4]) (int x, int y);

int main(void) {


	int a, b;
	int op;
	int result;

	/*Addresses of the functions in the function pointer array*/
	p[0] = sum; 
	p[1] = sub;
	p[2] = mul;
	p[3] = div;

	printf("Enter the two numbers you want to perform operations on\n");
	scanf("%d%d",&a, &b);

	printf("0: Add, 1: Subtract, 2: Multiply, 3: Divide\n");
	printf("Enter number of operations: ");
	if(op<0 || op>3){
		scanf("%d", &op);
	}

	result = (*p[op]) (a,b);
	printf("%d\n", result);

	return 0;
}

int sum(int a, int b){

	return a+b;
}

int sub(int a, int b){

	return a-b;
}

int mul(int a, int b){

	return a*b;
}

int div(int a, int b){

	if(b == 0){
		printf("UNDEFINED\n");
		return 0;
	}
	return a/b;
}
	
