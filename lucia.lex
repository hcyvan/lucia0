%{
#include "lucia.tab.h"
#include "message.h"
#include "lib.h"
int column=1;
int yywrap(void)
{
	return 1;
}
void updatePosition()
{
	col=column;	
	column+=yyleng;
}
void newline()
{
	line+=1;
	column=1;
}
	
%}
%option yylineno
%%
[0-9]+					 	{updatePosition();yylval.ival=atoi(yytext);return INT;}
[_A-Za-z][_A-Za-z0-9]*		{updatePosition();yylval.sval=yytext;return ID;}
" "|\t						{updatePosition();}
\n							{newline();return yytext[0];}
.	 						{updatePosition();return yytext[0];}
