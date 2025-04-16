//raiz quadrada utilizando método Newton-Rapston

//Usar recursividade para calcular a raiz quadrada de x, um 
//número inteiro e positivo
//Onde x é o valor que desejamos encontrar a raiz quadrada, e i é o número de iterações 









#include <stdio.h>

float raiz(int x){
    int r;
    
    
    
    return r;
}


int sqrt_nr(int x, int i){




    return (  (sqrt_nr(x,i - 1)) + (x / (sqrt_nr(x,i -1)) )  )  / 2 ;
    
}


 int main(void){
   int x, i, nr_res;

    scanf("%d, %d" &x, &i);

   nr_res = sqrt_nr(x, i);
   
   res = raiz(nr_res);

   printf("%d/r", res);
 }
