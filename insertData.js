//require("./db");


/*
const db = require("./server");

function insertRow() {
  const [expansion_id, name_de, name_en, name_jp, release_date, cards_in_expansion] = process.argv.slice(2);
  db.run( //sql statement
    `INSERT INTO Expansion (expansion_id, name_de, name_en, name_jp, release_date, cards_in_expansion) VALUES (?, ?, ?, ?, ?, ?)`,
    [expansion_id, name_de, name_en, name_jp, release_date, cards_in_expansion],
    function (error) {
      if (error) {
        console.error(error.message);
      }
      console.log(`Inserted a row with the ID: ${this.lastID}`);
    }
  );
}

insertRow(); // call function

*/
/*
const createDbConnection = require("./server"); // Correct the path here
const db = createDbConnection();

function insertRow() {
  const [expansion_id, name_de, name_en, name_jp, release_date, cards_in_expansion] = process.argv.slice(2);
  db.run(
    `INSERT INTO Expansion (expansion_id, name_de, name_en, name_jp, release_date, cards_in_expansion) VALUES (?, ?, ?, ?, ?, ?)`,
    [expansion_id, name_de, name_en, name_jp, release_date, cards_in_expansion],
    function (error) {
      if (error) {
        console.error(error.message);
      } else {
        console.log(`Inserted a row with the ID: ${this.lastID}`);
      }
    }
  );
}

insertRow();
*/





document.addEventListener("DOMContentLoaded", function() {
  document.getElementById("btn_add_card").addEventListener("click", function() {
    alert("oh snap, i was clicked...");
  });
});