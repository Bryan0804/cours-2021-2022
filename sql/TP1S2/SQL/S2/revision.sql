CREATE or REPLACE FUNCTION somme (t int [])	
	RETURNS AS
	$$
		SELECT
		CASE
			WHEN (t[j-1] > t[j])
		THEN
			t[1:j-2] || --partie 1 inchangee
			t[j] || t[j-1] --permutation
			|| t[j+1: array_upper(t,1)] --partie 2 inchangee
		ELSE
			t
		END;
	$$ LANGUAGE SQL;
	SELECT arp(ARRAY[1,2,3,4]);