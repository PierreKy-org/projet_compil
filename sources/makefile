compiler :	lex.yy.c y.tab.c
	@gcc -o compiler lex.yy.c y.tab.c
	@echo "Un compilateur a été créé : compiler"
	
lex.yy.c :	ANSI-C.l
	@flex ANSI-C.l

y.tab.c :	structfe.y
	@yacc -d structfe.y -Wnone

clean :
	@rm lex.yy.c y.tab.c y.tab.h compiler 
	@echo "Suppression des fichiers effectuée."

run  :
	@echo "===============================\nTest du fichier add.c :\n"
	@./compiler < ../Tests/add.c

	@echo "===============================\nTest du fichier compteur.c :\n"
	@./compiler < ../Tests/compteur.c

	@echo "===============================\nTest du fichier cond.c :\n"
	@./compiler < ../Tests/cond.c

	@echo "===============================\nTest du fichier div.c :\n"
	@./compiler < ../Tests/div.c

	@echo "===============================\nTest du fichier expr.c :\n"
	@./compiler < ../Tests/expr.c

	@echo "===============================\nTest du fichier functions.c :\n"
	@./compiler < ../Tests/functions.c

	@echo "===============================\nTest du fichier listes.c :\n"
	@./compiler < ../Tests/listes.c
	
	@echo "===============================\nTest du fichier loops.c :\n"
	@./compiler < ../Tests/loops.c
	
	@echo "===============================\nTest du fichier mul.c :\n"
	@./compiler < ../Tests/mul.c
	
	@echo "===============================\nTest du fichier pointeur.c :\n"
	@./compiler < ../Tests/pointeur.c

	@echo "===============================\nTest du fichier sub.c :\n"
	@./compiler < ../Tests/sub.c

	@echo "===============================\nTest du fichier t.c :\n"
	@./compiler < ../Tests/t.c

	@echo "===============================\nTest du fichier variables.c :\n"
	@./compiler < ../Tests/variables.c