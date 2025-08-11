/* simplest version of calculator */

%{
#include <stdio.h>
void yyerror (char *s);
int yylex(void);
%}

/* declare tokens */
%token NUMBER 
%token ADD SUB MUL DIV BAR 
%token EOL

%%

calclist: /* nothing */
 | calclist exp EOL {
       printf("= %d\n", $2);
       printf("= 0x%1X\n", (unsigned int)$2); }
 ;

exp: factor       { $$ = $1; }
 | exp ADD factor { $$ = $1 + $3; }
 | exp SUB factor { $$ = $1 - $3; }
 | exp BAR factor { $$ = $1 | $3; }
 ;

factor: term       { $$ = $1; }
 | factor MUL term { $$ = $1 * $3; }
 | factor DIV term { $$ = $1 / $3; }
 ;

term: NUMBER { $$ = $1; }
 | SUB term     { $$ = -$2; }
 | BAR exp BAR  { $$ = $2 >= 0? $2 : - $2; }
;
%%
int main (int argc, char **argv)
{
 yyparse();
}

void  yyerror(char *s)
{
  fprintf(stderr, "error: %s\n", s);
}
