
type token = 
    | String of string
    | Number of string
    | Symbol of string
    | RParen
    | LParen
    | RCurl
    | LCurl
    | Orbar
    | Colon
    | SemiColon
    | RAngle
    | LAngle
    | Comma
    | RightArrow 
    | Equal 

type mod_def = { name : string
               ; lets : [ `LetDef ] list
               ; opens : [ `OpenDef of string ] list
               }


type ast = AST
    | Module of mod_def
    
