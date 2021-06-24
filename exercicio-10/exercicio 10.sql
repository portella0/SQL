--exercicio 1
SELECT 
nomeempregado AS nome,
(SELECT nomedepartamento FROM departamento d WHERE d.iddepartamento = e1.iddepartamento) AS nomedepartamento,
(SELECT nomeempregado FROM empregado e2 WHERE e2.idempregado = e1.idgerente) AS gerente,
(SELECT nomedepartamento FROM departamento d WHERE d.iddepartamento = 
	(SELECT iddepartamento FROM departamento d WHERE d.iddepartamento = e1.iddepartamento))
FROM empregado e1
WHERE idgerente IS NOT NULL AND iddepartamento IS NOT NULL

--exercicio 2
SELECT e.nomeempregado, e.salario, e.iddepartamento, d.iddepartamento, d.nomedepartamento
FROM empregado e, departamento d
WHERE e.iddepartamento = d.iddepartamento
ORDER BY salario DESC LIMIT 1

--exercicio 3
ALTER TABLE departamento ADD CONSTRAINT nomedepartamento_unique UNIQUE (nomedepartamento);

INSERT INTO departamento (iddepartamento, nomedepartamento, localizacao)
VALUES(5, 'Vendas', 'PORTO ALEGRE')
ON CONFLICT (nomedepartamento) 
DO UPDATE SET nomedepartamento = 'Vendas 2' 

--exercicio 4
SELECT COUNT(*) AS quantidade, nome, UF 
FROM cidadeEX 
GROUP BY nome, UF
HAVING count(*) > 1
ORDER BY quantidade DESC

--exercicio 5
SELECT * FROM
(SELECT *, count(*) OVER (PARTITION BY nome, uf) AS count
FROM cidadeEX) duplicadasContagem
WHERE duplicadasContagem.count > 1
ORDER BY nome, Idcidade

  
