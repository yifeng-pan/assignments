// This is not nessary for the assignment. I wrote this out of boredom.
// Reused code from project euler problem 68.

// https://en.wikipedia.org/wiki/Steinhaus%E2%80%93Johnson%E2%80%93Trotter_algorithm#Even's_speedup

#include <iostream>
#include <sstream>
#include <algorithm>
#include <string>
#include <vector>
#include <cmath>

const int SIZE = 6;

struct Permutation {
    int order;
    std::vector<int> perm;
    Permutation(const std::vector<int>& p);
    void print_perm();
};

Permutation::Permutation(const std::vector<int>& p){
    perm = p;
    int o = 0;
    for(int i = 0; i < perm.size(); ++i)
        if(perm[i] != i + 1)
            ++o;
    order = o;
    return;
}

void Permutation::print_perm(){
	for(int i = 0; i < perm.size(); ++i){
		if(i == 0)
			std::cout << '<';
		std::cout << perm[i];
		std::cout << ((i != (perm.size() - 1))? ", " : ">");
	}
	std::cout << ", Order: " << order << '\n';
	return;
}

bool compare(Permutation a, Permutation b){
    return a.order < b.order;
}

std::vector<int> int_perm(){
	std::vector<int> perm;
	for(int i = 0; i < SIZE; ++i)
		perm.push_back(i + 1);
	return perm;
}

std::vector<int> int_dir(){
	std::vector<int> dir;
	dir.push_back(0);
	for(int i = 1; i < SIZE; ++i)
		dir.push_back(-1);
	return dir;
}

// If all elements are zero
bool all_zero(std::vector<int> dir){
	for(int i = 0; i < SIZE; ++i){
		if(dir[i] != 0)
			return false;
	}
	return true;
}

// Part of the SJT algorithm
int max_non_zero(std::vector<int> perm, std::vector<int> dir){
	int max = -1;
	int index = -1;
	for(int i = 0; i < SIZE; ++i){
		if(max < perm[i] && dir[i] != 0){
			max = perm[i];
			index = i;
		}
	}
	return index;
}

// Returns the next Permutation, starting from 2nd
// The SJT algorithm
std::vector<int> next(){
	static std::vector<int> perm = int_perm();
	static std::vector<int> dir = int_dir();

	if(all_zero(dir)){
		perm = int_perm();
		dir = int_dir();
		return perm;	
	}

	int a = max_non_zero(perm, dir); // source
	int b = a + dir[a]; // target
	iter_swap(perm.begin() + a, perm.begin() + b);
	iter_swap(dir.begin() + a, dir.begin() + b);

	if(b == 0 || b == SIZE - 1)
		dir[b] = 0;
	if(perm[b] < perm[b + dir[b]])
		dir[b] = 0;
	
	for(int i = 0; i < SIZE; ++i)
		if(dir[i] == 0 && perm[i] > perm[b])
			dir[i] = (i < b)? 1 : -1;

	return perm;
}

// A very slow way to calculate factorials
// For testing the next() function
// int factorial(){
// 	std::vector<int> first = int_perm();
// 	std::vector<int> perm = first;

// 	int counter = 0;
// 	do{
// 		++counter;
// 		perm = next();
// 	} while (first != perm);

// 	return counter;
// }

int main() {
	std::vector<int> first = int_perm();
	std::vector<int> perm = first;

	std::vector<Permutation> perms;

	do{
        perms.push_back(Permutation(perm));
		perm = next();
	} while (first != perm);

	sort(perms.begin(), perms.end(), compare);
    for(Permutation p : perms){
        p.print_perm();
        // if(p.perm[0] != 1)
        //     p.print_perm();
    }

	return 0;
}