%{
#include "gpp_lexer.h"
%}
%option nounput yylineno

%%
"and"					return KW_AND;
"or"					return KW_OR;
"not"					return KW_NOT;
"equal"					return KW_EQUAL;
"less"					return KW_LESS;
"nil"					return KW_NIL;
"list"					return KW_LIST;
"append"				return KW_APPEND;
"concat"				return KW_CONCAT;
"set"					return KW_SET;
"deffun"				return KW_DEFFUN;
"for"					return KW_FOR;
"if"					return KW_IF;
"exit"					return KW_EXIT;
"load"					return KW_LOAD;
"disp"					return KW_DISP;
"true"					return KW_TRUE;
"false"					return KW_FALSE;
[(]						return OP_OP;
[)]						return OP_CP;
"+"						return OP_PLUS;
"-"						return OP_MINUS;
"*"						return OP_MULT;
"/"						return OP_DIV;
"**"					return OP_DBLMULT;
,						return OP_COMMA;
["]						return OP_OC;
[_a-zA-Z0-9]*["]		return OP_CC;
;;						return COMMENT;

[a-zA-Z][_a-zA-Z0-9]*	return IDENTIFIER;
[0-9][0-9]*				return VALUE;
[ \t\n]					;
.						printf("Unexpected character\n");

%%

int yywrap(void)
{
	return 1;
}

