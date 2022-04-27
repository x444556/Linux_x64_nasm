#ifndef arrayOps_H
#define arrayOps_H

#include <stdint.h>

extern void clearVec(char* vec, uint64_t size);    
extern void fillVec(char* vec, uint64_t size, char value);               
extern uint64_t compare(char* arr1, char* arr2, uint64_t len);  
extern uint64_t compare_zero(char* arr, uint64_t len); 
extern void copyVec(char* src, char* dest, uint64_t len);

#endif
