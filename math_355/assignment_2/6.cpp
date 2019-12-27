#include <iostream>
#include <cmath>

int an(int n){
    int temp1 = n - 1 + floor((sqrt(8*n-7) - 3) / 4);
    int temp2 = floor((sqrt(8*n - 7) + 1)/2) * floor((sqrt(8*n-7) - 1)/2);
    return pow(-1, temp1) * ceil((double)(n - 1)/2 - (double)temp2 /4);
}

int main(){
    int max = 10;
    int n = 1;
    for(int row = 1; row < max; ++row){
        int Tn = row * (row + 1) / 2;
        while(n <= Tn){
            std::cout << an(n) << ", ";
            ++n;
        }
        std::cout << '\n';
    }
	return 0;
}