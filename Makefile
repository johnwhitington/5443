SOURCES = test.ml

PACKS = bigarray

RESULT = test

OCAMLNCFLAGS = -g -annot
OCAMLBCFLAGS = -g -annot
OCAMLLDFLAGS = -g

all : native-code

-include OCamlMakefile

