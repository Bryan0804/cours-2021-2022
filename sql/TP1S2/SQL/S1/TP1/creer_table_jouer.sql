CREATE TABLE jouer
(
	id_acteur INTEGER REFERENCES personne(id_personne),
	id_film INTEGER REFERENCES film,
	role VARCHAR,
	PRIMARY KEY (id_acteur, id_film)	
) ;
