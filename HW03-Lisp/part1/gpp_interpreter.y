%{
void yyerror (char *s);
int yylex();
#include <stdio.h>     /* C declarations used in actions */
#include <stdlib.h>
#include <ctype.h>
int symbols[52];
int symbolVal(char symbol);
void updateSymbolVal(char symbol, int val);
%}
%name parse
%union {int num; char id;}         /* Yacc definitions */
%start INPUT

%token KW_AND
%token KW_OR
%token KW_NOT
%token KW_EQUAL
%token KW_LESS LIST_COMMA
%token KW_NIL
%token KW_LIST
%token KW_APPEND
%token KW_CONCAT
%token KW_SET
%token KW_DEFFUN
%token KW_DEFVAR
%token KW_FOR
%token KW_WHILE
%token KW_IF
%token KW_EXIT
%token KW_LOAD
%token KW_DISP
%token KW_TRUE
%token KW_FALSE
%token OP_OP
%token OP_CP
%token OP_PLUS
%token OP_MINUS
%token OP_MULT
%token OP_DIV
%token <num> IntegerValue
%token <id> Identifier
%type <num> INPUT EXPI EXPLISTI EXPB TERM LISTVALUE VALUES FUNC


%%

/* descriptions of expected inputs     corresponding actions (in C) */


INPUT 	: EXPI
		| EXPLISTI
		| EXPB
		;

EXPI    	
       	:  OP_OP OP_PLUS VALUES  VALUES OP_CP  {$$ = $3 + $4; printf("Syntax OK.\nResult:%d\n", $$);}
       	|  OP_OP OP_MINUS VALUES  VALUES OP_CP {$$ = $3 - $4;printf("Syntax OK.\nResult: %d\n", $$);}
       	|  OP_OP OP_MULT VALUES  VALUES OP_CP  {$$ = $3 * $4;printf("Syntax OK.\nResult: %d\n", $$);}
       	|  OP_OP OP_DIV VALUES  VALUES OP_CP   {$$ = $3 / $4;printf("Syntax OK.\nResult: %d\n", $$);}
       	|  OP_OP KW_SET Identifier EXPI EXPI OP_CP {updateSymbolVal($3,$4);}
       	|  OP_OP KW_DEFFUN VALUES FUNC EXPI  OP_CP {printf("Syntax OK.\n");}
       	|  OP_OP KW_DEFFUN VALUES FUNC  OP_CP {printf("Syntax OK.\n");}
       	|  OP_OP Identifier EXPI OP_CP {printf("Syntax OK.\n");}
       	|  OP_OP KW_IF EXPB EXPLISTI OP_CP {printf("Syntax OK.\n");}
       	|  OP_OP KW_IF EXPB EXPLISTI EXPI OP_CP {printf("Syntax OK.\n");}
       	|  OP_OP KW_WHILE OP_OP EXPB OP_CP  EXPLISTI OP_CP {printf("Syntax OK.\n");}
       	|  OP_OP KW_FOR OP_OP Identifier EXPI EXPI OP_CP EXPLISTI OP_CP {printf("Syntax OK.\n");}
       	|  OP_OP KW_DEFVAR Identifier EXPI OP_CP {printf("Syntax OK.\n");}
       	|  OP_OP KW_SET Identifier EXPI OP_CP {printf("Syntax OK.\n");}
       	|  VALUES {;}
       	; 

EXPLISTI: OP_OP KW_LIST  VALUES  OP_CP {printf("Syntax OK. \nResult: %d\n", $3);}
		| OP_OP KW_EXIT OP_CP	{printf("Syntax OK.\n");exit(EXIT_SUCCESS);}
		| OP_OP KW_CONCAT EXPLISTI EXPLISTI OP_CP {printf("Syntax OK.\n");}
		| OP_OP KW_APPEND EXPI EXPLISTI OP_CP {printf("Syntax OK.\n");}
		| LISTVALUE {printf("Syntax OK.\n");}
		| EXPI {;}
        ;

EXPB 	: OP_OP KW_AND 		EXPB EXPB OP_CP {printf("Syntax OK.\n");}
		| OP_OP KW_OR  		EXPB EXPB OP_CP {printf("Syntax OK.\n");}
		| OP_OP KW_NOT 		EXPB OP_CP		{printf("Syntax OK.\n");}
		| OP_OP KW_EQUAL 	EXPB EXPB OP_CP	{printf("Syntax OK.\n");}
		| OP_OP KW_EQUAL 	EXPI EXPI OP_CP	{printf("Syntax OK.\n");}
		| TERM {;}
		;
	

LISTVALUE 	: LIST_COMMA OP_OP VALUES OP_CP {;}
			| LIST_COMMA OP_OP OP_CP {;} {printf("Syntax OK.\n");}
			;

FUNC 		: OP_OP VALUES OP_CP{;};

VALUES 		: VALUES TERM {;}
			| TERM {;}
			;

TERM   		: IntegerValue          {$$ = $1;}
			| Identifier			{$$ = symbolVal($1);}
	        ;

%%                     /* C code */

int computeSymbolIndex(char token)
{
	int idx = -1;
	if(islower(token)) {
		idx = token - 'a' + 26;
	} else if(isupper(token)) {
		idx = token - 'A';
	}
	return idx;
} 

/* returns the value of a given symbol */
int symbolVal(char symbol)
{
	int bucket = computeSymbolIndex(symbol);
	return symbols[bucket];
}

/* updates the value of a given symbol */
void updateSymbolVal(char symbol, int val)
{
	int bucket = computeSymbolIndex(symbol);
	symbols[bucket] = val;
}

int main (void) {
	/* init symbol table */
	int i;
	for(i=0; i<52; i++) {
		symbols[i] = 0;
	}

	return yyparse ( );
}

void yyerror (char *s) {printf("SYNTAX_ERROR Not recognized\n");} 

