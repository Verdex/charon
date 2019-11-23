
all: Data.cmi Lexer.cmx Parser.cmx Main.cmx
	ocamlopt -o charon Lexer.cmx Main.cmx

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

