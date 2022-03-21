#!/bin/bash

incorrect_tests=0



if [ -z "$1" ] # if not quiet  
then

    list_pos=$(find ../data -type f -name "pos_*_in.txt" | sort)
    
    
    for i in $list_pos
    do
       number=$(echo "$i" | grep -o "[0-9]*")
      
       args=$(find ../data -type f -name "neg_""$number""_args.txt")
       
       bash ./pos_case.sh "../data/pos_""$number""_in.txt" "../data/pos_""$number""_out.txt" "$args"
       
       return_code=$?
  
       
       if [ $return_code -eq 0 ]
       then
           echo -e "\033[0m Test positive $number: \033[32m PASSED \033[0m"
       else
           incorrect_tests=$((incorrect_tests + 1))
           echo -e "\033[0m Test positive $number: \033[31m FAILED \033[0m"  
       fi
            
    done
    echo

###
    list_neg=$(find ../data -type f -name "neg_*_in.txt" | sort)

    for i in $list_neg
    do 
       number=$(echo "$i" | grep -o "[0-9]*")
       
       args=$(find ../data -type f -name "neg_""$number""_args.txt")
       
       bash ./neg_case.sh  "../data/neg_""$number""_in.txt" "../data/neg_""$number""_out.txt" "$args"
       
 
       return_code=$?
       if [ $return_code -ne 0 ]
       then
           incorrect_tests=$((incorrect_tests + 1))
           
           echo -e "\033[0m Test negative $number: \033[31m FAILED \033[0m"
       else
           echo -e "\033[0m Test negative $number: \033[32m PASSED \033[0m"
       fi
   
    done
    
######################################################################################
else
    list_pos=$(find ../data -type f -name "pos_*_in.txt" | sort)

    for i in $list_pos
    do
       number=$(echo "$i" | grep -o "[0-9]*")
       
       args=$(find ../data -type f -name "neg_""$number""_args.txt")
       
       bash ./pos_case.sh "../data/pos_""$number""_in.txt" "../data/pos_""$number""_out.txt" "$args"
       
       return_code=$?
       
       if [ $return_code -ne 0 ]
       then
           incorrect_tests=$((incorrect_tests + 1))
       fi
       
    done


#######################

    list_neg=$(find ../data -type f -name "neg_*_in.txt" | sort) 

    for i in $list_neg
    do
       number=$(echo "$i" | grep -o "[0-9]*")
       
       args=$(find ../data -type f -name "neg_""$number""_args.txt")
       
       bash ./neg_case.sh  "../data/neg_""$number""_in.txt" "../data/neg_""$number""_out.txt" "$args"
              
       
       return_code=$?
         
       if [ $return_code -ne 0 ]
       then
           incorrect_tests=$((incorrect_tests + 1))
       fi
          
    done
##
fi

exit $incorrect_tests
