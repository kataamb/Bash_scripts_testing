#!/bin/bash


number=$(echo "$1" | grep -o "[0-9]*")

arg_file="$3"


if [ -v "USE_VALGRIND" ]
then
     
    if [ -z "$arg_file" ]
    then
        valgrind --log-file=valgrind_out.txt --error-exitcode=4 ./app.exe < "$1" > neg_reality.txt
    else
        arg_file_content=$(cat "$arg_file")
        #eval "valgrind --log-file=valgrind_out.txt --error-exitcode=4 ./app.exe $arg_file_content < $1 > ./func_tests/scripts/neg_reality.txt"
        eval "valgrind --leak-check=full --leak-resolution=med --log-file=valgrindd.txt --error-exitcode=4 ./app.exe $arg_file_content < $1 > ./func_tests/scripts/neg_reality.txt"
    fi
    
else

    if [ -z "$arg_file" ]
    then
        ./app.exe < "$1" > neg_reality.txt
    else
        arg_file_content=$(cat "$arg_file")
        eval "./app.exe $arg_file_content < $1 > ./func_tests/scripts/neg_reality.txt"
    fi
fi

exitcode=$?

#debug
echo $exitcode


if [ $exitcode -eq 4 ] 
then
    exit 4
    
elif [ $exitcode -ne 0 ] 
then
    exit 0
    
else
   exit 1
   
fi

