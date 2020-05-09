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
void lexeme(void);
unsigned int lineno=1;
bool error=false;
 
%}

%%
\/\*.*\*\/              { lexeme();} //return COMMENTARY; }

"const"                 { lexeme(); }//return CONSTANT; }
"else"                  { lexeme(); }//return ELSE; }
"extern"                { lexeme(); }//return EXTERN; }
"for"                   { lexeme(); }//return FOR; }
"if"                    { lexeme(); }//return IF; }
"int"                   { lexeme(); }//return INT; }
"return"                { lexeme(); }//return RETURN; }
"sizeof"                { lexeme(); }//return SIZEOF; }
"struct"                { lexeme(); }//return STRUCT; }
"void"                  { lexeme();}// return VOID; }
"while"                 { lexeme();} //return WHILE; }

"="             { lexeme(); }//return WHILE; }
 
"+"             { lexeme(); }//return WHILE; }
 
"-"             { lexeme(); }//return WHILE; }
 
"*"             { lexeme(); }//return WHILE; }
 
"/"             { lexeme();}//return WHILE; }
 
"("             { lexeme();}//return WHILE; }
 
")"             { lexeme();}//return WHILE; }
 

 
";"             { lexeme();}//return WHILE; }

{D}*                    { lexeme(); }//return NUMBER; }
{L}({L}|{D})*           { lexeme();} //return IDENTIFIER; }
0[xX]{H}+{IS}?          { lexeme();} //return INT; }
"&&"                    { lexeme();} //return AND_OP; }
"||"                    { lexeme();} //return OR_OP; }
"<="                    { lexeme(); }//return LE_OP; }
">="                    { lexeme(); }//return GE_OP;}
"=="                    { lexeme(); }//return EQ_OP; }
"!="                    { lexeme(); }//return NE_OP; }
" "			{}
.                       { fprintf(stderr,"\tERREUR : Lexeme inconnu a la ligne %d. Il s'agit de %s et comporte %d lettre(s)\n",lineno,yytext,yyleng);
        error=true;}


%%

int main(){
        printf("Debut de l'analyse lexicale :\n");
        yylex();
        printf("Fin de l'analyse !\n");
        printf("Resultat :\n");
        if(error){
                printf("\t-- Echec : Certains lexemes ne font pas partie du lexique du langage ! --\n");
        }
        else{
                printf("\t-- Succes ! --\n");
        }
        return EXIT_SUCCESS;
}

void lexeme(){
        printf("\tLexeme '%s' trouve a la ligne %d\n",yytext,lineno);
}
 

int yywrap(){
        printf("\tFin de fichier detecte !\n");
        return 1;
}
