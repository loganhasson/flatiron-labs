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