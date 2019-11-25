
all: Data.cmi Debug.cmx Lexer.cmx Parser.cmx Main.cmx
	ocamlopt -o charon Debug.cmx Lexer.cmx Main.cmx

test: Data.cmi Debug.cmx Lexer.cmx Parser.cmx Test.cmx
	ocamlopt -o test Debug.cmx Lexer.cmx Parser.cmx Test.cmx
	./test

Test.cmx:
	ocamlopt -c Test.ml

Main.cmx:
	ocamlopt -c Main.ml

Parser.cmx:
	ocamlc -c Parser.mli
	ocamlopt -c Parser.ml

Lexer.cmx:
	ocamlc -c Lexer.mli
	ocamlopt -c Lexer.ml

Debug.cmx:
	ocamlc -c Debug.mli
	ocamlopt -c Debug.ml

Data.cmi:
	ocamlopt -c Data.mli

clean:
	rm -rf *.cmi
	rm -rf *.cmx
	rm -rf *.o
	rm -rf charon
	rm -rf test
