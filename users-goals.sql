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