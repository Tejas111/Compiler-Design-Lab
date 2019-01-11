%{
#include<stdio.h>
int i=0,yr=0,valid=0;

%}

%%
([0-2][0-9]|[3][0-1])\/((0(1|3|5|7|8))|(10|12))\/([1-2][0-9][0-9][-0-9]) {valid++;}

([0-2][0-9]|30)\/((0(4|6|9))|11)\/([1-2][0-9][0-9][0-9]) {valid++;}

([0-1][0-9]|2[0-8])\/02\/([1-2][0-9][0-9][0-9]) {valid++;}

29\/02\/([1-2][0-9][0-9][0-9]) { 
while(yytext[i]!='/')i++;
i++;
while(yytext[i]!='/')i++;
i++;
while(i<yyleng)
yr = (10*yr)+(yytext[i++]-'0');

if(yr%4==0||(yr%100!=0 && yr%400 ==0))

valid++;
}



%%
int yywrap(){};
int main()
{
	printf("Enter the input\n");
	yylex();
	printf("No of valid dates %d\n",valid);
     return 0;
}

