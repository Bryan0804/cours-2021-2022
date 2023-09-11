
--QUESTION 1.1

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
		FETCH emp INTO s;
		EXIT WHEN NOT FOUND;
		sm:=sm+s;
	END LOOP;
END;
$$ LANGUAGE plpgsql;

/*
CREATE or REPLACE FUNCTION somme_salaire
(out sm money)AS
$$
DECLARE 
	--s money;
	emp CURSOR FOR  
	SELECT Empgrade, Empsalaire FROM EMPLOYE
		GROUP BY Empgrade,Empsalaire;
BEGIN 
	sm:=0;
	OPEN emp;
	FETCH emp;
	CLOSE emp INTO sm;

END;
$$ LANGUAGE plpsql;
*/
