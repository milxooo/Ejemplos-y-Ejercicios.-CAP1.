/*Just like Unix wc */

%{
 #include <time.h>
 int chars = 0;
 int words = 0;
 int lines = 0;
%}

%%

[a-zA-Z]+ {words++; chars += strlen(yytext); }
\n        {chars++; lines++; }
.         {chars++; }

%%

int main(int argc, char **argv)
{
    clock_t inicio, fin;
    double tiempo_total;
    inicio = clock ();
    yylex();
    fin = clock ();
    tiempo_total = (double)(fin - inicio)/CLOCKS_PER_SEC;
    printf("%8d%8d%8d\n", lines, words, chars);
    printf("Tiempo de ejecución: %.2f segundos\n", tiempo_total);
}
