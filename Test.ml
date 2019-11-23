
open Data
open Lexer

exception TestError of string

let lex_inputer stuff = object
    val mutable _index = -1
    method move_next = 
        if _index < String.length stuff - 1 then begin
            _index <- _index + 1
            ; true
            end
        else 
            false
    method current = stuff.[_index]  
    method index = _index
    method look_ahead a = 
        if _index + a  < String.length stuff then
            Some stuff.[_index + a]
        else
            None
end

let basic_input = {|
    mod blah {
        open other;
        let x = 5;
        let z y = y "blah";
    }
|}

let run_basic =
    let tokens = lex (lex_inputer basic_input) in
    if (List.length tokens) = 0 then
        raise (TestError "run basic lexer failed")
    ;
    Printf.printf "%d tokens found\n" (List.length tokens)
    
;;

run_basic

