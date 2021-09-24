#include <stdio.h>
#include "gpp_lexer.h"

int yylex();

int main(void) 
{

  int input;

  input = yylex();

  while(input) {
    
    switch (input) {
      case KW_AND:
        printf("KW_AND\n");
      break;
      case KW_OR:
        printf("KW_OR\n");
      break;
      case KW_NOT:
        printf("KW_NOT\n");
      break;
      case KW_EQUAL:
        printf("KW_EQUAL\n");
      break;
      case KW_NIL:
        printf("KW_NIL\n");
      break;
      case KW_LIST:
        printf("KW_LIST\n");
      break;
      case KW_APPEND:
        printf("KW_APPEND\n");
      break;
      case KW_CONCAT:
        printf("KW_CONCAT\n");
      break;
      case KW_SET:
        printf("KW_SET\n");
      break;
      case KW_DEFFUN:
        printf("KW_DEFFUN\n");
      break;
      case KW_FOR:
        printf("KW_FOR\n");
      break;
      case KW_IF:
        printf("KW_IF\n");
      break;
      case KW_EXIT:
        printf("KW_EXIT\n");
      break;
      case KW_LOAD:
        printf("KW_LOAD\n");
      break;
      case KW_DISP:
        printf("KW_DISP\n");
      break;
      case KW_TRUE:
        printf("KW_TRUE\n");
      break;
      case IDENTIFIER:
        printf("IDENTIFIER\n");
      break;
      case VALUE:
        printf("VALUE\n");
      break;
      case OP_OP:
        printf("OP_OP\n");
      break;
      case OP_CP:
        printf("OP_CP\n");
      break;
      case OP_PLUS:
        printf("OP_PLUS\n");
      break;
      case OP_MINUS:
        printf("OP_MINUS\n");
      break;
      case OP_MULT:
        printf("OP_MULT\n");
      break;
      case OP_DIV:
        printf("OP_DIV\n");
      break;
      case OP_DBLMULT:
        printf("OP_DBLMULT\n");
      break;
      case OP_COMMA:
        printf("OP_COMMA\n");
      break;
      case OP_OC:
        printf("OP_OC\n");
      break;
      case OP_CC:
        printf("OP_CC\n");
      break;
      case COMMENT:
        printf("COMMENT\n");
      break;
    default:
      printf("Syntax error\n");
    }
    input = yylex();
  }

  return 0;
}
