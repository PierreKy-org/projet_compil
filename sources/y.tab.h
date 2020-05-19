/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    IDENTIFIER = 258,
    CONSTANT = 259,
    SIZEOF = 260,
    LE_OP = 261,
    GE_OP = 262,
    EQ_OP = 263,
    L_OP = 264,
    G_OP = 265,
    EXTERN = 266,
    NUMBER = 267,
    INT = 268,
    VOID = 269,
    STRUCT = 270,
    IF = 271,
    ELSE = 272,
    WHILE = 273,
    FOR = 274,
    RETURN = 275,
    ADRESSE = 276,
    PTR_OP = 277,
    FLECHE = 278,
    ACCOLADE_GAUCHE = 279,
    ACCOLADE_DROITE = 280,
    AFFECTATION = 281,
    VIRGULE = 282,
    POINT_VIRGULE = 283,
    CHEVRON_L = 284,
    CHEVRON_R = 285,
    PLUS = 286,
    MOINS = 287,
    ETOILE = 288,
    SLASH = 289,
    AND_OP = 290,
    OR_OP = 291,
    NE_OP = 292,
    PARENTHESE_GAUCHE = 293,
    PARENTHESE_DROITE = 294
  };
#endif
/* Tokens.  */
#define IDENTIFIER 258
#define CONSTANT 259
#define SIZEOF 260
#define LE_OP 261
#define GE_OP 262
#define EQ_OP 263
#define L_OP 264
#define G_OP 265
#define EXTERN 266
#define NUMBER 267
#define INT 268
#define VOID 269
#define STRUCT 270
#define IF 271
#define ELSE 272
#define WHILE 273
#define FOR 274
#define RETURN 275
#define ADRESSE 276
#define PTR_OP 277
#define FLECHE 278
#define ACCOLADE_GAUCHE 279
#define ACCOLADE_DROITE 280
#define AFFECTATION 281
#define VIRGULE 282
#define POINT_VIRGULE 283
#define CHEVRON_L 284
#define CHEVRON_R 285
#define PLUS 286
#define MOINS 287
#define ETOILE 288
#define SLASH 289
#define AND_OP 290
#define OR_OP 291
#define NE_OP 292
#define PARENTHESE_GAUCHE 293
#define PARENTHESE_DROITE 294

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
