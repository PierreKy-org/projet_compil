%{
#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>
#include <string.h>
int yylex(void);
void yyerror(char*);
bool error_syntaxical=false;
extern unsigned int lineno;
extern bool error_lexical;
%}


%token IDENTIFIER CONSTANT SIZEOF
%token LE_OP GE_OP EQ_OP
%token L_OP G_OP
%token EXTERN
%token NUMBER
%token INT VOID
%token STRUCT 
%token IF ELSE WHILE FOR RETURN
%token COMMENTARY
%token ADRESSE PTR_OP
%token ACCOLADE_GAUCHE ACCOLADE_DROITE  
%token AFFECTATION VIRGULE POINT_VIRGULE
%token CHEVRON_L CHEVRON_R


%left                   PLUS        	     MOINS 
%left                   ETOILE      	     SLASH   
%left                   AND_OP         
%left                   OR_OP       	     NE_OP     
%right                  PARENTHESE_GAUCHE    PARENTHESE_DROITE 
%start program    
%%

primary_expression
        : IDENTIFIER 
        | CONSTANT
        | PARENTHESE_GAUCHE expression PARENTHESE_DROITE
        ;

postfix_expression
        : primary_expression
        | postfix_expression PARENTHESE_GAUCHE PARENTHESE_DROITE
        | postfix_expression PARENTHESE_GAUCHE argument_expression_list PARENTHESE_DROITE
        | postfix_expression '.' IDENTIFIER
        | postfix_expression PTR_OP IDENTIFIER
        ;

argument_expression_list
        : expression
        | argument_expression_list VIRGULE expression
        ;

unary_expression
        : postfix_expression
        | unary_operator unary_expression
        | SIZEOF unary_expression
        ;

unary_operator
        : ADRESSE
        | ETOILE
        | MOINS
        ;

multiplicative_expression
        : unary_expression
        | multiplicative_expression ETOILE unary_expression
        | multiplicative_expression SLASH unary_expression
        ;

additive_expression
        : multiplicative_expression
        | additive_expression PLUS multiplicative_expression
        | additive_expression MOINS multiplicative_expression
        ;

relational_expression
        : additive_expression
        | relational_expression CHEVRON_L additive_expression
        | relational_expression CHEVRON_R additive_expression
        | relational_expression LE_OP additive_expression
        | relational_expression GE_OP additive_expression
        ;

equality_expression
        : relational_expression
        | equality_expression EQ_OP relational_expression
        | equality_expression NE_OP relational_expression
        ;

logical_and_expression
        : equality_expression
        | logical_and_expression AND_OP equality_expression
        ;

logical_or_expression
        : logical_and_expression
        | logical_or_expression OR_OP logical_and_expression
        ;

expression
        : logical_or_expression
        | unary_expression AFFECTATION expression
        ;

declaration
        : declaration_specifiers declarator POINT_VIRGULE
        | struct_specifier POINT_VIRGULE
        ;

declaration_specifiers
        : EXTERN type_specifier
        | type_specifier
        ;

type_specifier
        : VOID
        | INT
        | struct_specifier
        ;

struct_specifier
        : STRUCT IDENTIFIER ACCOLADE_GAUCHE struct_declaration_list ACCOLADE_DROITE
        | STRUCT ACCOLADE_GAUCHE struct_declaration_list ACCOLADE_DROITE
        | STRUCT IDENTIFIER
        ;

struct_declaration_list
        : struct_declaration
        | struct_declaration_list struct_declaration
        ;

struct_declaration
        : type_specifier declarator POINT_VIRGULE
        ;

declarator
        : ETOILE direct_declarator
        | direct_declarator
        ;

direct_declarator
        : IDENTIFIER
        | PARENTHESE_GAUCHE declarator PARENTHESE_DROITE
        | direct_declarator PARENTHESE_GAUCHE parameter_list PARENTHESE_DROITE
        | direct_declarator PARENTHESE_GAUCHE PARENTHESE_DROITE  
        ;

parameter_list
        : parameter_declaration
        | parameter_list VIRGULE parameter_declaration
        ;

parameter_declaration
        : declaration_specifiers declarator
        ;

statement
        : compound_statement
        | expression_statement
        | selection_statement
        | iteration_statement
        | jump_statement 
        ;

compound_statement
        : ACCOLADE_GAUCHE ACCOLADE_DROITE
        | ACCOLADE_GAUCHE statement_list ACCOLADE_DROITE
        | ACCOLADE_GAUCHE declaration_list ACCOLADE_DROITE
        | ACCOLADE_GAUCHE declaration_list statement_list ACCOLADE_DROITE
        ;

declaration_list
        : declaration
        | declaration_list declaration
        ;

statement_list
        : statement
        | statement_list statement
        ;

expression_statement
        : POINT_VIRGULE
        | expression POINT_VIRGULE
        ;

selection_statement
        : IF PARENTHESE_GAUCHE expression PARENTHESE_DROITE statement
        | IF PARENTHESE_GAUCHE expression PARENTHESE_DROITE statement ELSE statement
        ;

iteration_statement
        : WHILE PARENTHESE_GAUCHE expression PARENTHESE_DROITE statement
        | FOR PARENTHESE_GAUCHE expression_statement expression_statement expression PARENTHESE_DROITE statement
        ;

jump_statement
        : RETURN POINT_VIRGULE
        | RETURN expression POINT_VIRGULE
        ;

program
        : external_declaration { printf("On est dans le programme");}
        | program external_declaration
        ;

external_declaration
        : function_definition
        | declaration
        ;

function_definition
        : declaration_specifiers declarator compound_statement
        ;

%%
int main(void){
        printf("Debut de l'analyse syntaxique :\n");
        yyparse();
        printf("Fin de l'analyse !\n");
        printf("Resultat :\n");
        if(error_lexical){
                printf("\t-- Echec : Certains lexemes ne font pas partie du lexique du langage ! --\n");
                printf("\t-- Echec a l'analyse lexicale --\n");
        }
        else{
                printf("\t-- Succes a l'analyse lexicale ! --\n");
        }
        if(error_syntaxical){
                printf("\t-- Echec : Certaines phrases sont syntaxiquement incorrectes ! --\n");
                printf("\t-- Echec a l'analyse syntaxique --\n");
        }
        else{
                printf("\t-- Succes a l'analyse syntaxique ! --\n");
        }
        return EXIT_SUCCESS;
}
void yyerror(char *s) {
        fprintf(stderr, "Erreur de syntaxe a la ligne %d: %s\n", lineno, s);
		error_syntaxical = true;
}
