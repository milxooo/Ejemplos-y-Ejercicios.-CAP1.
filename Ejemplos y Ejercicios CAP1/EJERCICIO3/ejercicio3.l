/* recognize tokens for the calculator and print them out */
%{
# include "ejercicio3.tab.h"
%}
%%

"+"          { return ADD; }
"-"          { return SUB; }
"*"          { return MUL; }
"/"          { return DIV; }
"|"          { return BAR; }
[0-9]+       { yylval = atoi(yytext); return NUMBER; }
0x[a-f0-9]+  { yylval = strtol(yytext, NULL, 16); return NUMBER; }
\n           { return EOL; }
[ \t]        { /* ignore whitespace */ }
.            { printf("Mystery character %c\n" , *yytext); }

%%
