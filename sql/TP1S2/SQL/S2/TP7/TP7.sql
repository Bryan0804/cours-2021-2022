CREATE or REPLACE TABLE m_envoyes(
	numero serial,
	message text,
	expediteur name,
	destinataire name,
	date_envoie timestamp,
	DEFAULT
		current_timestamp
	);

CREATE or REPLACE TABLE m_recus(
	numero serial,
	message text,
	expediteur name,
	destinataire name,
	date_envoie timestamp
	DEFAULT
		current_timestamp
	);
	
CREATE function post(
		destinataire varchar,
		message text)
returns boolean as 
$$
DECLARE 

$$ language plpgsql
	SECURITY DEFINER
	
	
	
	
RETURNS BOOLEAN
AS $$
DECLARE
    expediteur INTEGER;
    message text;
BEGIN

    SELECT id INTO expediteur FROM utilisateurs WHERE nom_utilisateur = expediteur_username;
    IF sender_id IS NULL THEN
        RETURN FALSE;
    END IF;
    
    SELECT id INTO expediteur FROM utilisateurs WHERE nom_utilisateur = expediteur_username;
    IF recipient_id IS NULL THEN
        RETURN FALSE;
    END IF;
    
    INSERT INTO m_envoyes (expediteur, destinataire, message text) VALUES (expediteur, destinataire, message text);
    
    INSERT INTO
    
    RETURN TRUE;
END;
$$ LANGUAGE plpgsql;
