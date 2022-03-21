#include <stdio.h>

#define NUMBER_PARAMS_ERROR 1;
#define NOT_POSITIVE_PARAMS 2;
#define CORRECT_OUTPUT 0;

unsigned int num_twos(unsigned int a);
unsigned int left_cyclic_shift(unsigned int number, int n);
void translate_to_bin(unsigned int number);

int main(void)
{
    unsigned int a;
    int n;
    int return_code = 0;
    
    printf("Enter a and n: ");
    
    int num_par = scanf("%u%d", &a, &n);
    
    if (num_par != 2)
    {
        printf("Error: Incorrect number of parameters\n");
        return_code = NUMBER_PARAMS_ERROR;
    }
    else
    {
        if (n < 0)
        {
            return_code = NOT_POSITIVE_PARAMS;
            printf("Error: Incorrect params\n");
        }
        else
        {
            unsigned int a_new = left_cyclic_shift(a, n);
            translate_to_bin(a_new);
            return_code = CORRECT_OUTPUT;
        }
    }
    return return_code;   
}

unsigned int left_cyclic_shift(unsigned int number, int n)
{ 
    n = n % 32; 
    number = number << n | number >> (32 - n);
    return number;
}

void translate_to_bin(unsigned int number)
{ 
    unsigned int max_size_2 = 2147483648;
    
    unsigned int digit;
    
    printf("Result: ");
    while (max_size_2 > 0)
    {
        digit = (number / max_size_2) % 2;
        printf("%u", digit);
        number = number % max_size_2;
        max_size_2 /= 2;
    }
    printf("\n");       
}
