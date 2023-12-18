#!/bin/bash

#compiling
#gcc -std=c99 -Wall -Werror -Wpedantic -Wextra -Wfloat-conversion -Wfloat-equal -ggdb -O0 --coverage -c main.c -lm

#linking
#gcc --coverage -o app.exe main.o -lm


#compiling
cfiles=$(find . -maxdepth 1 -type f -name "*\.c")

for i in ${cfiles}
do
    objname=$(echo "$i" | sed "s/\.c/\.o/")
    gcc -std=c99 -Wall -Werror -Wextra -Wpedantic -Wfloat-conversion -Wfloat-equal -Wvla -ggdb -O0 --coverage -c -o "$objname" "$i" -lm
done

#linking
gcc --coverage -o app.exe *.o
