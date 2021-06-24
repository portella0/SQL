DROP TABLE AlunoAula1;
DROP TABLE PreRequisitoCursoAula1;
DROP TABLE CursoAula1;

--exercicio 1
CREATE TABLE IF NOT EXISTS AlunoAula1
(
	Nome varchar(255) NOT NULL,
	DataNascimento TIMESTAMP NOT NULL,
	Cidade varchar(255) NOT NULL,
	CPF NUMERIC (11,0) NOT NULL UNIQUE,
	Matricula INT NOT NULL UNIQUE,
	CursoMatriculado INT NOT NULL
);

--exercicio 2
CREATE TABLE IF NOT EXISTS CursoAula1
(
	IdCursoAula1 INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	NomeCurso varchar(255) NOT NULL,
	Data TIMESTAMP NOT NULL,
	Situação CHAR(1) NOT NULL,
	Pré_Requisitos  INT,
	Local varchar(255) NOT NULL
);

CREATE TABLE PreRequisitoCursoAula1 
(
	IdPreRequisitoCursoAula1 INT NOT NULL PRIMARY KEY,
	IdCursoReferente INT NOT NULL,
	IdCursoPreRequisito INT NOT NULL
);

--exercicio 3
ALTER TABLE CursoAula1 ADD COLUMN Valor NUMERIC(6,2) NOT NULL DEFAULT 0;

--exercicio 4
ALTER TABLE AlunoAula1 ADD PRIMARY KEY (CursoMatriculado);
ALTER TABLE AlunoAula1 ADD FOREIGN KEY (CursoMatriculado) REFERENCES CursoAula1 (IdCursoAula1);
ALTER TABLE PreRequisitoCursoAula1 ADD FOREIGN KEY (IdCursoReferente) REFERENCES CursoAula1 (IdCursoAula1);
ALTER TABLE PreRequisitoCursoAula1 ADD FOREIGN KEY (IdCursoPreRequisito) REFERENCES CursoAula1 (IdCursoAula1);

--exercicio 5
--Um curso possui alunos e cada aluno pode estar matriculado em um curso, 
--melhoria:  Relação N:N entre cursos e seus pré requisitos