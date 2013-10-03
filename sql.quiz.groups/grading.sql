-- Create a grading.sql that will grade each quiz for each user.

-- These should be using joins.

-- User 1

SELECT users.name,
       quizzes.name,
       COUNT(*) AS 'correct_count'

-- SELECT users.name, quizzes.name, COUNT(*) AS 'correct_count'
-- FROM (((((users JOIN answers ON users.id = answers.user_id) JOIN choices ON answers.choice_id = choices.id)) JOIN questions ON questions.id = choices.question_id))) JOIN quizzes ON quizzes.id = questions.quiz_id)))) ON choices.correct = 1)))))
FROM users, quizzes, answers, choices, questions

WHERE users.id            = answers.user_id         
  AND answers.choice_id   = choices.id     
  AND choices.question_id = questions.id 
  AND questions.quiz_id   = quizzes.id     
  AND choices.correct     = 1

GROUP BY users.id, quizzes.id;
 
-- User 2

SELECT users.name,
       quizzes.name,
       COUNT(*) AS 'correct_count'

FROM users, quizzes, answers, choices, questions

WHERE users.id            = answers.user_id         
  AND answers.choice_id   = choices.id     
  AND choices.question_id = questions.id 
  AND questions.quiz_id   = quizzes.id     
  AND choices.correct     = 1

GROUP BY users.id, quizzes.id;

-- User 3

SELECT users.name,
       quizzes.name,
       COUNT(*) AS 'correct_count'

FROM users, quizzes, answers, choices, questions

WHERE users.id            = answers.user_id         
  AND answers.choice_id   = choices.id     
  AND choices.question_id = questions.id 
  AND questions.quiz_id   = quizzes.id     
  AND choices.correct     = 1

GROUP BY users.id, quizzes.id;