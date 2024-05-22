--Create tables
CREATE TABLE Expansion (
    expansion_id INTEGER PRIMARY KEY,
    name_de TEXT NOT NULL,
    name_en TEXT NOT NULL,
    name_jp TEXT NOT NULL,
    release_date TEXT,
    cards_in_expansion INTEGER
);


CREATE INDEX idx_expansion_name_de ON Expansion(name_de);
CREATE INDEX idx_expansion_name_en ON Expansion(name_en);

CREATE TABLE Card (
    card_id INTEGER PRIMARY KEY,
    name_de TEXT NOT NULL,
    name_en TEXT NOT NULL,
    condition TEXT,
    imgpath TEXT,
    rarity TEXT,
    number_in_expansion INTEGER,
    language TEXT,
    name_jp TEXT,
    expansion_id INTEGER,
    is_reverse_holo BOOLEAN NOT NULL DEFAULT 0,
    is_first_edition BOOLEAN NOT NULL DEFAULT 0,
    FOREIGN KEY (expansion_id) REFERENCES Expansion(expansion_id)
);

CREATE INDEX idx_card_name_de ON Card(name_de);
CREATE INDEX idx_card_name_en ON Card(name_en);
CREATE INDEX idx_card_expansion_id ON Card(expansion_id);


CREATE TABLE Pokemon (
    pokemon_id INTEGER PRIMARY KEY,
    pokedexno INTEGER NOT NULL,
    name_de TEXT NOT NULL,
    name_en TEXT NOT NULL
);

CREATE INDEX idx_pokemon_pokedexno ON Pokemon(pokedexno);
CREATE INDEX idx_pokemon_name_de ON Pokemon(name_de);
CREATE INDEX idx_pokemon_name_en ON Pokemon(name_en);


CREATE TABLE Comment (
    comment_id INTEGER PRIMARY KEY,
    content TEXT NOT NULL,
    creation_date TEXT
);


CREATE INDEX idx_comment_creation_date ON Comment(creation_date);


CREATE TABLE XCardPokemon (
    card_id INTEGER,
    pokemon_id INTEGER,
    PRIMARY KEY (card_id, pokemon_id),
    FOREIGN KEY (card_id) REFERENCES Card(card_id),
    FOREIGN KEY (pokemon_id) REFERENCES Pokemon(pokemon_id)
);


CREATE INDEX idx_xcardpokemon_card_id ON XCardPokemon(card_id);
CREATE INDEX idx_xcardpokemon_pokemon_id ON XCardPokemon(pokemon_id);


CREATE TABLE XCardComment (
    card_id INTEGER,
    comment_id INTEGER,
    PRIMARY KEY (card_id, comment_id),
    FOREIGN KEY (card_id) REFERENCES Card(card_id),
    FOREIGN KEY (comment_id) REFERENCES Comment(comment_id)
);

CREATE INDEX idx_xcardcomment_card_id ON XCardComment(card_id);
CREATE INDEX idx_xcardcomment_comment_id ON XCardComment(comment_id);



-- Select everything.

SELECT
    Card.card_id,
    Card.name_de AS card_name_de,
    Card.name_en AS card_name_en,
    Card.condition,
    Card.imgpath,
    Card.rarity,
    Card.number_in_expansion,
    Card.language,
    Card.name_jp AS card_name_jp,
    Card.is_reverse_holo,
    Card.is_first_edition,
    Expansion.expansion_id,
    Expansion.name_de AS expansion_name_de,
    Expansion.name_en AS expansion_name_en,
    Expansion.name_jp AS expansion_name_jp,
    Expansion.release_date,
    Expansion.cards_in_expansion,
    Pokemon.pokemon_id,
    Pokemon.pokedexno,
    Pokemon.name_de AS pokemon_name_de,
    Pokemon.name_en AS pokemon_name_en,
    Comment.comment_id,
    Comment.content,
    Comment.creation_date
FROM
    Card
    LEFT JOIN Expansion ON Card.expansion_id = Expansion.expansion_id
    LEFT JOIN XCardPokemon ON Card.card_id = XCardPokemon.card_id
    LEFT JOIN Pokemon ON XCardPokemon.pokemon_id = Pokemon.pokemon_id
    LEFT JOIN XCardComment ON Card.card_id = XCardComment.card_id
    LEFT JOIN Comment ON XCardComment.comment_id = Comment.comment_id;

