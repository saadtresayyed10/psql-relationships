CREATE DATABASE manytomany;

\c manytomany;

CREATE TABLE users (
    userid SERIAL PRIMARY KEY,
    username VARCHAR(30),
    email VARCHAR(50) UNIQUE
);

CREATE TABLE goals (
    goalid SERIAL PRIMARY KEY,
    goalname VARCHAR(30)
);

CREATE TABLE users_goals (
    user_id INT REFERENCES users(userid),
    goal_id INT REFERENCES goals(goalid),
    PRIMARY KEY(user_id, goal_id)
);

INSERT INTO users (username, email) VALUES 
('Saad','saad@gmail.com'), 
('Ayman','ayman@gmail.com'), 
('Amaan','amaan@gmail.com');

INSERT INTO goals (goalname) VALUES 
('Goal-1'),
('Goal-2'),
('Goal-3');

INSERT INTO users_goals VALUES 
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 2),
(2, 3),
(3, 3),
(3, 2),
(3, 1);

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
    goalid | goalname
    --------+----------
        1 | Goal-1
        2 | Goal-2
        3 | Goal-3
    (3 rows)

SELECT * FROM users_goals;
=>
    user_id | goal_id
    ---------+---------
        1 |       1
        1 |       2
        1 |       3
        2 |       1
        2 |       2
        2 |       3
        3 |       3
        3 |       2
        3 |       1
    (9 rows)

SELECT username, goalname FROM users_goals
JOIN users ON users_goals.user_id = users.userid
JOIN goals ON users_goals.goal_id = goals.goalid;
=>
    username | goalname
    ----------+----------
    Saad     | Goal-1
    Saad     | Goal-2
    Saad     | Goal-3
    Ayman    | Goal-1
    Ayman    | Goal-2
    Ayman    | Goal-3
    Amaan    | Goal-3
    Amaan    | Goal-2
    Amaan    | Goal-1
    (9 rows)