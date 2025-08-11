#include <stdio.h>
#include <ctype.h>
#include <time.h>

int main() {

    char simbolo;
    int en_palabra = 0;
    int total_palabras = 0;
    int total_lineas = 0;
    int total_simbolos = 0;
    clock_t tiempo_inicio, tiempo_fin;
    double duracion;

    tiempo_inicio = clock();

    printf("Ingrese un texto cualquiera:\n");

    while ((simbolo = getchar()) != EOF) {
        total_simbolos++;
        if (simbolo == '\n') {
            total_lineas++;
        }
        if (isspace(simbolo)) {
            en_palabra = 0;
        } else if (en_palabra == 0) {
            en_palabra = 1;
            total_palabras++;
        }
    }

    tiempo_fin = clock();

    duracion = (double)(tiempo_fin - tiempo_inicio) / CLOCKS_PER_SEC;

    printf("Palabras detectadas: %d\n", total_palabras);
    printf("Cantidad de lineas: %d\n", total_lineas);
    printf("Cantidad de caracteres: %d\n", total_simbolos);
    printf("Tiempo de ejecucion: %.2f segundos\n", duracion);

    return 0;
}
