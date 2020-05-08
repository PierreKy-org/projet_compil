D                       [0-9]   
L                       [a-zA-Z_]
H                       [a-fA-F0-9]
E                       [Ee][+-]?{D}+
FS                      (f|F|l|L)
IS                      (u|U|l|L)*

%{
#include <stdio.h>
#include "y.tab.h"

/* Ne gere pas les commentaires. A rajouter */
/* Supprimer les lignes dont vous n'avez pas besoin. */

%}

%%
"const"                 { return CONSTANT; }
"else"                  { return ELSE; }
"extern"                { return EXTERN; }
"for"                   { return FOR; }
"if"                    { return IF; }
"int"                   { return INT; }
"return"                { return RETURN; }
"sizeof"                { return SIZEOF; }
"struct"                { return STRUCT; }
"void"                  { return VOID; }
"while"                 { return WHILE; }

{L}({L}|{D})*           { return IDENTIFIER; }

0[xX]{H}+{IS}?          { return INT; }
"&&"                    { return AND_OP; }
"||"                    { return OR_OP; }
"<="                    { return LE_OP; }
">="                    { return GE_OP;}
"=="                    { return EQ_OP; }
"!="                    { return NE_OP; }

.                       { return yytext[0]; }
%%

