--exercicio 1
SELECT idempregado, nomeempregado
FROM empregado
ORDER BY dataadmissao;

--exercicio 2
SELECT nomeempregado, salario
FROM empregado
WHERE comissao IS NULL
ORDER BY salario;

--exercicio 3
SELECT idempregado AS id,
	   nomeempregado AS nome,
	   (salario*13) AS salarioanual,
	   (comissao*12) AS comissaoanual,
	   ((salario*13)+(coalesce(comissao,0)*12)) AS rendaanual
FROM empregado
ORDER BY nome;

--exercicio 4
SELECT idempregado AS id,
	   nomeempregado AS nome,
	   cargo,
	   (salario*13) AS salarioanual
FROM empregado
WHERE (salario*13) < 18500 OR cargo = 'Atendente'
ORDER BY nome;

--exercicio 5
SELECT nomeempregado AS nome,
	   cargo
FROM empregado
WHERE cargo = 'Atendente' OR idgerente = 7698
ORDER BY nome;

--exercicio 6
SELECT iddepartamento AS id,
	   nomedepartamento AS nome
FROM departamento
WHERE localizacao LIKE 'SAO%'
ORDER BY nomedepartamento;

--exercicio 7
SELECT * FROM CidadeEx
WHERE idcidade between 4 AND 9
ORDER BY idcidade;

--exercicio 8
SELECT * FROM departamento d
WHERE NOT EXISTS (SELECT 1 FROM empregado e WHERE e.iddepartamento = d.iddepartamento)
ORDER BY iddepartamento;

--exercicio 9
SELECT nomeempregado AS nome,
	   cargo
FROM empregado
WHERE iddepartamento IS NULL
ORDER BY nome;

--exercicio 10
SELECT nomeempregado AS nome
FROM empregado
WHERE idgerente in (7566, 7698, 7782)
ORDER BY nome;
