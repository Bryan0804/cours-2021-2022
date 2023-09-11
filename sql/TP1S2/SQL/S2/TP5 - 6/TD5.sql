/*CREATE table EMPLOYE
(
	Empid int,
	Empnom varchar(30),
	Empgrade int,
	Empsalaire money,
		primary key (empid)
);
QUESTION 1.1

CREATE or REPLACE FUNCTION somme_salaire
(out sm money)AS
$$
DECLARE
	s money;
	emp CURSOR FOR
	SELECT Empsalaire FROM EMPLOYE;
BEGIN
	sm:=0;
	OPEN emp;
	LOOP
		FETCH emp INTO s;  FETCH emp lire s=valeur
		EXIT WHEN NOT FOUND;
		sm:=sm+s;
	END LOOP;
END;
$$ LANGUAGE plpgsql;
*/
CREATE or REPLACE FUNCTION sgrade_salaire
(out grade int,out msg money)
RETURNS SETOF RECORD AS
$$
DECLARE
BEGIN
	RETURN NEXT;
END;
$$ LANGUAGE plpgsql;

