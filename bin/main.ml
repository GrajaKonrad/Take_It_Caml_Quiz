open Printf

let () =
    Sys.getcwd() ^ QuizLib.QuizFilesHandler.directory |> print_endline;
    QuizLib.QuizFilesHandler.get_quiz_list |>
    QuizLib.QuizFilesHandler.printable_quiz_list |>
    List.iter(printf "%s\n");