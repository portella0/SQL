--exercicio 1
SELECT to_char(current_timestamp, 'DD-MM-YYYY HH:MM:SS') AS Data

--exercicio 2
SELECT LOWER(SUBSTR(nomeempregado,1,4)) FROM empregado

--exercicio 3
SELECT CONCAT(nomeempregado, cargo)  NomeCargo1,
	   nomeempregado || cargo AS NomeCargo2
	   FROM empregado
	   
--exercicio 4
SELECT to_char(dataadmissao+'8 hours'::interval, 'DD/MM/YYYY HH:MM:SS') FROM EMPREGADO;

