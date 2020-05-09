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
"const"                 { printf("const.\n"); return CONSTANT; }
"else"                  { printf("else.\n"); return ELSE; }
"extern"                { printf("extern.\n"); return EXTERN; }
"for"                   { printf("for.\n"); return FOR; }
"if"                    { printf("if.\n"); return IF; }
"int"                   { printf("int.\n"); return INT; }
"return"                { printf("return.\n"); return RETURN; }
"sizeof"                { printf("sizeof.\n"); return SIZEOF; }
"struct"                { printf("struct.\n"); return STRUCT; }
"void"                  { printf("void.\n"); return VOID; }
"while"                 { printf("while.\n"); return WHILE; }

{L}({L}|{D})*           { printf("identifier.\n"); return IDENTIFIER; }

0[xX]{H}+{IS}?          { printf("int.\n"); return INT; }
"&&"                    { printf("and operation.\n"); return AND_OP; }
"||"                    { printf("or operation.\n"); return OR_OP; }
"<="                    { printf("less equal operation.\n"); return LE_OP; }
">="                    { printf("great equal operation.\n"); return GE_OP;}
"=="                    { printf("equal operation.\n"); return EQ_OP; }
"!="                    { printf("not equal operation.\n"); return NE_OP; }
" "			{ printf("");}
.                       { printf("Erreur lexicale.\n"); }
%%

