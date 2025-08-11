
%{
#include <stdio.h>
#include <stdlib.h>
void yyerror(const char *s);
int yylex(void);
%}


%union {
    double dval;
}


%token <dval> NUMBER
%token ADD SUB MUL DIV ABS
%token EOL
%token OP CP


%type <dval> exp factor term

%%

calclist:
  | calclist exp EOL { printf("= %.6f (0x%X)\n", $2, (unsigned int)(long)$2); }
  ;

exp:
    factor             { $$ = $1; }
  | exp ADD factor     { $$ = $1 + $3; }
  | exp SUB factor     { $$ = $1 - $3; }
  ;

factor:
    term
  | factor MUL term    { $$ = $1 * $3; }
  | factor DIV term    { $$ = $1 / $3; }
  ;

term:
    NUMBER             { $$ = $1; }
  | ABS term           { $$ = $2 >= 0 ? $2 : -$2; }
  | OP exp CP          { $$ = $2; }
  ;

%%

int main(void) {
    return yyparse();
}

void yyerror(const char *s) {
    fprintf(stderr, "error: %s\n", s);
}
