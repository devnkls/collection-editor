
INSERT INTO Expansion (expansion_id, name_de, name_en, name_jp, release_date, cards_in_expansion)
VALUES 
(1, 'Basis Set', 'Base Set', 'ベースセット', '1999-01-09', 102),
(2, 'Dschungel', 'Jungle', 'ジャングル', '1999-06-16', 64);


INSERT INTO Card (card_id, name_de, name_en, condition, imgpath, rarity, number_in_expansion, language, name_jp, expansion_id, is_reverse_holo, is_first_edition)
VALUES 
(1, 'Glurak', 'Charizard', 'Mint', '/path/to/img1.png', 'Rare', 4, 'Deutsch', 'リザードン', 1, 0, 1),
(2, 'Pikachu', 'Pikachu', 'Good', '/path/to/img2.png', 'Common', 25, 'Englisch', 'ピカチュウ', 2, 1, 0);


INSERT INTO Pokemon (pokemon_id, pokedexno, name_de, name_en)
VALUES 
(1, 6, 'Glurak', 'Charizard'),
(2, 25, 'Pikachu', 'Pikachu');


INSERT INTO Comment (comment_id, content, creation_date)
VALUES 
(1, 'Diese Karte ist in einem ausgezeichneten Zustand!', '2024-05-22'),
(2, 'Diese Karte hat einige Abnutzungserscheinungen.', '2024-05-22');


INSERT INTO XCardPokemon (card_id, pokemon_id)
VALUES 
(1, 1),
(2, 2);


INSERT INTO XCardComment (card_id, comment_id)
VALUES 
(1, 1),
(2, 2);