#!/bin/bash


number=$(echo "$1" | grep -o "[0-9]*")

arg_file=$(find ../data -type f -name "neg_'$number'_args.txt")


if [ -v "USE_VALGRIND" ]
then
     
    if [ -z "$arg_file" ]
    then
        valgrind --log-file=valgrind_out.txt --error-exitcode=4 ../../app.exe < "$1" > neg_reality.txt
    else
        eval "valgrind --log-file=valgrind_out.txt --error-exitcode=4 ../../app.exe $arg_file < $1 > neg_reality.txt"
    fi
    
else

    if [ -z "$arg_file" ]
    then
        ../../app.exe < "$1" > neg_reality.txt
    else
        eval "../../app.exe $arg_file< $1 > neg_reality.txt"
    fi
fi

exitcode=$?



if [ $exitcode -eq 4 ] 
then
    exit 4
    
elif [ $exitcode -ne 0 ] 
then
    exit 0
    
else
   exit 1
   
fi

