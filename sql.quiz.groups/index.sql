CREATE INDEX answers_user_id_idx ON answers (user_id);
CREATE INDEX answers_choice_id_idx ON answers (choice_id);
CREATE INDEX choices_question_id_idx ON choices (question_id);
CREATE INDEX questions_quiz_id_idx ON questions (quiz_id);
CREATE INDEX choices_correct_idx ON choices (correct);