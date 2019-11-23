
all: Data.cmi Lexer.cmx Main.cmx
	ocamlopt -o charon Lexer.cmx Main.cmx

test: Data.cmi Lexer.cmx Test.cmx
	ocamlopt -o test Lexer.cmx Test.cmx
	./test

Test.cmx:
	ocamlopt -c Test.ml

Main.cmx:
	ocamlopt -c Main.ml

Lexer.cmx:
	ocamlc -c Lexer.mli
	ocamlopt -c Lexer.ml

Data.cmi:
	ocamlopt -c Data.mli

clean:
	rm -rf *.cmi
	rm -rf *.cmx
	rm -rf *.o
	rm -rf charon
	rm -rf test
