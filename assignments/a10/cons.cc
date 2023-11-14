#include <cstdint>
#include "a10p1.h"
#include "a10p2.h"

int64_t *freelst = arena();
int64_t tot_size = arena()[0] / 8;

int64_t *cons(int64_t a, int64_t *b) {
    int64_t *return_val = 0;
    if(freelst[0] >= 24) {
        freelst[2] = freelst[0] - 16;
        freelst[0] = a;
        freelst[1] = (int64_t)b;
        return_val = freelst;
        freelst = freelst + 2;
    } else if(freelst[0] == 16) {
        if(freelst == arena() + (tot_size - 2)) {
            return return_val;
        }
        return_val = freelst;
        freelst[0] = a;
        int64_t *nxt = (int64_t*)freelst[1];
        freelst[1] = (int64_t)b;
        freelst = nxt;
    }
    return return_val;
}

int64_t car(int64_t *p) {
    return p[0];
}

int64_t *cdr(int64_t *p) {
    return (int64_t*)p[1];
}

int64_t *setcar(int64_t *p, int64_t v) {
    p[0] = v;
    return p;
}

int64_t *setcdr(int64_t *p, int64_t *v) {
    p[1] = (int64_t)v;
    return p;
}

void snoc(int64_t *p) {
    if(p == 0)   return;
    p[0] = 16;
    p[1] = (int64_t)freelst;
    freelst = p;
}
