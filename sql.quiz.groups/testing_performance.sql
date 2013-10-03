DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS quizzes;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS choices;
DROP TABLE IF EXISTS answers;

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  name TEXT
);

CREATE TABLE quizzes (
  id INTEGER PRIMARY KEY,
  name TEXT
);

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  quiz_id INTEGER,
  content TEXT
);

CREATE TABLE choices (
  id INTEGER PRIMARY KEY,
  question_id INTEGER,
  content TEXT,
  correct INTEGER
);

CREATE TABLE answers (
  id INTEGER PRIMARY KEY,
  user_id INTEGER,
  question_id INTEGER,
  choice_id INTEGER
);

--There should be 3 users.
--There should be 2 quizzes.
--Each quiz has 5 questions.
--Each question has 4 answers.

--Answers should be inserted into questions via a multi-insert.

DELETE FROM users;
INSERT INTO users (name) VALUES ("Tiffany Péon"),
                                ("Vinney Cavallo"),
                                ("Manuel Neuhauser"),
                                ("Logan Hasson");

DELETE FROM quizzes;
INSERT INTO quizzes (name) VALUES ("Gittin' It"),
                                  ("Ruby Awakening");

DELETE FROM questions;
INSERT INTO questions (quiz_id, content) VALUES
  (1, "What is the approximate age of the Earth (in years)?"),
  (1, "How many continents are there?"),
  (1, "What time is it?"),
  (1, "Who are you?"),
  (1, "How many other questions are on this quiz, aside from this one?"),
  (2, "What time is blue?"),
  (2, "Why am quiz?"),
  (2, "Who wrote this quiz?"),
  (2, "How many words are in this sentence?"),
  (2, "How many other questions are on this quiz, aside from this one?");

DELETE FROM choices;
INSERT INTO choices (question_id, content, correct) VALUES
  (1, "4,500,000,000", 1),
  (1, "0", 0),
  (1, "10,000", 0),
  (1, "-20", 0),
  (2, "1", 0),
  (2, "100", 0),
  (2, "7", 1),
  (2, "12", 0),
  (3, "soon", 0),
  (3, "later", 0),
  (3, "now", 1),
  (3, "then", 0),
  (4, "Me, silly!", 1),
  (4, "Nobody.", 0),
  (4, "You.", 0),
  (4, "Them.", 0),
  (5, "1", 0),
  (5, "2", 0),
  (5, "3", 0),
  (5, "4", 1),
  (6, "blue", 0),
  (6, "eleven", 0),
  (6, "elephant", 0),
  (6, "wtf?", 1),
  (7, "wtf?", 1),
  (7, "twelve", 0),
  (7, "hippo", 0),
  (7, "twelve hours in a half a day", 0),
  (8, "kitchen", 0),
  (8, "a maniac", 1),
  (8, "abe lincoln", 0),
  (8, "a different hippo", 0),
  (9, "7", 1),
  (9, "8", 0),
  (9, "0", 0),
  (9, "-5", 0),
  (10, "1", 0),
  (10, "2", 0),
  (10, "3", 0),
  (10, "4", 1);

-- Write an update.sql that will update user with id 1's name.

UPDATE users SET name = "Tiffaliff" WHERE id = 1;

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

-- Create an answers.sql that will load all answers for a question.

-- Question # 1
SELECT content FROM choices WHERE question_id = 1;

-- Question # 2
SELECT content FROM choices WHERE question_id = 2;

-- Question # 3
SELECT content FROM choices WHERE question_id = 3;

-- Question # 4
SELECT content FROM choices WHERE question_id = 4;

-- Question # 5
SELECT content FROM choices WHERE question_id = 5;

-- Question # 6
SELECT content FROM choices WHERE question_id = 6;

-- Question # 7
SELECT content FROM choices WHERE question_id = 7;

-- Question # 8
SELECT content FROM choices WHERE question_id = 8;

-- Question # 9
SELECT content FROM choices WHERE question_id = 9;

-- Question # 10
SELECT content FROM choices WHERE question_id = 10;

DELETE FROM answers;
INSERT INTO answers (user_id, question_id, choice_id) VALUES
  (1, 1, 1),
  (1, 2, 7),
  (1, 3, 11),
  (1, 4, 13),
  (1, 5, 20),
  (1, 6, 24),
  (1, 7, 25),
  (1, 8, 30),
  (1, 9, 33),
  (1, 10, 40),
  (2, 1, 1),
  (2, 2, 5),
  (2, 3, 11),
  (2, 4, 13),
  (2, 5, 20),
  (2, 6, 21),
  (2, 7, 26),
  (2, 8, 30),
  (2, 9, 33),
  (2, 10, 39),
  (3, 1, 1),
  (3, 2, 6),
  (3, 3, 10),
  (3, 4, 14),
  (3, 5, 19),
  (3, 6, 22),
  (3, 7, 27),
  (3, 8, 31),
  (3, 9, 35),
  (3, 10, 40);

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

-- Create a stats.sql that will show the percentage or total right answers.

-- Do percentage if you want to try to use MATH functions within SQL This will need to use joins too and might get complicated.

EXPLAIN SELECT users.name,
       quizzes.name,
       ((COUNT(*)*100/5) || '%') AS 'percent_correct'

FROM users, quizzes, answers, choices, questions

WHERE users.id            = answers.user_id         
  AND answers.choice_id   = choices.id     
  AND choices.question_id = questions.id 
  AND questions.quiz_id   = quizzes.id     
  AND choices.correct     = 1

GROUP BY users.id, quizzes.id;