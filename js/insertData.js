const db = require("./db");

function insertRow() {
  const [expansion_id, name_de, name_en, name_jp, release_date, cards_in_expansion] = process.argv.slice(2);
  db.run(
    `INSERT INTO Expansion (expansion_id, name_de, name_en, name_jp, release_date, cards_in_expansion] VALUES (?, ?, ?, ?, ?, ?)`,
    [expansion_id, name_de, name_en, name_jp, release_date, cards_in_expansion],
    function (error) {
      if (error) {
        console.error(error.message);
      }
      console.log(`Inserted a row with the ID: ${this.lastID}`);
    }
  );
}