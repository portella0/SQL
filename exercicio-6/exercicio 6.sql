--exercicio 1
SELECT idpedido,
	   idcliente,
	   datapedido,
	   valorpedido,
	   situacao
FROM pedido
WHERE (situacao = 'A' AND idcliente = 11518) OR valorpedido > 9000
ORDER BY valorpedido;

--exercicio 2
SELECT * FROM material
WHERE pesoliquido > 4 AND precocusto < 0.3;

--exercicio 3
SELECT DISTINCT ON (nome)nome,
	   uf
FROM cidade
WHERE uf = 'RS'
ORDER BY nome;

--exercicio 4
SELECT * FROM pedidoitem
WHERE idpedido = (SELECT idpedido FROM pedido WHERE situacao = 'Q' AND valorpedido = 28299.76)
ORDER BY precounitario;

--exercicio 5
SELECT * FROM cliente
WHERE cep IS NULL AND situacao = 'A';

--exercicio 6
SELECT idpedido,
	   (precounitario*quantidade) AS calculoDoValor,
	   idpedidoitem
FROM pedidoitem
WHERE idpedido = 168
ORDER BY calculoDoValor;

--exercicio 7
SELECT * FROM material
WHERE pesoliquido BETWEEN 0.5 AND 0.6;

--exercicio 8
SELECT * FROM pedido p
WHERE situacao = 'A' AND valorpedido > 9500 AND 
EXISTS (SELECT 1 FROM pedidoitem i WHERE i.idpedido = p.idpedido);

--exercicio 9
SELECT idprodutomaterial,
	   idproduto,
	   idmaterial,
	   quantidade,
	   coalesce(quantidade,1)*5 as quantidadeX5
FROM produtomaterial
WHERE idproduto = 2492;

--exercicio 10
SELECT * FROM pedido 
WHERE situacao IN ('A','C','I') AND valorpedido >= 9800;
