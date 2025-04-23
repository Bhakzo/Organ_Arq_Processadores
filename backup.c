//raiz quadrada utilizando método Newton-Rapston

//Usar recursividade para calcular a raiz quadrada de x, um 
//número inteiro e positivo
//Onde x é o valor que desejamos encontrar a raiz quadrada, e i é o número de iterações 



#include <stdio.h>


int raiz_quadrada(int x, int i){
 
    if(i == 0){
        return 1;
    }

    return    ( raiz_quadrada(x, i - 1) + x / raiz_quadrada(x, i - 1) )  / 2; 
    

}


int main() {

    int x;
    int i;
    printf("Digite um numero e um indice: ");
    scanf("%d %d", &x, &i);


    //double para mais precisão?
    int res = raiz_quadrada(x,i);
        printf("raiz quadrada de %d é %d\n", x, res);
    

    return 0;
}





