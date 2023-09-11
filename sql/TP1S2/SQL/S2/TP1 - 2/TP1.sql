/************
**  TP1   **
***********/

/** EXERCICE I **********************************
Question 1.1
CREATE or REPLACE function
	permute(inout a int,inout b int)
	AS
	$$
		SELECT b,a;
	$$
	LANGUAGE SQL;
	SELECT * FROM permute(2,6);

Question 1.2
CREATE or REPLACE FUNCTION arp (inout t int [],j int)
	AS
	$$
		SELECT
		CASE WHEN (t[j-1] > t[j])
		THEN
			t[1:j-2] || --partie 1 inchangee
			t[j] || t[j-1] --permutation
			|| t[j+1: array_upper(t,1)] --partie 2 inchangee
		ELSE
			t
		END;
	$$ LANGUAGE SQL;
	SELECT arp(ARRAY[10,20,30,90,50,60,70],5);
**/

/** EXERCICE II *********************************
WITH RECURSIVE pyramide(h) AS
	(SELECT 1 UNION SELECT h+1 FROM pyramide WHERE h<4)
SELECT repeat(' ', 4-h) || repeat('*',2*h-1) AS "Pyramide"
	FROM pyramide;
	
Question 2.1 et 2.2
\set N 5
WITH RECURSIVE
	etoile(i,e) AS
		(SELECT 1,'*' UNION SELECT i+1,e||'**'FROM etoile WHERE i<:N),
	blanc(i,b) AS
		(SELECT :N,' ' UNION SELECT i-1,b||'  'FROM blanc WHERE i>1)
SELECT b||e FROM etoile,blanc WHERE etoile.i=blanc.i;

Question 2.3
\set N 5
WITH RECURSIVE
	etoile(i,e) AS
		(SELECT 1,'*' UNION SELECT i+1,e||'**'FROM etoile WHERE i<:N),
	blanc(i,b) AS
		(SELECT :N,' ' UNION SELECT i-1,b||'  'FROM blanc WHERE i>1)
SELECT b||e FROM etoile,blanc WHERE etoile.i=blanc.i ORDER BY etoile DESC;
**/

/** EXERCICE III *********************************
CREATE FUNCTION nestedloop(int[],out i int, out j int)
	RETURNS SETOF record AS
	$$
	WITH RECURSIVE inl(k,f) AS
	(
		SELECT array_upper($1,1),2
		UNION
		SELECT k ,f+1
			FROM inl WHERE f<k
	),
	outl(i,j) AS
	(
		SELECT k,f FROM  inl
		UNION
		SELECT i-1, j
			FROM outl WHERE i>j
	)
	SELECT * FROM outl;
	$$ language SQL;
	
Question 3.1.1
CREATE OR REPLACE FUNCTION nestedloop(int[],out i int, out j int)
	RETURNS SETOF record AS
	$$
		WITH RECURSIVE
		inl(k,f)AS
			(SELECT array_upper($1,1),2 UNION SELECT k,f+1 FROM inl WHERE f<k),
		outl(i,j)AS
			(SELECT k,f FROM inl UNION SELECT i-1, j FROM outl WHERE i>j)
		SELECT*FROM outl;
	$$language SQL;
	
Question 3.2
**/
CREATE or REPLACE FUNCTION
	tribulle (inout t int [],j int) AS
	$$
		WITH RECURSIVE bulle()
		SELECT
		CASE WHEN (t[j-1] > t[j])
		THEN
			t[1:j-2] || --partie 1 inchangee
			t[j] || t[j-1] --permutation
			|| t[j+1: array_upper(t,1)] --partie 2 inchangee
		ELSE
			t
		END;
	$$ LANGUAGE SQL;
	SELECT arp(ARRAY[10,20,30,90,50,60,70],5);
