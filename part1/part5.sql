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
((SELECT dog_id FROM Dogs WHERE name = 'Max' AND owner_id = (SELECT user_id FROM Users WHERE username = 'alice123')),
'2025-06-10 08:00:00', 30, 'Parklands', 'open'),
((SELECT dog_id FROM Dogs WHERE name = 'Bella' AND owner_id = (SELECT user_id FROM Users WHERE username = 'carol123')),
'2025-06-10 09:30:00', 45, 'Beachside Ave', 'accepted'),
((SELECT dog_id FROM Dogs WHERE name = 'Ben' AND owner_id = (SELECT user_id FROM Users WHERE username = 'samrudge')),
'2025-06-20 14:30:00', 60, 'Adelaide', 'open'),
((SELECT dog_id FROM Dogs WHERE name = 'Charlie' AND owner_id = (SELECT user_id FROM Users WHERE username = 'alice123')),
'2025-06-19 17:15:00', 90, 'Prospect', 'cancelled'),
((SELECT dog_id FROM Dogs WHERE name = 'Luna' AND owner_id = (SELECT user_id FROM Users WHERE username = 'samrudge')),
'2025-06-19 17:15:00', 15, 'Rundle', 'accepted'),