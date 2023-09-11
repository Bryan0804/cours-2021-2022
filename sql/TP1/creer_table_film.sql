CREATE TABLE film
(
	id_film INTEGER PRIMARY KEY,
	id_realisateur INTEGER REFERENCES personne(id_personne), 
	titre VARCHAR,
	genre VARCHAR,
	annee INTEGER
) ;
