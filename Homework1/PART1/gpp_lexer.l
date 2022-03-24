%{
    #include "scan.h"
%}


%%

"+" {
	printf("OP_PLUS\n");
	//return OP_PLUS;
} 
"-" {
	printf("OP_MINUS\n");
	//return OP_MINUS;
} 
"/" {
	printf("OP_DIV\n");
	//return OP_DIV;
}
":" {
	printf("OP_DIV2\n");
	//return OP_DIV2;
}
"*" {
	printf("OP_MULT\n");
	//return OP_MULT;
}  
"(" {
	printf("OP_OP\n");
	//return OP_OP;
}  
")" {
	printf("OP_CP\n");
	//return OP_CP;
}  
"**" {
	printf("OP_DBLMULT\n");
	//return OP_DBLMULT;
}  
"," {
	printf("OP_COMMA\n");
	//return OP_COMMA;
}  

"and" {
	printf("KW_AND\n");	
	//return KW_AND;
}
"AND" {
	printf("KW_AND\n");
	//return KW_AND;
}

"or" {
	printf("KW_OR\n");
    //return KW_OR;
}
"OR" {
	printf("KW_OR\n");
	//return KW_OR;
}

"not" {
	printf("KW_NOT\n");	
	//return KW_NOT;
}

"NOT" {
	printf("KW_NOT\n");	
	//return KW_NOT;
}

"equal" {
	printf("KW_EQUAL\n");	
	//return  KW_EQUAL;
}
"EQUAL" {
	printf("KW_EQUAL\n");	
	//return  KW_EQUAL;
}
 
"less" {
	printf("KW_LESS\n");	
	//return  KW_LESS;
}
"LESS" {
	printf("KW_LESS\n");	
	//return  KW_LESS;
}

"nil" {
	printf("KW_NILL\n");
	//return  KW_NIL;
}
"NIL" {
	printf("KW_NILL\n");
	//return  KW_NIL;
}

"list" {
	printf("KW_LIST\n");	
	//return  KW_LIST;
}
"LIST" {
	printf("KW_LIST\n");	
	//return  KW_LIST;
}

"append" {
	printf("KW_APPEND\n");
	//return  KW_APPEND;
}
"APPEND" {
	printf("KW_APPEND\n");
	//return  KW_APPEND;
}

"concat" {
	printf("KW_CONCAT\n");
	//return  KW_CONCAT;
}
"CONCAT" {
	printf("KW_CONCAT\n");
	//return  KW_CONCAT;
}

"set" {
	printf("KW_SET\n");	
	//return  KW_SET;
}
"SET" {
	printf("KW_SET\n");	
	//return  KW_SET;
}

"deffun" {
	printf("KW_DEFFUN\n");	
	//return  KW_DEFFUN;
}
"DEFFUN" {
	printf("KW_DEFFUN\n");	
	//return  KW_DEFFUN;
}

"for" {
	printf("KW_FOR\n");
	//return KW_FOR;
}
"FOR" {
	printf("KW_FOR\n");
	//return KW_FOR;
}


"if" {
	printf("KW_IF\n");
	//return KW_IF;
}
"IF" {
	printf("KW_IF\n");
	//return KW_IF;
}

"exit" {
	printf("KW_EXIT\n");	
	//return KW_EXIT;
}  
"EXIT" {
	printf("KW_EXIT\n");	
	//return KW_EXIT;
}  
  
"load" {
	printf("KW_LOAD\n");
	//return KW_LOAD;
}
"LOAD" {
	printf("KW_LOAD\n");
	//return KW_LOAD;
}

"disp" {
	printf("KW_DISP\n");
	//return KW_DISP;
}
"DISP" {
	printf("KW_DISP\n");
	//return KW_DISP;
}
"true" {
	printf("KW_TRUE");	
	//return KW_TRUE;
}
"TRUE" {
	printf("KW_TRUE");	
	//return KW_TRUE;
}

"false" {
	printf("KW_FALSE\n");
	//return KW_FALSE;
}
"FALSE" {
	printf("KW_FALSE\n");
	//return KW_FALSE;
}

[0] {
	printf("VALUE\n");
return VALUE;}
[-1-9][0-9]* {
	printf("VALUE\n");
	//return VALUE;
}
[a-zA-Z][a-zA-Z0-9]* {
	printf("IDENTIFIER\n");
	//return IDENTIFIER;
}

[0-9]+[a-zA-Z0-9]* {printf("INVALID_TOKEN");}

%%

int yywrap(void)
{
	return 1;
}





  
