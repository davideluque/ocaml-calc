(** Implementacion en OCaml de un analizador lexico, un analizador sintactico
    y un interpretador sencillo para simular una calculadora de mesa.
    
    Realizado como proyecto del ensayo sobre los conceptos estudiados en la 
    materia CI3641, Lenguajes de Programación I.
    
    @author Cabeza David
    @author Martinez Fabiola
    
    @since Marzo, 2018
*)

(* Analizador lexico *)

(* Cabecera del analizador *)
{
open Parser   (* Directiva open para tener accesibles los contenidos de Parser *)
exception Eof (* Para lanzar un EOF *)
}

let float = ['0'-'9']+(['.']['0'-'9']*)?

(* Definicion de expresiones regulares para reconocer tokens *)
rule token = parse
    [' ' '\t']         { token lexbuf } (* Ignorar espacios en blanco, tabs. *)
  | ['\n']             { EOL }
  | float as i         { FLOAT(float_of_string i) } (* Casting del input *)
  | '+'                { PLUS }
  | '-'                { MINUS }
  | '*'                { TIMES }
  | '/'                { DIV }
  | '%'                { PERCENT }
  | "sqrt"             { SQRT }
  | '('                { LPAREN }
  | ')'                { RPAREN }
  | eof                { raise Eof } (* Fin de la entrada del lexer *)
