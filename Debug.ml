
open Data

let show_token t = 
    match t with
    | String v -> Printf.sprintf "'%s'" v
    | Number n -> Printf.sprintf "%s" n
    | Symbol n -> Printf.sprintf "Symbol %s" n
    | RParen -> ")"
    | LParen -> "("
    | RCurl -> "}"
    | LCurl -> "{"
    | Orbar -> "|"
    | Colon -> ":"
    | SemiColon -> ";"
    | RAngle -> ">"
    | LAngle -> "<"
    | Comma -> ","
    | RightArrow -> "->"
    | Equal -> "="
