/*

Question 2.1
CREATE or replace FUNCTION fact_rec(int)
returns int as
$$
select 
	case WHEN $1=1 THEN 1
		ELSE $1*fact_rec($1-1)
	END;
$$ language SQL;


Question 2.2
CREATE or replace FUNCTION fact_ect(int)
returns int as
$$
	WITH RECURSIVE fact(i,f) AS
		(
			SELECT 1, 1
			UNION
			SELECT i+1, f*(i+1)
				FROM fact
				WHERE 1 < $1
		)
		SELECT f
		FROM fact WHERE i=$1;
$$ language SQL;


Question 2.3
CREATE or replace FUNCTION fact_pl(n integer)
returns integer AS
$$
	DECLARE
		ret int :=1;
	BEGIN
		FOR num in 2..n LOOP
			ret :=ret*num;
		END LOOP;
		RETURN ret;
		END;
$$ language plpgsql;

CREATE TABLE fact_cache(
	num integer PRIMARY KEY,
	fact integer NOT NULL
	);
*/
CREATE or replace FUNCTION fact_cache(n integer)
returns integer AS
$$
	DECLARE
		ret int :=1;
	BEGIN
		FOR num in 2..n LOOP
			ret :=ret*num;
		END LOOP;
		RETURN ret;
		END;
$$ language plpgsql;

