
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

type expr = Expr

type let_def = { name : string
               ; value : expr
               }

type fun_def = { name : string
               ; value : expr
               }

type mod_def = { name : string
               ; lets : [ `LetDef of let_def ] list
               ; funs : [ `FunDef of fun_def ] list
               ; opens : [ `OpenDef of string ] list
               }


type ast = AST
    | Module of mod_def
    
