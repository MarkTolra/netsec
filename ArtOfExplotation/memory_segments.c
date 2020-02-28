#include <stdio.h>
#include <stdlib.h>

int global_var;

int global_initialised_var = 5;

void function() {
	int stack_var;		// This variable has the same name as the global on purpose
	printf("The functions's stack_var is at address: 0x%08x\n", &stack_var);
}

int main(){
	int stack_var;		// Again intentional
	static int static_initialised_var = 5;
	static int static_var;
	int *heap_var_ptr;

	heap_var_ptr = (int *) malloc(4);

	// These variables are in the data segment
	printf("global_initialised_var is at address 0x%08x\n", &global_initialised_var);
	printf("static_initialised_var is at address 0x%08x\n\n", &static_initialised_var);

	// These variables are in the bss segment
	printf("static_var is at address 0x%08x\n", &static_var);
	printf("global_var is at address 0x%08x\n\n", &global_var);

	// This variable is in the heap segment
	printf("heap_var is at address 0x%08x\n\n", &heap_var_ptr);
	
	// These variables are in the stack segment
	printf("stack_var is at address 0x%08x\n", &stack_var);
	function();
}
	
