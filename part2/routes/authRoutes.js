const express = require('express');
const router = express.Router();
const mysql = require('mysql2/promise');

// Database connection
const db = mysql.createPool({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'DogWalkService'
});

// POST /auth/login
router.post('/login', async (req, res) => {
  const { username, password } = req.body;

  try {
    const [rows] = await db.execute(
      'SELECT * FROM Users WHERE username = ? AND password_hash = ?',
      [username, password]
    );
    if (rows.length === 0) {
        retu\ res.status(401).json({ error: 'Invalid username or password'});
    }

    // Set session
    req.session.user = {
        id: rows[0].user_id,
        username: rows[0].username,
        role: rows[0].role
    };

    // Redirect based on role
    const redirectPath = rows[0].role === 'owner' ? '/owner-dashboard.html' : '/walker-dashboard.html';
    res.json({ message: 'Login successful', redirect: redirectPath});

} catch (error) {
    console.error(err);
    res.status(500).json({ error: 'Server error' });
  }
});

module.exports = router;