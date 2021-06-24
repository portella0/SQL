--exercio 1
SELECT  substring(nome from '[^ ]+'::text), count(1) AS nomeMaisPopular
FROM cliente
WHERE substring(nome from '[^ ]+'::text) != 'Cliente'
GROUP BY (substring(nome from '[^ ]+'::text))
ORDER BY COUNT(1) DESC LIMIT 10;

--exercio 2
SELECT COUNT(1) AS quantidade,
sum(valorpedido)
from pedido
WHERE EXTRACT(YEAR FROM datapedido) = 2018 AND 
EXTRACT(MONTH FROM datapedido) = 03;

--exercio 3
SELECT UF FROM Cidade ci
WHERE EXISTS (SELECT idcidade FROM cliente cl WHERE cl.idcidade = ci.idcidade)
GROUP BY (UF)
ORDER BY COUNT(1) DESC;

--exercio 4
INSERT INTO produto (idproduto, nome, datacadastro, precocusto, precovenda, situacao)
    VALUES (56789, 'Coturno Pica-Pau', current_date, 29.25, 77.95, 'A');

--exercio 5
SELECT  p.* FROM  produto p
LEFT JOIN pedidoitem pi
on p.idproduto = pi.idproduto
WHERE   pi.idproduto IS NULL

--exercio 6
SELECT (SELECT nome FROM produto p WHERE pi.idproduto = p.idproduto) AS nome,
SUM((quantidade*(precounitario - (SELECT precocusto FROM produto p WHERE pi.idproduto = p.idproduto)))) AS lucro
FROM pedidoitem pi
WHERE EXTRACT(YEAR FROM (SELECT datapedido FROM pedido pe WHERE pi.idpedido = pe.idpedido)) = 2018
GROUP BY nome 
ORDER BY lucro DESC LIMIT 30;