CREATE SCHEMA trabalho_teste;

CREATE TABLE Usuario(
	id_usuario INTEGER NOT NULL AUTO_INCREMENT,
	nomeUsu VARCHAR(30) NOT NULL,
	telefone VARCHAR(15),
	email VARCHAR(30) NOT NULL,
	senha VARCHAR(30) NOT NULL,
	PRIMARY KEY (id_usuario)
);

CREATE TABLE Vendedor(
	idVendedor INT NOT NULL AUTO_INCREMENT,
	cnpj VARCHAR(20) NOT NULL,
	descricaoVend VARCHAR(50),
	FOREIGN KEY (idVendedor) REFERENCES Usuario (id_usuario)
);

CREATE TABLE Atleta(
	idAtleta INT NOT NULL AUTO_INCREMENT,
	cpf VARCHAR(15) NOT NULL,
	altura INT,
    peso FLOAT,
    idade INT,
    imc FLOAT,
    calGastas FLOAT,
    calConsumidas FLOAT,
    FOREIGN KEY (idAtleta) REFERENCES Usuario (id_usuario)
);

CREATE TABLE Dieta(
	idDieta INT NOT NULL AUTO_INCREMENT,
    tipoDieta VARCHAR(30),
    descricaoDieta VARCHAR (50),
    PRIMARY KEY (idDieta)
);

CREATE TABLE PossuiDieta(
	idAtle INT NOT NULL,
	idDie INT NOT NULL,
    FOREIGN KEY (idAtle) REFERENCES Usuario (id_usuario),
    FOREIGN KEY (idDie) REFERENCES Dieta (idDieta)
);

CREATE TABLE Produto(
	idProduto INT NOT NULL AUTO_INCREMENT,
	nomeProduto VARCHAR(40) NOT NULL,
	tipoProduto VARCHAR(30),
	descricaoProd VARCHAR(50),
	preco FLOAT,
	estoque INT,
	idVend INT NOT NULL,
    PRIMARY KEY (idProduto),
    FOREIGN KEY (idVend) REFERENCES Vendedor (idVendedor)
);

CREATE TABLE Compra(
	idAtle INT NOT NULL,
	idProd INT NOT NULL,
	dataCompra DATE,
	valorParcelas FLOAT,
	noParcelas INT NOT NULL,
	valorTotal FLOAT,
	metodo VARCHAR(15),
	statusCompra VARCHAR(20),
   	FOREIGN KEY (idAtle) REFERENCES Usuario (id_usuario),
    FOREIGN KEY (idProd) REFERENCES Produto (idProduto)
);

CREATE TABLE Anuncio(
	idVend INT NOT NULL,
	idProd INT NOT NULL,
	categoria VARCHAR(20),
    FOREIGN KEY (idVend) REFERENCES Usuario (id_usuario),
    FOREIGN KEY (idProd) REFERENCES Produto (idProduto)
);

INSERT INTO Usuario(nomeUsu, telefone, email, senha) VALUES ('Plus Energy LTDA.', '(44)99988-7766', 'plusenergy@contato.com', 'plus123energy456');

INSERT INTO Vendedor(cnpj, descricaoVend) VALUES ('12.345.678/0001-00', 'Empresa especializada em barras de cereal');

INSERT INTO Produto(nomeProduto, tipoProduto, descricaoProd, preco, estoque, idVend) VALUES ('Barra Energética', 'Energética', 'A barra perfeita para pré e pós treino', 2.50, 140, 1);
SELECT * FROM Usuario;
SELECT * FROM Vendedor;
SELECT * FROM Produto;

SELECT idVend, nomeProduto, estoque FROM Produto WHERE idVend > 0 UNION SELECT idVendedor, cnpj, descricaoVend FROM Vendedor WHERE idVendedor > 0;





