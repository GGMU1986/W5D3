PRAGMA foreign_keys = ON;

CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL
);

CREATE TABLE questions(
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    user_id INTEGER NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE question_follows (
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL
);

CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL,
    parent_id INTEGER,
    user_id INTEGER NOT NULL,
    body TEXT NOT NULL,

    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (parent_id) REFERENCES replies(id)
);

CREATE TABLE question_likes (
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES question(id)
);

INSERT INTO
    users(fname, lname)
VALUES
    ('George', 'Tsimis')
    ('Sohee', 'Park')
    ('Super', 'Man');

INSERT INTO
    questions(title, body, user_id)
VALUES
    ('Got Snacks?', 'What are the snacks that we are going to eat tonight?', (SELECT id FROM users WHERE lname = 'Tsimis')),
    ('Where are we going?', 'Where are we going this weekend?', (SELECT id FROM users WHERE lname = 'Park')),
    ('Kryptonite?', 'Is there any Kryptonite in this auditorium?', (SELECT id from users WHERE lanme = 'Man'));

INSERT INTO
    replies(question_id, parent_id, user_id, body)
VALUES
    ((SELECT id FROM questions WHERE title = 'Got Snacks?'), (SELECT id FROM users WHERE lname = 'Park'), 'Snacks for tonight are pizza, hot wings, and popcorn'),
    ((SELECT id FROM questions WHERE title = 'Where are we going?'), (SELECT id FROM users WHERE lname = 'Man'), 'We are going hiking'),
    ((SELECT id FROM questions WHERE title = 'Kryptonite?'), (SELECT id FROM users WHERE lname = 'Tsimis'), 'Yes, there is'),
    ((SELECT id FROM questions WHERE title = 'Got Snacks?'), (SELECT id FROM users WHERE lname = 'Man'), 'That is a whole meal')

