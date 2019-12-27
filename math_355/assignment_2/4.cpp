#include <iostream>
#include <cmath>

double next(double x, double y){
    return (y + x/y)/2;
}

int main(){
    double x = 100;
    // std::cin >> x;
    double y = x;

    int trials = 10;
    for(int k = 1; k <= trials; ++k){
        std::cout << "y(" << k << ") = " << y << '\n';
        y = next(x, y);
    }
	return 0;
}