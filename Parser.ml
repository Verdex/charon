
open Data

exception ParseError of string


let parse tokens = AST


let rec expect_module tokens = 
    match tokens with 
    | Symbol "mod" :: rest -> rest

