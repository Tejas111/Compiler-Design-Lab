%{
int single_line=0;
int multi_line=0;
%}
 
%%
("//".) {single_line++;}
"/*"(.|\n)*"*/" multi_line++;
%%

int yywrap(){};
int main()
{
	printf("Enter the input\n");
	yylex();
	printf("the singleline = %d the multiline is %d \n",single_line,multi_line);
     return 0;
}
