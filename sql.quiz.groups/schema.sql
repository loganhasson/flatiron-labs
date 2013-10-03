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