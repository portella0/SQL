CREATE TABLE IF NOT EXISTS  Usuario
(
	IdUsuario INT NOT NULL PRIMARY KEY,
	Usuario VARCHAR(255) NOT NULL,
	Senha VARCHAR(255) NOT NULL
);


CREATE TABLE IF NOT EXISTS  UsuarioFinal
(
	IdUsuario INT NOT NULL,
	IdChamado INT NOT NULL PRIMARY KEY,
	FOREIGN KEY (IdUsuario) REFERENCES Usuario (IdUsuario)
);

CREATE TABLE IF NOT EXISTS  UsuarioOperador
(
	IdUsuario INT NOT NULL,
	FOREIGN KEY (IdUsuario) REFERENCES Usuario (IdUsuario)
);

CREATE TABLE IF NOT EXISTS  UsuarioGerente
(
	IdUsuario INT NOT NULL,
	
	FOREIGN KEY (IdUsuario) REFERENCES Usuario (IdUsuario)
);

CREATE TABLE IF NOT EXISTS  UsuarioAdministrador
(
	IdUsuario INT NOT NULL,
	
	FOREIGN KEY (IdUsuario) REFERENCES Usuario (IdUsuario)
);

CREATE TABLE IF NOT EXISTS  Chamado
(
	IdChamado INT NOT NULL,
	DataPrevista TIMESTAMP NOT NULL,
	Descricao TEXT NOT NULL,
	IdAreaDeDestino INT NOT NULL UNIQUE ,
	IdStatus INT NOT NULL UNIQUE ,
	CONSTRAINT PK_table1 PRIMARY KEY (IdAreaDeDestino,IdStatus),
	FOREIGN KEY (IdChamado) REFERENCES UsuarioFinal (IdChamado)
);

CREATE TABLE IF NOT EXISTS  Infraestrutura 
(
	IdArea INT NOT NULL,
	IdServicoOferecido VARCHAR(255)[] NOT NULL,
	Resposta TEXT NOT NULL,
    FOREIGN KEY (IdArea) REFERENCES Chamado (IdAreaDeDestino)
);

CREATE TABLE IF NOT EXISTS  SistemasInternos 
(
	IdArea INT NOT NULL,
	IdServicoOferecido VARCHAR(255)[] NOT NULL,
	Resposta TEXT NOT NULL,
    FOREIGN KEY (IdArea) REFERENCES Chamado (IdAreaDeDestino)
);

CREATE TABLE IF NOT EXISTS  RecursosHumanos  
(
	IdArea INT NOT NULL,
	IdServicoOferecido VARCHAR(255)[] NOT NULL,
	Resposta TEXT NOT NULL,
    FOREIGN KEY (IdArea) REFERENCES Chamado (IdAreaDeDestino)
);

CREATE TABLE IF NOT EXISTS  Administrativa 
(
	IdArea INT NOT NULL,
	IdServicoOferecido VARCHAR(255)[] NOT NULL,
	Resposta TEXT NOT NULL,
    FOREIGN KEY (IdArea) REFERENCES Chamado (IdAreaDeDestino)
);

CREATE TABLE IF NOT EXISTS  Status 
(
	IdStatus INT NOT NULL,
	Tempo TIMESTAMP[] NOT NULL,
	FOREIGN KEY (IdStatus) REFERENCES Chamado (IdStatus)
);