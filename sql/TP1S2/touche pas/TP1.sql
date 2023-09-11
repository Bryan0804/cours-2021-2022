/**
			TP1
			
**/

----------- Exercice 1 

-- Question 1.1

CREATE or REPLACE function 
	permute (inout a int , inout b int )
 AS 
 $$
 	SELECT b,a; --
 	
 $$ language SQL;
 
 select * from permute (2 -- a
 			
 				,6 --b
 				 );
 
 
 -- Question 1.2
 
 CREATE OR replace FUNCTION arp(inout t int [],j int)
 AS
 $$
 	select t[array_lower(t,1):j-2] || t[j] || t[j-1] || t[j+1:array_upper(t,1)];
 	
 $$ language SQL;
 
select arp(ARRAY[10,20,30,90,60,70],5);
 
 
------------ Exercice 2

-- Question 2.1

\set N 5

WITH  RECURSIVE
etoile (i,e) AS 
( 

	SELECT 1, '*'
	UNION 
	SELECT i+ 1,e || '**'
		FROM etoile
		WHERE i < :N
)
,
blanc(i,b) AS 
(
	SELECT :N,''
	UNION 
	SELECT i- 1,b ||' '
		FROM blanc
		WHERE i >1
)

SELECT b||e 
 FROM etoile,blanc WHERE etoile.i=blanc.i ORDER BY 1 desc; 
 -- Pour inverser la pyramide il suffit de mettre ORDER BY 1 desc question 2.3 


--- Exercice 3 : 

---   Question 3.1

CREATE FUNCTIONnestedloop(int[],2outiint,outjint)<>>>>>>>>


































