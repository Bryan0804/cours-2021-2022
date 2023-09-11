	-- EXERCICE 2
		--QUESTION 2.1
	CREATE or replace FUNCTION fact_rec(int)
	 returns int as 
	 $$
	 Select case when($1=1)
	 	Then 1
	 	else $1*fact_rec($1-1)
	 	end; 	
	$$ language SQL;
	Select fact_rec(10);

		--QUESTION  2.2
	
	CREATE or REPLACE FUNCTION fact-ect(int)
	returns int as 
	$$
	WITH RECURSIVE fact(n,f) AS 
	(
			select 1, 1
			union 
			select i+1, f*(i+1)
					From fact
					where i < $1
				
	)
	Select f
	from fact where i=$1;
	$$ language SQL;


		--QUESTION 2.3
	
	CREATE OR REPLACE FUNCTION fact_pl(
				n integer )
	RETURNS integer AS 
	$$
		DECLARE 
			ret int :=1;
		BEGIN 	
			FOR num IN 2..n LOOP 
					ret := ret*num;
			END LOOP; 
			RETURN ret;
		END;
	$$ LANGUAGE plpgsql;
	
