%{
#include <cstdlib>
#include <string>
#include "y.tab.h"
%}

%%

[a-zA-Z][a-zA-Z0-9]*    { yylval.str = new std::string(yytext);  return ID; }
[0-9]+                  { yylval.num = strtol(yytext, NULL, 10); return NUMBER; }
"+"                     { return '+'; }
"-"                     { return '-'; }
"*"                     { return '*'; }
"/"                     { return '/'; }
"="                     { return ASSIGN; }
"("                     { return '('; }
")"                     { return ')'; }
":"                     { return ':'; }
[ \t]                   ;  // Ignorar espacios en blanco
.                       { 
                          printf("Error léxico: Token inválido '%s'\n", yytext);
                          return ERROR;  // Detener el procesamiento y enviar token de error a Yacc
                        }

%%

int yywrap() {
    return 1;
}
