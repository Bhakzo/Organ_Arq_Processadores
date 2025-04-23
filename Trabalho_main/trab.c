//raiz quadrada utilizando método Newton-Rapston

//Usar recursividade para calcular a raiz quadrada de x, um 
//número inteiro e positivo
//Onde x é o valor que desejamos encontrar a raiz quadrada, e i é o número de iterações 


//==================================//
//  Xnovo = 1/2 (Xatual + N/Xatual) //
//==================================//


#include <stdio.h>

// Função recursiva para aproximar a raiz quadrada
// Vai aproximando até a diferença ser quase nula ( double precisão)
int raiz_recursiva (int n, double x_atual) {
    double precise = 0.001; // quando a diferença for menor que esse número, para o programa e entrega o resultado
    double difference = x_atual * x_atual - n;

    if (difference <= precise) {  //se for menor que a difença, devolve o resutado
        return x_atual;
    }

    // método Newton-Raphson
    double x_novo = 0.5 * (x_atual + n / x_atual);
    return raiz_recursiva(n, x_novo);
}

double raiz_quadrada(int n) {
    if (n < 0) {
        printf("Número negativo -> erro\n");
        return -1;
    }
    return raiz_recursiva(n, n / 2);
}

int main() {

    int num;
    printf("Digite um número: ");
    scanf("%d", &num);

    //double para mais precisão?
    int res = raiz_quadrada(num);
    if (res != -1) {
        printf("raiz quadrada de %d é %d\n", num, res);
    }

    return 0;
}





