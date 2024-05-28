/*const sqlite3 = require("sqlite3").verbose();
const filepath = "./collection.db";

function createDbConnection() {
  const db = new sqlite3.Database(filepath, (error) => {
    if (error) {
      return console.error(error.message);
    }
    selectCards(db);
  });
  console.log("Connection with SQLite has been established");
  return db;
}

function selectCards(db) {
  db.exec(`
  SELECT *
  FROM Card;
`);
}

module.exports = createDbConnection();

// Connection can be run by entering "node server.js" in the terminal
*/

const express = require('express');
const path = require('path');
const sqlite3 = require('sqlite3').verbose();

const app = express();
const port = 3000;
const filepath = './collection.db';

// Serve static files from the 'frontend' directory
app.use(express.static(path.join(__dirname, 'frontend')));

// Database connection
function createDbConnection() {
  const db = new sqlite3.Database(filepath, (error) => {
    if (error) {
      return console.error(error.message);
    }
    console.log("Connection with SQLite has been established");
  });
  return db;
}

const db = createDbConnection();

app.get('/api/cards', (req, res) => {
  db.all('SELECT * FROM Card', [], (err, rows) => {
    if (err) {
      throw err;
    }
    res.json(rows);
  });
});

app.listen(port, () => {
  console.log(`Server running at http://localhost:${port}/`);
});

