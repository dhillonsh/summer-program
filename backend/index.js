// server/index.js
const sanitize_input = require('./helper');

const express = require("express");
const cors = require("cors");
const bodyParser = require('body-parser');

const PORT = process.env.PORT || 3001;
const app = express();
app.use(bodyParser.urlencoded({ extended: true }));

const corsOption = {
    origin: ['http://localhost:3000'],
};
app.use(cors(corsOption));

/* Database */
const sqlite3 = require('sqlite3').verbose();
const db = new sqlite3.Database('database.sqlite3');

// TODO: move this to a separate database.js
db.serialize(() => {
    db.run("CREATE TABLE IF NOT EXISTS users (UserId INTEGER PRIMARY KEY, username TEXT NOT NULL UNIQUE, password TEXT NOT NULL)");
});
//db.close();
/* Databsae */

app.post("/register", (req, res) => {
    console.log('Got body:', req.body);

    // TODO: do validation and sanitization on username and password
    //   not too long, not too short, invalid characters
    
    username = sanitize_input(req.body.username)
    password = req.body.password

    // TODO: make sure that the username doesn't already exist

    db.run("INSERT INTO users (username, password) VALUES ('" + username +"', '" + password +"')");

    res.redirect('http://localhost:3000');
});

app.get("/testWorks", (req, res) => {
    res.redirect('http://localhost:3000?testWorks');
});

app.listen(PORT, () => {
  console.log(`Server listening on ${PORT}`);
});
