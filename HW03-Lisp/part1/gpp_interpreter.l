%{
#include "y.tab.h"
void yyerror (char *s);
int yylex();
%}
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
"defvar"				return KW_DEFVAR;
"for"					return KW_FOR;
"while"					return KW_WHILE;
"if"					return KW_IF;
"exit"					return KW_EXIT;
"load"					return KW_LOAD;
"disp"					return KW_DISP;
"true"					return KW_TRUE;
"false"					return KW_FALSE;
"+"						return OP_PLUS;
"-"						return OP_MINUS;
"*"						return OP_MULT;
"/"						return OP_DIV;
"'"						return LIST_COMMA;
[(]						return OP_OP;
[)]						return OP_CP;
[a-zA-Z]			   {yylval.id = yytext[0]; return Identifier;}
[0-9]+                 {yylval.num = atoi(yytext); return IntegerValue;}
[ \t\n]                ;
[-+*/=;]           	   {return yytext[0];}

.                      {ECHO; yyerror ("unexpected character");}

%%
int yywrap (void) {return 1;}

