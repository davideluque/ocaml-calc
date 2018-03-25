OCAMLMAKEFILE = OCamlMakefile

SOURCES = parser.mly lexer.mll calculadora.ml
RESULT  = calculadora
THREADS = yes

include $(OCAMLMAKEFILE)
