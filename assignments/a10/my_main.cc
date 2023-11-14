#include<iostream>
#include "a10p2.h"
int main() {
		int64_t *list = nullptr, *last = nullptr;
		while(true) {
			last = list;
			list = cons(241,list);
			if(!list) break;
		}
}
