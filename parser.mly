/* Implementacion en OCaml de un analizador lexico, un analizador sintactico
    y un interpretador sencillo para simular una calculadora de mesa.
    
    Realizado como proyecto del ensayo sobre los conceptos estudiados en la 
    materia CI3641, Lenguajes de Programación I.
    
    @author Cabeza David
    @author Martinez Fabiola
    
    @since Marzo, 2018
*/

/* Analizador semantico. Powered by OCamlyacc */

/* Declaracion de Tokens */
%token <float> FLOAT
%token PLUS, MINUS, TIMES, DIV
%token PERCENT, SQRT
%token LPAREN, RPAREN
%token EOL

/* Precedencia. De menor precedencia a mayor precedencia */
%left PLUS, MINUS
%left TIMES DIV
%nonassoc UMINUS, SQRT, PERCENT

/* Punto de entrada */
%start main
%type <float> main

%%
main:
	  expr EOL                { $1 }
;

expr: 
      FLOAT                   { $1 }
    | LPAREN expr RPAREN      { $2 }
    | expr PLUS expr          { $1 +. $3 }
    | expr MINUS expr         { $1 -. $3 }
    | expr TIMES expr         { $1 *. $3 }
    | expr DIV expr           { $1 /. $3 }
    | MINUS expr %prec UMINUS { -. $2 }
    | SQRT expr               { sqrt $2 }
    | expr PERCENT            { $1 /. 100. }
;    