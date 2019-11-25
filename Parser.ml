
open Data

exception ParseError of string

let parse tokens = AST

let try_open tokens = OpenDef
let try_let tokens = LetDef

let check_module_item tokens =
    match tokens with
    | Symbol "open" :: rest -> `OpenDef rest
    | Symbol "let" :: rest -> `LetDef rest
    | _ -> raise (ParseError "unexpected module item")

let try_module_item tokens =
    match check_module_item tokens with
    | `OpenDef rest -> 5
    | `LetDef rest -> 5
    | _ -> raise (ParseError "encountered unknown module item")
        

let expect_module tokens = 
    match tokens with 
    | Symbol "mod" :: Symbol name :: LCurl :: rest -> 5
        
    | _ -> raise (ParseError "expected mod")


