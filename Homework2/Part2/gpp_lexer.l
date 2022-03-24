%{
    #include "y.tab.h"
	#include <string.h>
%}


%%

"+" {
	return OP_PLUS;
} 
"-" {
	return OP_MINUS;
} 
"/" {
	return OP_DIV;
}
"*" {
	return OP_MULT;
}  
"(" {
	return OP_OP;
}  
")" {
	return OP_CP;
}  
"**" {;
	return OP_DBLMULT;
}  
"," {
	return OP_COMMA;
}  

"and" {
	return KW_AND;
}
"AND" {
	return KW_AND;
}

"or" {
    return KW_OR;
}
"OR" {
	return KW_OR;
}

"not" {
	return KW_NOT;
}

"NOT" {
	return KW_NOT;
}

"equal" {
	return  KW_EQUAL;
}
"EQUAL" {
	return  KW_EQUAL;
}
 
"less" {
	return  KW_LESS;
}
"LESS" {
	return  KW_LESS;
}

"nil" {
	return  KW_NIL;
}
"NIL" {
	return  KW_NIL;
}

"list" {	
	return  KW_LIST;
}
"LIST" {	
	return  KW_LIST;
}

"append" {
	return  KW_APPEND;
}
"APPEND" {
	return  KW_APPEND;
}

"concat" {
	return  KW_CONCAT;
}
"CONCAT" {
	return  KW_CONCAT;
}

"set" {
	return  KW_SET;
}
"SET" {	
	return  KW_SET;
}

"deffun" {
	return  KW_DEFFUN;
}
"DEFFUN" {
	return  KW_DEFFUN;
}

"for" {
	return KW_FOR;
}
"FOR" {
	return KW_FOR;
}


"if" {
	return KW_IF;
}
"IF" {
	return KW_IF;
}

"exit" {
	return KW_EXIT;
}  
"EXIT" {	
	return KW_EXIT;
}  
  
"load" {
	return KW_LOAD;
}
"LOAD" {
	return KW_LOAD;
}

"disp" {
	return KW_DISP;
}
"DISP" {
	return KW_DISP;
}
"true" {
	return KW_TRUE;
}
"TRUE" {
	return KW_TRUE;
}

"false" {
	return KW_FALSE;
}
"FALSE" {
	return KW_FALSE;
}

[0] {return VALUE;}
[-1-9][0-9]* {
	yylval.number = atoi(yytext);
	return VALUE;
}
[a-zA-Z][a-zA-Z0-9]* {
	yylval.name = strdup(yytext);
	return IDENTIFIER;
}

[0-9]+[a-zA-Z0-9]* {printf("INVALID_TOKEN");}

%%

int yywrap(void)
{
	return 1;
}





  
