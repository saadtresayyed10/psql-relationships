CREATE DATABASE onetoone;

\c onetoone;

CREATE TABLE users (
    userid SERIAL PRIMARY KEY,
    username VARCHAR(30),
    email VARCHAR(50) UNIQUE
);

CREATE TABLE goals (
    goalid SERIAL PRIMARY KEY,
    goalname VARCHAR(30),
    user_id INT REFERENCES users (id),
    UNIQUE(user_id)
);

INSERT INTO users (username, email) VALUES 
('Saad','saad@gmail.com'), 
('Ayman','ayman@gmail.com'), 
('Amaan','amaan@gmail.com');

INSERT INTO goals (goalname, user_id) VALUES 
('Goal-1', 1),
('Goal-2', 2),
('Goal-3', 3),
('Goal-4', 4);

SELECT username, email FROM users
JOIN goals ON goals.user_id = users.userid;