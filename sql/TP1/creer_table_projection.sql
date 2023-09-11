CREATE TABLE projection
(
	id_cinema INTEGER REFERENCES cinema,
	id_film INTEGER REFERENCES film,
	jour DATE,
	PRIMARY KEY (id_cinema, id_film, jour)
) ;
