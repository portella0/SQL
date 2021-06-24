--exercicio 1
TRUNCATE TABLE AlunoAula1 RESTART IDENTITY;
INSERT INTO AlunoAula1 VALUES 
('João', current_date,'Porto Alegre',11111111111, 1, 1),
('Maria', current_date,'Porto Alegre',22222222222, 2, 2),
('José', current_date,'Porto Alegre',33333333333, 3, 3),
('Luiz', current_date,'Porto Alegre',44444444444, 4, 4),
('Pedro', current_date,'Porto Alegre',55555555555, 5,5),
('Marcos', current_date,'Porto Alegre',66666666666, 6, 6),
('Luiza', current_date,'Porto Alegre',77777777777, 7,7),
('Julia', current_date,'Porto Alegre',88888888888, 8, 8),
('Carlos', current_date,'Porto Alegre',99999999999, 9, 9),
('Felipe', current_date,'Porto Alegre',00000000000, 0, 10);
SELECT * FROM AlunoAula1;

--exercicio 2
INSERT INTO cursoaula1 OVERRIDING SYSTEM VALUE  VALUES (1, 'Engenharia', current_date , 'NÃO_ATIVO', 1, 'PUCRS', 1234.56);
INSERT INTO cursoaula1 OVERRIDING SYSTEM VALUE VALUES (2, 'Engenharia', current_date , 'NÃO_ATIVO', 1, 'PUCRS', 1234.56);
INSERT INTO cursoaula1 OVERRIDING SYSTEM VALUE VALUES (3, 'Engenharia', current_date , 'NÃO_ATIVO', 1, 'PUCRS', 1234.56);
INSERT INTO cursoaula1 OVERRIDING SYSTEM VALUE VALUES (4, 'Engenharia', current_date , 'NÃO_ATIVO', 1, 'PUCRS', 1234.56);
INSERT INTO cursoaula1 OVERRIDING SYSTEM VALUE VALUES (5, 'Engenharia', current_date , 'NÃO_ATIVO', 1, 'PUCRS', 1234.56);
INSERT INTO cursoaula1 OVERRIDING SYSTEM VALUE VALUES (6, 'Engenharia', current_date , 'NÃO_ATIVO', 1, 'PUCRS', 1234.56);
INSERT INTO cursoaula1 OVERRIDING SYSTEM VALUE VALUES (7, 'Engenharia', current_date , 'NÃO_ATIVO', 1, 'PUCRS', 1234.56);
INSERT INTO cursoaula1 OVERRIDING SYSTEM VALUE VALUES (8, 'Engenharia', current_date , 'NÃO_ATIVO', 1, 'PUCRS', 1234.56);
INSERT INTO cursoaula1 OVERRIDING SYSTEM VALUE VALUES (9, 'Engenharia', current_date , 'NÃO_ATIVO', 1, 'PUCRS', 1234.56);
INSERT INTO cursoaula1 OVERRIDING SYSTEM VALUE VALUES (10, 'Engenharia', current_date , 'NÃO_ATIVO', 1, 'PUCRS', 1234.56);
SELECT * FROM cursoaula1;

--exercicio 3
UPDATE cursoaula1 SET situação = 'ATIVO'; 

--exercicio 4
SELECT * FROM cliente;
ALTER TABLE cliente DROP CONSTRAINT CC_CLIENTE_SITUACAO;
ALTER TABLE CLIENTE ADD CONSTRAINT CC_CLIENTE_SITUACAO CHECK ((Situacao='I' OR Situacao='A'OR Situacao='P'));
UPDATE cliente SET situacao = 'P' WHERE situacao = 'I'; 

--exercicio 5
SELECT * FROM AssociadoEX;
DELETE FROM AssociadoEX WHERE sexo = 'M';

--exercicio 6
UPDATE cursoaula1 SET valor = valor*1.05; 
SELECT * FROM cursoaula1;
