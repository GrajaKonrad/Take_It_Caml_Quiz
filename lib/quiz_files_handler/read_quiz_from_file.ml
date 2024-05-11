(* read_quiz_from_file.ml *)
(* struktura do przechowywania danych pojedyńczego zapytania *)
type question = {
  question_text : string;
  correct_answer : string;
  wrong_answers : string list;
}

let read_questions_from_file filename =
  let file_channel = open_in filename in
  let rec read_questions acc =
    try
      let line = input_line file_channel in
      match String.split_on_char ';' line with
      | question_text:: correct_answer:: wrong_answer ->
          let question = {
            question_text = question_text;
            correct_answer = correct_answer;
            wrong_answers = wrong_answer;
          } in
          read_questions (question :: acc)
      | _ -> read_questions acc
    with End_of_file ->
      close_in file_channel;
      List.rev acc
  in
  read_questions []

let () =
  let questions = read_questions_from_file "questions.txt" in
  List.iter (fun q ->
    Printf.printf "Question: %s\nCorrect answer: %s\nWrong answers: %s\n\n"
      q.question_text q.correct_answer (String.concat ", " q.wrong_answers)
  ) questions
