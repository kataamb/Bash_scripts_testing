#!/bin/bash

#compiling
#gcc -std=c99 -Wall -Werror -Wpedantic -Wextra -Wfloat-equal -Wfloat-conversion -Wvla -c main.c -lm

#linking
#gcc -o app.exe main.c -lm

#compiling
cfiles=$(find . -maxdepth 1 -type f -name "*\.c")

for i in ${cfiles}
do
    objname=$(echo "$i" | sed "s/\.c/\.o/")
    gcc -std=c99 -Wall -Werror -Wextra -Wpedantic -Wfloat-conversion -Wfloat-equal -Wvla -O0 -c -o "$objname" "$i" -lm
done

#linking
gcc -o app.exe *.o
