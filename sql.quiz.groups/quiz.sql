-- Create a quiz.sql that will load all questions in a quiz.


-- QUIZ #1
SELECT questions.content, choices.content
FROM
  questions, choices
WHERE
  questions.id = choices.question_id AND questions.quiz_id = 1;

-- QUIZ #2
SELECT questions.content, choices.content
FROM
  questions, choices
WHERE
  questions.id = choices.question_id AND questions.quiz_id = 2;