#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>

int main() {
	printf("read uid : %d\n", getuid());
	printf("effective uid: %d\n", geteuid());
}
