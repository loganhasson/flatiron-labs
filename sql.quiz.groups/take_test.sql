-- Create a take_test.sql for each user that multi inserts their answers for.

-- Every user has taken both quizzes and answered all questions.

-- User 1 has gotten a perfect
-- User 2 has answer 3/5 correct.
-- User 3 has answered 1/5 correct.

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