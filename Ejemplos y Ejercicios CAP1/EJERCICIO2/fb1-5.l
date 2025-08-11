
%{
#include "fb1-5.tab.h"
#include <stdlib.h>
#include <string.h>
%}

%%

[ \t]+           { /* skip whitespace */ }
"//".*           { /* skip comments */ }

"("              { return OP; }
")"              { return CP; }
"|"              { return ABS; }

"+"              { return ADD; }
"-"              { return SUB; }
"*"              { return MUL; }
"/"              { return DIV; }


0[xX][0-9a-fA-F]+ {
    yylval.dval = (double) strtol(yytext, NULL, 16);
    return NUMBER;
}


([0-9]+(\.[0-9]*)?|\.[0-9]+)([eE][+-]?[0-9]+)? {
    yylval.dval = strtod(yytext, NULL);
    return NUMBER;
}

\n               { return EOL; }

.                { printf("Mystery character: %s\n", yytext); }

%%
