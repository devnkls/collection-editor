const sqlite3 = require("sqlite3").verbose();
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

// Connection can be run by entering "node express.js" in the terminal