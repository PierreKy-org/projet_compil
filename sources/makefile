compiler :	lex.yy.c y.tab.c
		cc -o compiler lex.yy.c y.tab.c
	
lex.yy.c :	ANSI-C.l
		flex ANSI-C.l

y.tab.c :	structfe.y
		yacc -d structfe.y

clean :
	rm lex.yy.c y.tab.c y.tab.h compiler 
