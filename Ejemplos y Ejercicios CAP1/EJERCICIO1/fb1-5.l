/* Reconocer tokens para la calculadora e imprimirlos */

%{
#include "fb1-5.tab.h"
#include <stdlib.h>
%}

%%
"+"         { return ADD; }
"-"         { return SUB; }
"*"         { return MUL; }
"/"         { return DIV; }
"|"         { return ABS; }
"("         { return OP; }
")"         { return CP; }


"//"[^\n]*  { /* ignore comment */ }


[0-9]+      { yylval = atoi(yytext); return NUMBER; }


\n          { return EOL; }


[ \t]+      { /* ignore whitespace */ }


.           { printf("Mystery character %c\n", *yytext); }
%%
