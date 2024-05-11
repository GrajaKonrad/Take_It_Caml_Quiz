open Printf
open Stdlib

let () =
    ignore (Sys.command "clear");
    let quiz_number = ref(-1) in
    let quiz_list = QuizLib.QuizFilesHandler.get_quiz_list in
    while !quiz_number < 1 || !quiz_number > (List.length quiz_list) do
        print_endline "Dostępne quizy: \n";

        (* Sekwencja do uzyskiwania i pobierania listy dostępnych quizów [String List] i wypisania ich na wyjściu dla użytkownika *)
        QuizLib.QuizFilesHandler.printable_quiz_list quiz_list |>
        List.iter(printf "%s\n");
        
        print_string "\nWybierz numer quizu: ";
        try
            quiz_number := Stdlib.read_int();
            ignore (Sys.command "clear");
        with
            | Failure _ ->
                ignore (Sys.command "clear");
                print_endline "Podaj numer quizu !\n";
                quiz_number := -1
    done
