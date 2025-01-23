CREATE DATABASE onetomany;

\c onetomany;

CREATE TABLE users (
    userid SERIAL PRIMARY KEY,
    username VARCHAR(30),
    email VARCHAR(50) UNIQUE
);

CREATE TABLE goals (
    goalid SERIAL PRIMARY KEY,
    goalname VARCHAR(30),
    user_id INT REFERENCES users (userid)
);

INSERT INTO users (username, email) VALUES 
('Saad','saad@gmail.com'), 
('Ayman','ayman@gmail.com'), 
('Amaan','amaan@gmail.com');

INSERT INTO goals (goalname, user_id) VALUES 
('Goal-1', 1),
('Goal-2', 1),
('Goal-3', 1),
('Goal-4', 2),
('Goal-5', 2),
('Goal-6', 3);

SELECT * FROM users;
=>
    userid | username |      email
    --------+----------+-----------------
        1 | Saad     | saad@gmail.com
        2 | Ayman    | ayman@gmail.com
        3 | Amaan    | amaan@gmail.com
    (3 rows)

SELECT * FROM goals;
=>
    goalid | goalname | user_id
    --------+----------+---------
        1 | Goal-1   |       1
        2 | Goal-2   |       1
        3 | Goal-3   |       1
        4 | Goal-4   |       2
        5 | Goal-5   |       2
        6 | Goal-6   |       3
    (6 rows)

SELECT username, goalname, email  FROM users
JOIN goals ON goals.user_id = users.userid;
=>
    username | goalname |      email
    ----------+----------+-----------------
    Saad     | Goal-1   | saad@gmail.com
    Saad     | Goal-2   | saad@gmail.com
    Saad     | Goal-3   | saad@gmail.com
    Ayman    | Goal-4   | ayman@gmail.com
    Ayman    | Goal-5   | ayman@gmail.com
    Amaan    | Goal-6   | amaan@gmail.com
    (6 rows)