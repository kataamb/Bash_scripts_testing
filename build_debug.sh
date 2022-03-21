#!/bin/bash

#compiling
gcc -std=c99 -Wall -Werror -Wpedantic -Wextra -Wfloat-conversion -Wfloat-equal -ggdb -O0 --coverage -c main.c -lm

#linking
gcc --coverage -o app.exe main.o -lm
