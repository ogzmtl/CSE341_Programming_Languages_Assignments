%{
   #include <stdio.h>
   #include <stdlib.h>
   #include <string.h>
   int yylex();
   int yyerror();
   int id(char* identifier, int num);
   int getval(char* identifier);
   typedef struct idlist{
   
	int value;
	char* name;
	struct id_list* next;
   }id_n;

   id_n *head = NULL;

%}


%token OP_MULT OP_MINUS OP_DIV OP_DBLMULT OP_PLUS
%token OP_COMMA OP_OP OP_CP COMMENT 
%token KW_AND KW_OR KW_NOT KW_EQUAL KW_LESS KW_FOR KW_IF
%token KW_APPEND KW_CONCAT KW_SET KW_DEFFUN KW_NIL KW_LIST
%token KW_EXIT KW_LOAD KW_DISP KW_TRUE KW_FALSE
%token <name> IDENTIFIER
%token <number> VALUE
%type <number>  EXPI EXPB VALUES INPUT 
//%type <llid> EXPLISTI
%start START 

%union
{
	int number;
	char *name;
}


%%
START : INPUT START 
		| KW_EXIT;

INPUT : 
		EXPI
	   ;

LISTVALUE :   "'" OP_OP VALUES OP_CP
		    | "'" OP_OP OP_CP
		//	| OP_OP KW_LIST VALUES OP_CP			
		    ;
VALUES :
		  VALUES VALUE 
		| VALUE {$$ = $1};
EXPI : 
		 OP_OP OP_PLUS EXPI EXPI OP_CP {$$ = $3 + $4;printf("Result :%d\n",$$);printf("SYNTAX OK\n");} 
	   | OP_OP OP_MINUS EXPI EXPI OP_CP{$$ = $3 - $4;printf("Result :%d\n",$$);printf("SYNTAX OK\n");}
	   | OP_OP OP_MULT EXPI EXPI OP_CP{$$ = $3 * $4;printf("Result :%d\n",$$);printf("SYNTAX OK\n");}
	   | OP_OP OP_DIV EXPI EXPI OP_CP{$$ = $3 / $4;printf("Result :%d\n",$$);printf("SYNTAX OK\n");}
	   | OP_OP OP_DBLMULT EXPI OP_CP {$$ = $3 * $3;printf("Result :%d\n",$$);printf("SYNTAX OK\n");}
	   | IDENTIFIER{$$=getval($1);}
	   | VALUE {$$ = $1;}
	   //| OP_OP KW_EXIT OP_CP {printf("EXIT SUCCESS\n Syntax OK"); exit(1);}
	   | OP_OP KW_DEFFUN IDENTIFIER EXPI OP_CP
	   | OP_OP KW_SET IDENTIFIER EXPI OP_CP {$$ = id($3,$4);} 
	   ;

EXPB : 
		 OP_OP KW_AND EXPB EXPB OP_CP 
			{if($3 || $4)
				$$ = 1;
			 else 
				$$ = 0;
			  printf("Result: %d\n Syntax OK.", $$);
			}
	   | OP_OP KW_OR EXPB EXPB OP_CP 
			{if($3 || $4)
				$$ = 1;
			 else 
				$$ = 0;
			  printf("Result: %d\n Syntax OK.", $$);
			}
	   | OP_OP KW_NOT EXPB OP_CP {$$ = !($3);printf("Result: %d\n Syntax OK.", $$);}
	   | OP_OP KW_EQUAL EXPI EXPI OP_CP
			{if($3 == $4)
				$$ = 1;
			 else
				$$ = 0;	
			  printf("Result: %d\n Syntax OK.", $$);		
			}
	   | OP_OP KW_LESS EXPI EXPI OP_CP 
			{if($3 < $4)
				$$ = 1; 
			 else
				$$ = 0 ;
			  printf("Result: %d\n Syntax OK.", $$);
			}
	   | OP_OP KW_TRUE OP_CP {$$ = 1;}
	   | OP_OP KW_FALSE OP_CP {$$ = 0;}
	   ;
	 
%%
int yyerror(){
	printf("SYNTAX_ERROR");
	 exit(1);
} 
int getval(char* identifier)
{
	id_n* temp = head;
	while(temp != NULL)
	{
		if(strcmp(temp->name,identifier) == 0)
		{
			return temp->value;
		}
		else 
			temp = temp->next;
	}
}
int id(char* identifier, int num)
{
	
	if(head == NULL) {
		head = (id_n*)malloc(sizeof(id_n));
		head->name  ="1";
		head->value = 0;
		head->next  = NULL;
	}
	id_n* temp = head;

		while(temp->next != NULL)
		{
			temp = temp->next;
		}
		id_n* newnode = (id_n*)malloc(sizeof(id_n));
		newnode->value = num;
		newnode->name = identifier;	
		temp->next = newnode;	
		return 1;
}
int main()
{
	yyparse();
return 0;
}







