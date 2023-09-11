DROP TABLE IF EXISTS projection ;
DROP TABLE IF EXISTS cinema ;
DROP TABLE IF EXISTS jouer ;
DROP TABLE IF EXISTS film ;
DROP TABLE IF EXISTS personne ;

\i creer_table_personne.sql
\i creer_table_film.sql
\i creer_table_jouer.sql
\i creer_table_cinema.sql
\i creer_table_projection.sql
	
\copy personne FROM personne.txt
\copy film FROM film.txt
\copy jouer FROM jouer.txt
\copy cinema FROM cinema.txt
\copy projection FROM projection.txt
