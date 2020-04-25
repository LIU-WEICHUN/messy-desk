#include<stdio.h>
#include<stdlib.h>
#include<math.h>

struct Int_Node{
    int value;
    struct Int_Node* next;
};
struct List_head{
    int len;
    void* head;
};
typedef struct List_head list;
typedef struct Int_Node node_int;

int main(){
    int m = 5;  //the degree of polynomial X^5 + X^2 + 1
    int n;
    list* irreducible_polynomials;
    irreducible_polynomials = (list*)calloc(m, sizeof(list));

    n = pow(2,m) + 1; //the degree for X^n + 1

    //set the irreducible_polynomial in degree zero
    //the node is X^0
    node_int* zero_degree = malloc(sizeof(node_int));
    zero_degree->value = 1;
    zero_degree->next = NULL;
    irreducible_polynomials[0].head = zero_degree;
    irreducible_polynomials[0].len = 1;

    //set the irreducible_polynomial in degree one
    //the node is X^1 (1,0) and X^1+X^0 (1,1)
    node_int* new_node = (node_int*)malloc(sizeof(node_int));
    new_node->value = 2;   //(1,0)
    irreducible_polynomials[1].head = new_node;
    irreducible_polynomials[1].len = 1;

    node_int* node_pointer;
    node_pointer = irreducible_polynomials[1].head;
    node_pointer->next = (node_int*)malloc(sizeof(node_int));
    node_pointer = node_pointer->next;
    node_pointer->value = 3;    //(1,1)
    node_pointer->next = NULL;
    irreducible_polynomials[1].len += 1;

    // "irreducible" means the polynomial isn't divisible by others.
    int degree;  // the degree of polynomial p(X)
    degree = 2;
    int i_pX,degree_divisor, division_pointer;
    int degree_on_dec = (int)pow(2,degree)
    int pX, rX, divisor; //p(X)
    
    for(i_pX = 0; i_pX <= degree_on_dec; i_pX++){    //test all p(X) in degree 2
        pX = degree_on_dec + i_pX;
        for(degree_divisor = 1; degree_divisor < (degree_on_dec+1)/2; degree_divisor++){   //all polynomial little than p(X), start from degree 1
            division_pointer = (int)pow(2, degree - degree_divisor);
            node_pointer = irreducible_polynomials[degree_divisor].head
            for(i_divisor = 0; i<irreducible_polynomials[degree_divisor].len; i_divsor++){
                divisor = node_pointer->value << (degree - degree_divisor);
                rX = pX;
                while(division_pointer > 1){
                    if(pX & division_pointer == 1){ 
                        rX = rX ^ divisor;
                    }
                    division_pointer =  division_pointer >> 1
                    divisor = divisor >> 1
                }
                if(rX == 0){
                    break;
                }
            }
            
        }

    }
    
    return 0;    

}