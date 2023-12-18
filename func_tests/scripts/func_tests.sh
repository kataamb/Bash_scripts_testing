#!/bin/bash

incorrect_tests=0



if [ -z "$1" ] # if not quiet  
then

    list_pos=$(find ./func_tests/data -type f -name "pos_*_in.txt" | sort)
    
    
    for i in $list_pos
    do
       number=$(echo "$i" | grep -o "[0-9]*")
      
       args=$(find ./func_tests/data -type f -name "pos_""$number""_args.txt")


       
       #here we are..
       bash ./func_tests/scripts/pos_case.sh "./func_tests/data/pos_""$number""_in.txt" "./func_tests/data/pos_""$number""_out.txt" "$args"
       
       return_code=$?
  
       
       if [ $return_code -eq 0 ]
       then
           echo -e "\033[0m Test positive $number: \033[32m PASSED \033[0m"
           echo -e "\033[32m No errors occured \033[0m"
       elif [ $return_code -eq 4 ]
       then
           echo -e "\033[0m Test positive $number: \033[32m PASSED \033[0m"
           echo -e "\033[31m Memory error(s) \033[0m"
       else
           incorrect_tests=$((incorrect_tests + 1))
           echo -e "\033[0m Test positive $number: \033[31m FAILED \033[0m" 
           echo -e "\033[31m Incorrect output \033[0m"  
       fi
       echo
            
    done
    echo

###
    list_neg=$(find ./func_tests/data -type f -name "neg_*_in.txt" | sort)

    for i in $list_neg
    do 
       number=$(echo "$i" | grep -o "[0-9]*")
       
       args=$(find ./func_tests/data -type f -name "neg_""$number""_args.txt")
       
       bash ./func_tests/scripts/neg_case.sh  "./func_tests/data/neg_""$number""_in.txt" "./func_tests/data/neg_""$number""_out.txt" "$args"
       
 
       return_code=$?
       if [ $return_code -ne 0 ]
       then
           incorrect_tests=$((incorrect_tests + 1))
           echo -e "\033[0m Test negative $number: \033[31m FAILED \033[0m"
       elif [ $return_code -eq 4 ]
       then
           echo -e "\033[0m Test negative $number: \033[32m PASSED \033[0m"
           echo -e "\033[0m Test negative $number: \033[31m Memory error(s) \033[0m"
       else
           echo -e "\033[0m Test negative $number: \033[32m PASSED \033[0m"
           echo -e "\033[32m No errors occured \033[0m"
       fi
       echo
   
    done
    
######################################################################################
else
    list_pos=$(find ./func_tests/data -type f -name "pos_*_in.txt" | sort)

    for i in $list_pos
    do
       number=$(echo "$i" | grep -o "[0-9]*")
       
       args=$(find ./func_tests/data -type f -name "pos_""$number""_args.txt")
       
       bash ./func_tests/scripts/pos_case.sh "../data/pos_""$number""_in.txt" "./func_tests/data/pos_""$number""_out.txt" "$args"
       
       return_code=$?
       
       if [ $return_code -ne 0 ]
       then
           incorrect_tests=$((incorrect_tests + 1))
       fi
       
    done


#######################

    list_neg=$(find ./func_tests/data -type f -name "neg_*_in.txt" | sort) 

    for i in $list_neg
    do
       number=$(echo "$i" | grep -o "[0-9]*")
       
       args=$(find ./func_tests/data -type f -name "neg_""$number""_args.txt")
       
       bash ./func_tests/scripts/neg_case.sh  "./func_tests/data/neg_""$number""_in.txt" "./func_tests/data/neg_""$number""_out.txt" "$args"
              
       
       return_code=$?
         
       if [ $return_code -ne 0 ]
       then
           incorrect_tests=$((incorrect_tests + 1))
       fi
          
    done
##
fi

exit $incorrect_tests
