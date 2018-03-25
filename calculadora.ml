(** Implementacion en OCaml de un analizador lexico, un analizador sintactico
    y un interpretador sencillo para simular una calculadora de mesa.
    
    Realizado como proyecto del ensayo sobre los conceptos estudiados en la 
    materia CI3641, Lenguajes de Programación I.
    
    @author Cabeza David
    @author Martinez Fabiola
    
    @since Marzo, 2018
*)

(* Interpretador sencillo *)

let _ = 
	try
		let lexbuf = Lexing.from_channel stdin in
		while true do
			let result = Parser.main Lexer.token lexbuf in
			Printf.printf "= "; print_float result; print_newline(); flush stdout
		done
	with Lexer.Eof ->
		exit 0