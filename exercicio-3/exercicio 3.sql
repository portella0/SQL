--exercicio 1
CREATE TABLE IF NOT EXISTS CidadeAux AS 
SELECT * FROM CidadeEX;

--exercicio 2
TRUNCATE TABLE CidadeAux;
INSERT INTO CidadeAux 
SELECT * FROM CidadeEX 
WHERE uf = 'RS';
SELECT * FROM CidadeAux;

--exercicio 3
CREATE TABLE IF NOT EXISTS EstoqueEx
(
	 Id INT NOT NULL, 
	 NomeEstoque VARCHAR(255) NOT NULL, 
	 DataCriacao Date NOT NULL, 
	 Capacidade NUMERIC(6,0) NOT NULL
);

TRUNCATE TABLE EstoqueEx;
INSERT INTO EstoqueEx VALUES (1, 'Comida','02-02-2021',500);
SELECT * FROM EstoqueEx;

--exercicio 4
CREATE TABLE IF NOT EXISTS ProdutoEx
(
	 Id INT NOT NULL, 
	 Nome VARCHAR(255) NOT NULL, 
	 DescProduto VARCHAR(255) NOT NULL, 
	 DtCriacao Date NOT NULL, 
	 IdEstoque INT NOT NULL, 
	 Quantidade NUMERIC(6,0) NOT NULL,
	 Preço NUMERIC(8,2) NOT NULL
);

TRUNCATE TABLE ProdutoEx;
INSERT INTO ProdutoEx VALUES (1, 'Arroz','Um grão','02-02-2021',1,100,24.99);
INSERT INTO ProdutoEx VALUES (2, 'Feijão','Um grão','03-02-2021',1,200,29.99);
SELECT * FROM ProdutoEx;

--exercicio 5
UPDATE AssociadoEx
SET CPF = 00011100011,
    Endereco = 'Rua de asfalto',
    Bairro = 'Moinhos',
    Complemento = 1020,
	IDCidade = (select 1 from CidadeAux where CidadeAux.nome = 'Taquara')
WHERE idassociado = 1;
SELECT * FROM AssociadoEx;

--exercicio 6
DELETE FROM CidadeEX
WHERE nome IN ('Campinas', 'Taquara') AND uf IN ('SP','RS');
SELECT * FROM CidadeEX;
