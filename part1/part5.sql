INSERT INTO Users (username, email, password_hash, role) VALUES

('alice123', 'alice@example.com', 'hashed123', 'owner'),
('bobwalker', 'bob@example.com', 'hashed456', 'walker'),
('carol123', 'carol@example.com', 'hashed789', 'owner'),
('samrudge', 'sam_rudge@gmail,com', 'hashed000', 'owner'),
('tommartindal', 'tom@yahoo.com', 'hashed111', 'walker');


INSERT INTO Dogs (owner_id, name, size) VALUES

((SELECT user_id FROM Users WHERE username = 'alice123'), 'Max', 'medium'),
((SELECT user_id FROM Users WHERE username = 'carol123'), 'Bella', 'small'),
((SELECT user_id FROM Users WHERE username = 'samrudge'), 'Luna', 'medium'),
((SELECT user_id FROM Users WHERE username = 'samrudge'), 'Ben', 'large'),
((SELECT user_id FROM Users WHERE username = 'alice123'), 'Chalie', 'small');


INSERT INTO WalkRequests (dog_id, requested_time, duration_minutes, location, status) VALUES