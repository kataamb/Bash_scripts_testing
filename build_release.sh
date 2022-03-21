#!/bin/bash

#compiling
gcc -std=c99 -Wall -Werror -Wpedantic -Wextra -Wfloat-equal -Wfloat-conversion -c main.c -lm

#linking
gcc -o app.exe main.c -lm
