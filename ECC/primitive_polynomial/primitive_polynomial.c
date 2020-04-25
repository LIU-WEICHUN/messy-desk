#include<stdio.h>
#include<stdlib.h>
#include<math.h>


int main(){
    int degree;  // the degree of polynomial p(X)
    degree = 5;
    //degree = 4;
    int degree_divisor, degree_pointer, reducible =0;
    int pX, rX, gX, divisor; //p(X), r(X)
    int pointer;
    pX = (int)pow(2,5) + (int)pow(2,2) + (int)pow(2,0); //X^5 + X^2 + 1
    //pX = 19;
    for(gX = 2; degree_divisor = (int)(log2(gX)) <= degree/2 ; gX++){
        degree_pointer = (int)pow(2, degree);
        divisor = gX << (degree - degree_divisor); // ex: 101 -> 101000  101 which is divisor, 101000 which same degree with p(X) 
        rX = pX;
        printf("gX = %d :\n",gX);
        printf("rX:\n");
        printf("%d\n",rX);
        while((degree_pointer>>degree_divisor) > 0){  // division loop
            if( (rX & degree_pointer) != 0){  //if there is value at the degree same with degree pointer
                rX = rX ^ divisor;  //plus operation
                printf("%d\n",rX);
            }
            if(rX == 1){
                break;
            }

            degree_pointer = degree_pointer >> 1;
            divisor = divisor >> 1;
        }

        if(rX == 0){
            printf("it's reducible. Can't be  primitive polynomial!");
            reducible = 1;
            break;              
        }
        printf("--------------\n");
            
    }
    if (reducible == 0){
        printf("it's irreducible!\n\n");
    }

    int n, divided = 0;
    long Xn1, lrX;  //overflow when Xn1 working over 32 bits
    
    degree_divisor = degree;    //in follow case, the p(X) becomes a divisor
    for(n = degree ;n < 40 ; n++){
        Xn1 = (1<<n) + 1;   // X^n + 1
        printf("n = %d, X^n +1 = %li  :\n", n, Xn1);
        degree_pointer = 1<<n;
        divisor = pX << (n - degree_divisor);
        lrX = Xn1;
        printf("rX:\n");
        while((degree_pointer>>degree_divisor) > 0){
            if( (lrX & degree_pointer) != 0){ 
                lrX = lrX ^ divisor;
                printf("%li\n",lrX);
            }
            if(lrX == 1){
                break;
            }
            degree_pointer = degree_pointer >> 1;
            divisor = divisor >> 1;
        }
        
        printf("--------------\n");

        if(lrX == 0){
            printf("X^n + 1 is divided at n = %d\n\n",n);
            divided = 1;
            break;              
        }
   
    }
    if(n == (1<<degree)-1 && reducible == 0){
        printf("--------------------\n");
        printf("p(X) is primitive.!!\n");
        printf("--------------------\n");
    }

    return 0;
            


}