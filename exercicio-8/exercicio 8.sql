--exercicio 1
SELECT idempregado,
	    nomeempregado,
	    extract (year from age(current_date, dataadmissao)) AS anosdesdeadmissao,
		extract(year from age(current_date, dataadmissao)) * 12 +
extract(month from age(current_date, dataadmissao)) AS meses
FROM empregado
WHERE EXTRACT(YEAR FROM dataadmissao) = 1981

--exercicio 2
SELECT  cargo,
COUNT(1) AS total
FROM empregado
GROUP BY (cargo)
ORDER BY COUNT(1) DESC LIMIT 1;

--exercicio 3
SELECT  UF,
COUNT(1) AS totaldecidades
FROM cidade
GROUP BY (UF)
ORDER BY COUNT(1) DESC;

--exercicio 4
INSERT INTO departamento (iddepartamento, nomedepartamento, localizacao)
    VALUES (2, 'Inovação', 'SAO LEOPOLDO');

UPDATE empregado
SET	iddepartamento = (SELECT iddepartamento FROM departamento d WHERE d.nomedepartamento = 'Inovação')
WHERE cargo != 'Atendente' AND EXTRACT(MONTH FROM dataadmissao) = 12;

SELECT * FROM empregado
WHERE iddepartamento = 2
