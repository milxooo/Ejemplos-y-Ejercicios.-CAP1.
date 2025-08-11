/* Reconocer tokens para la calculadora e imprimirlos */
%%
"+"	{ printf("SUMA\n"); }
"-"	{ printf("RESTA\n"); }
"*"	{ printf("MULTIPLICACION\n"); }
"/"	{ printf("DIVIDIR\n"); }
"|"	{ printf("VALOR ABSOLUTO\n"); }
[0-9]+	{ printf("NUMERO %s\n", yytext); }
\n	{ printf("SALTO DE LINEA"); }
[ \t]	{ }
.	{ printf("Caracter misterioso %s\n", yytext); }
%%	
