(* read_quiz_from_file.mli *)
(* struktura do przechowywania danych pojedyńczego zapytania *)
type question = {
  question_text : string;
  correct_answer : string;
  wrong_answers : string list;
}

(** [read_questions_from_file filename] wczytuje pytania z pliku o nazwie [filename]
    i zwraca je jako listę struktur typu [question]. *)
val read_questions_from_file : string -> question list
