#!/bin/bash

str1=$(grep -oE "Result: .*" "$1")
str2=$(grep -oE "Result: .*" "$2")

if [ "$str1" = "$str2" ]
then
    exit 0
else 
    exit 1
fi
    
