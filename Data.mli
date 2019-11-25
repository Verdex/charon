
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

type let_def = LetDef
type open_def = OpenDef

type mod_def = { name : string
               ; lets : let_def list
               ; opens : open_def list
               }

type ast = AST
    | Module of mod_def
