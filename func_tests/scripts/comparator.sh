#!/bin/bash

str1=$(grep -oE "[-+]?[0-9]*[.]?[0-9]*" "$1")
str2=$(grep -oE "[-+]?[0-9]*[.]?[0-9]*" "$2")

#echo "TRRR"
#cat "$1"
#cat "$2"
#echo "TRRR"

#echo $str1
##echo
#echo $str2

#cat "$2"

if [ "$str1" = "$str2" ]
then
    exit 0
else 
    exit 1
fi
    
