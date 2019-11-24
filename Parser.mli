
open Data

exception ParseError of string

val parse : [token] -> ast

