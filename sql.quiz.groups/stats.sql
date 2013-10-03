-- Create a stats.sql that will show the percentage or total right answers.

-- Do percentage if you want to try to use MATH functions within SQL This will need to use joins too and might get complicated.

SELECT users.name,
       quizzes.name,
       ((COUNT(*)*100/5) || '%') AS 'percent_correct'

FROM users, quizzes, answers, choices, questions

WHERE users.id            = answers.user_id         
  AND answers.choice_id   = choices.id     
  AND choices.question_id = questions.id 
  AND questions.quiz_id   = quizzes.id     
  AND choices.correct     = 1

GROUP BY users.id, quizzes.id;