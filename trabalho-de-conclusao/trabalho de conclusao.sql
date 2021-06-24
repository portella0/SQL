--exercicio 1
SELECT 
idlicitacao,
idcontratante,
titulo,
modalidade,
tipo_selecao,
procedimento,
to_char(data_fechamento, 'DD-mon-YYYY') AS data_fechamento,
inicio_vigencia,
fim_vigencia,
situacao,
valor_estimado_min,
valor_estimado_max,
valor_homologado
FROM lic_licitacao
WHERE inicio_vigencia >= '2018-01-01' AND fim_vigencia <= '2018-06-30'

--exercicio 2
SELECT idcontratante,
TRUNC(AVG(valor_estimado_min),3) AS valor_min_medio,
TRUNC(AVG(valor_estimado_max),3) AS valor_max_medio
FROM lic_licitacao
WHERE idcontratante = 705 OR idcontratante = 738 
GROUP BY idcontratante

--exercicio 3
SELECT  idcontratante,
COUNT(1) AS numero_registros
FROM lic_licitacao
GROUP BY (idcontratante)
ORDER BY COUNT(1) DESC LIMIT 6;

--exercicio 4
SELECT 
(CASE situacao WHEN 'S' THEN 'selecionada'
WHEN 'D' THEN 'desqualificada'
WHEN 'N' THEN 'não selecionada' END) AS situacao, 
idlicitacao, 
idempresa FROM lic_proposta WHERE data_inscricao >= '2018-06-01'

--exercicio 5
SELECT idproposta,
TRUNC(valor_inicial) AS valor_inicial,
TRUNC(valor_final) AS valor_final
FROM lic_proposta

--exercicio 6
SELECT idlicitacao,
MAX(TRUNC(valor_final)) AS valorFinal
FROM lic_proposta 
WHERE situacao = 'S'
GROUP BY idlicitacao 
ORDER BY valorFinal DESC

--exercicio 7
SELECT situacao,
to_char(data_inscricao, 'MM-YYYY') AS data,
COUNT(1) AS contagem FROM lic_proposta
WHERE EXTRACT(YEAR FROM data_inscricao) = 2018 
GROUP BY situacao, data 
ORDER BY data, situacao
 
--exercicio 8
SELECT * FROM lic_material
WHERE idclasse_material = 13 AND nome LIKE '%ALTURA 925 MM%'

--exercicio 9
SELECT iditem_licitacao,
idlicitacao,
quantidade,
valor_minimo,
(quantidade*valor_minimo) AS valor_minimo_total,
valor_maximo,
(quantidade*valor_maximo) AS valor_maximo_total
FROM lic_item_licitacao
ORDER BY idlicitacao

--exercicio 10
SELECT idcontratante,
con.nome,
(CASE esfera WHEN 'E'THEN 'Estadual' WHEN 'M' THEN 'Municipal' END) AS esfera,
ci.nome,
ci.UF
FROM lic_contratante con
INNER JOIN lic_cidade ci ON con.idcidade = ci.idcidade
WHERE ci.UF = 'PE' AND ci.nome = 'Recife'
 
--exercicio 11
SELECT nome,
(SELECT nome FROM lic_cidade ci 
			  WHERE ci.idcidade = e.idcidade) AS nomecidade
FROM lic_empresa e
WHERE cnpj LIKE '%86'

--exercicio 12 
SELECT 
SUBSTRING ((SELECT nome FROM lic_material mat WHERE mat.idmaterial = lit.idmaterial), 1, 20) AS nome_material, 
quantidade,
TRUNC(((valor_minimo+valor_maximo)/2)*quantidade, 2) AS valor_medio_total
FROM lic_item_licitacao lit
WHERE idlicitacao = 60
ORDER BY quantidade

--exercicio 13
SELECT li.titulo,
li.inicio_vigencia,
lit.quantidade AS quantidade_material,
mat.nome AS nome_material,
cls.nome AS _nome_classe_material
FROM lic_licitacao li
INNER JOIN lic_item_licitacao lit ON li.idlicitacao = lit.idlicitacao
INNER JOIN lic_material mat ON lit.idmaterial = mat.idmaterial
INNER JOIN lic_classe_material cls ON mat.idclasse_material = cls.idclasse_material
WHERE idcontratante = 643 AND EXTRACT(MONTH FROM data_fechamento) = 03 AND EXTRACT(YEAR FROM data_fechamento) = 2018

--exercicio 14
SELECT (MAX(valor_final)-MIN(valor_final)) AS diferenca,
p.idlicitacao
FROM lic_proposta p
INNER JOIN lic_licitacao li ON p.idlicitacao = li.idlicitacao
GROUP BY p.idlicitacao
ORDER BY diferenca DESC

--exercicio 15
SELECT p.idproposta,
p.data_inscricao,
e.nome AS nome_empresa, 
c.nome AS nome_cidade,
c.uf AS estado,
(CASE WHEN e.cnpj IS NOT NULL THEN e.cnpj WHEN e.cpf IS NOT NULL THEN e.cpf END) AS "CNPJ/CPF",
li.titulo AS titulo_licitacao,
li.situacao AS situacao_licitacao,
lit.quantidade AS quantidade_item,
lit.observacao observacao_item,
m.nome AS nome_material
FROM lic_proposta p
INNER JOIN lic_empresa e ON p.idempresa = e.idempresa
INNER JOIN lic_cidade c ON e.idcidade = c.idcidade
INNER JOIN lic_licitacao li ON p.idlicitacao = li.idlicitacao
INNER JOIN lic_item_licitacao lit ON li.idlicitacao = lit.idlicitacao
INNER JOIN lic_material m ON lit.idmaterial = m.idmaterial

--exercicio 16
SELECT COUNT(1) AS quantidade FROM lic_material m
WHERE NOT EXISTS (SELECT idmaterial FROM lic_item_licitacao lit WHERE m.idmaterial = lit.idmaterial)

