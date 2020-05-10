D                       [0-9]   
L                       [a-zA-Z_]
H                       [a-fA-F0-9]
E                       [Ee][+-]?{D}+
FS                      (f|F|l|L)
IS                      (u|U|l|L)*

%{
 
#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>
#include "y.tab.h"
int yylex(void);
void yyerror(char*);
unsigned int lineno=1;
bool error_lexical=false;
 
%}


%option noyywrap

%%
\/\*.*\*\/              { return COMMENTARY; }


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

"+"                     { return PLUS; }
"-"                     { return MOINS; }
"*"                     { return ETOILE; }
"/"                     { return SLASH; }

"("                     { return PARENTHESE_GAUCHE; }
")"                     { return PARENTHESE_DROITE; }
"{"	                { return ACCOLADE_GAUCHE;}
"}"	                { return ACCOLADE_DROITE;} 

"="                     { return AFFECTATION; }
","		        { return VIRGULE;}
";"                     { return POINT_VIRGULE; }

"&&"                    { return AND_OP; }
"||"                    { return OR_OP; }
"<<"			{  return CHEVRON_L;}
">>"			{  return CHEVRON_R;}
"<"			{  return L_OP;}
">"			{  return G_OP;}
"<="                    {  return LE_OP; }
">="                    {  return GE_OP;}
"=="                    {  return EQ_OP; }
"!="                    {  return NE_OP; }
"&"			{  return ADRESSE;}

{D}*                    { return NUMBER; }
{L}({L}|{D})*           { return IDENTIFIER; }
0[xX]{H}+{IS}?          { return INT; }

" "|"\t" 		        {}
"\n"                    { lineno++;}
.                       { fprintf(stderr,"\tERREUR : Lexeme inconnu a la ligne %d. Il s'agit de %s et comporte %d lettre(s)\n",lineno,yytext,yyleng);
			 error_lexical=true;
			 return yytext[0];
                            }


%%

