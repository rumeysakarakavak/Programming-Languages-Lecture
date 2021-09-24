gpp_lexer: gpp_lexer.c gpp_lexer.h lex.yy.c
	cc gpp_lexer.c lex.yy.c -ll -o gpp_lexer 

lex.yy.c: gpp_lexer.l
	lex gpp_lexer.l

clean:
	rm gpp_lexer
	rm lex.yy.c
