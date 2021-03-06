# Interpretador de una cálculadora de mesa en OCaml

Implementacion en OCaml de un analizador lexico, un analizador sintactico y un interpretador sencillo para simular una calculadora de mesa.

Realizado como proyecto del ensayo sobre los conceptos estudiados en la materia CI3641, Lenguajes de Programación I.

## Instalación y ejecución

Para compilar el archivo se provee un Makefile.

Es necesario tener el compilador de bytecode ocamlc y las herramientas ocamllex y ocamlyacc. La manera más sencilla es instalando opam (OCaml Package Manager) través de aptitude.

```bash
sudo apt-get install opam
```

Para más informacion, referirse a <https://ocaml.org/docs/install.html>

Luego de instalar opam, dirigirse al directorio del repositorio, ejecutar ```make``` y correr con

```./calculadora```

La calculadora espera una serie de operaciones que pueden estar parentizadas.

### Ejemplos

```bash
(9*10)%
= 0.9

sqrt (16+9)
=  5.

(9-4)*32/10+4
= 20.
```
