#include <iostream>
#include <algorithm>
#include <string>
#include <vector>
#include <cmath>

void f(int i, int j, int k){
	int a = ((-i-j-k) + 9) % 3;
	int b = ((i*j + i*k + j *k) + 9) % 3;
	int c = ((-i*j) + 9) % 3;
	if(c == 0) return;
	std::cout << "(" << a << ", " << b << ", " << c << "), \n";
	return;
}

void g(int i, int j, int k){
	int a = ((i-k) + 9) % 3;
	int b = ((j - i*k) + 9) % 3;
	int c = ((-j * k) + 9) % 3;
	if(c == 0) return;
	std::cout << "(" << a << ", " << b << ", " << c << "), \n";
	return;
}

int main() {
	int p = 3;
	for(int i = 0; i < p; ++i)
		for(int j = 0; j < p; ++j)
			for(int k = 0; k < p; ++k){
				bool irr = true;
				for(int x = 0; x < p; ++x)
					if ((x*x*x + i*x*x + j*x + k) % p == 0)
						irr = false;
				if(irr)	
					std::cout << "(" << i << ", " << j << ", " << k << "), \n";
			}
			
	return 0;
}