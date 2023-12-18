#!/bin/bash

#echo $#
#echo $1
#echo $2
#echo $3

number=$(echo "$1" | grep -o "[0-9]*")

#arg_file=$(find ../data -type f -name "pos_'$number'_args.txt")

arg_file="$3"
#echo $arg_file

if [ -v "USE_VALGRIND" ]
then

    if [ -z "$arg_file" ]
    then
        valgrind --log-file=valgrind_out.txt --error-exitcode=4 ./app.exe < "$1" > ./func_tests/scripts/pos_reality.txt
    else
        arg_file_content=$(cat "$arg_file")
        #eval "valgrind --log-file=valgrind_out.txt --error-exitcode=4 ./app.exe $arg_file_content < $1 > pos_reality.txt"
        eval "valgrind --leak-check=full --leak-resolution=med --log-file=valgrindd.txt --error-exitcode=4 ./app.exe $arg_file_content < $1 > ./func_tests/scripts/pos_reality.txt"
    fi
    
else

    if [ -z "$arg_file" ]
    then
        ./app.exe < "$1" > ./func_tests/scripts/pos_reality.txt
        #cat pos_reality.txt
    else
        arg_file_content=$(cat "$arg_file")
        #echo $arg_file_content

        eval "./app.exe $arg_file_content < $1 > ./func_tests/scripts/pos_reality.txt" 
    fi
fi

exitcode=$?



#echo "TRRR"
#echo $exitcode

result=0


if [ $exitcode -eq 0 ] 
then
    bash ./func_tests/scripts/comparator.sh "$2" ./func_tests/scripts/pos_reality.txt
    result=$?
    if [ "$result" -eq 0 ]
    then
         exit 0
    else
        exit 1
    fi
    
else 
   exit $exitcode
   
fi
