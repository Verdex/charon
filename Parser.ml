
open Data

exception ParseError of string

let (|>) a b = b a 

let expect_open_def tokens = 
    match tokens with 
    | Symbol n :: SemiColon :: rest -> (`OpenDef n, rest)
    | _ -> raise (ParseError "open def parse failed")

let expect_param_list tokens = 
    let rec pl tokens (params : string list) =
        match tokens with
        | Symbol n :: rest -> pl rest (n :: params)
        | Equal :: rest -> (params, rest)
        | _ -> raise (ParseError "unexpected token in expect param list")
    in
    pl tokens []

let expect_let_def tokens = 
    let (params, p_r) = expect_param_list tokens in 
    (* zero params is an exception
       one param is a value assignment
       multiple params is a function definition
    *)

let check_module_item tokens =
    match tokens with
    | Symbol "open" :: rest -> `OpenDef rest
    | Symbol "let" :: rest -> `LetDef rest
    | _ -> raise (ParseError "unexpected module item")

let try_module_item tokens =
    match check_module_item tokens with
    | `OpenDef rest -> expect_open_def rest
    | `LetDef rest -> expect_let_def rest 
    | _ -> raise (ParseError "encountered unknown module item")

let expect_module tokens = 
    let rec try_module_items tokens 
                             (ods : [`OpenDef of string] list) 
                             (lds : [`LetDef] list) = 
        match try_module_item tokens with
        | (`OpenDef _ as od, RCurl :: rest) -> (od :: ods, lds, rest)
        | (`LetDef as ld, RCurl :: rest) -> (ods, ld :: lds, rest)
        | (`OpenDef _ as od, rest) -> try_module_items rest (od :: ods) lds
        | (`LetDef as ld, rest) -> try_module_items rest ods (ld :: lds) 
    in

    let (name, (ods, lds, rest)) = match tokens with 
    | Symbol "mod" :: Symbol name :: LCurl :: rest ->
        (name, try_module_items rest [] [])
    | _ -> raise (ParseError "expected mod")
    in

    (Module { name = name; opens = ods; lets = lds }, rest)


let parse tokens = 
    let (m, _) = expect_module tokens in
    m
