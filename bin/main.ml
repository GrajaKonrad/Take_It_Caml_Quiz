open Printf
open Stdlib

(* Przechowuje numer wybranego quizu, ustawiony jako referencja ze wzgledu na funkcje read_int *)
let quiz_number = ref(-1);;

(* Przechowuje listę dostępnych quizów *)
let quiz_list = QuizLib.QuizFilesHandler.get_quiz_list;;

let _ =
    ignore (Sys.command "clear");
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
    done in

    (* Sekwencja do uzyskiwania i pobierania listy pytań z pliku quizu [QuizLib.Question List] i wypisania ich na wyjściu dla użytkownika *)
    let quiz_questions = QuizLib.QuizFilesReader.read_questions_from_file (QuizLib.QuizFilesHandler.get_quiz_dir ^ List.nth quiz_list (!quiz_number - 1)) in
    QuizLib.QuizFilesReader.print_questions quiz_questions;
    print_endline "Wciśnij dowolny klawisz aby kontynuować...";
 