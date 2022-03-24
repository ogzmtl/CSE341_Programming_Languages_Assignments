#include <stdio.h>
#include "scan.h"

extern int yylex();
extern int yylineo;
extern char* yytext;

int main()
{
    int token = yylex();

	while(token) 
	{	
		printf("%d\n",token);	
		token = yylex();	
	}
return 0;
}
