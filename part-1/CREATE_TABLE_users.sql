-- create table users
CREATE TABLE users (
  user_id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  email TEXT NOT NULL UNIQUE
);

-- insert data
INSERT INTO users (first_name, last_name, email)
VALUES ('John', 'Doe', 'jhondoe@example.com'),
       ('Jane', 'Doe', 'janedoe@example.com');

-- select data
SELECT * FROM users;

