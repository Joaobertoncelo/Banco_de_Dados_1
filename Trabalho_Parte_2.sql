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
    descricaoDieta VARCHAR (100),
    PRIMARY KEY (idDieta)
);

CREATE TABLE Possui(
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
    numParcelas INT NOT NULL,
    valorTotal FLOAT,
    metodo VARCHAR(15),
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
INSERT INTO Usuario(nomeUsu, telefone, email, senha) VALUES ('Growth', '(44)93333-3333', 'growth@contato.com', 'vendas_growth');
INSERT INTO Usuario(nomeUsu, telefone, email, senha) VALUES ('Probiótica', '(44)94444-4444', 'Probioticay@contato.com', 'Probs4654');
INSERT INTO Vendedor(cnpj, descricaoVend) VALUES ('12.345.678/0001-00', 'Empresa especializada em barras de cereal');
INSERT INTO Vendedor(cnpj, descricaoVend) VALUES ('40.028.922/0001-45', 'Empresa especializada em suplementos em pó');
INSERT INTO Vendedor(cnpj, descricaoVend) VALUES ('87.654.321/0001-00', 'Empresa especializada em suplementos e barras');

INSERT INTO Usuario(nomeUsu, telefone, email, senha) VALUES ('Cleber da Silva.', '44)92222-2222', 'clebersilva@gmail.com', 'clebersilva');
INSERT INTO Usuario(nomeUsu, telefone, email, senha) VALUES ('Edinaldo Pereira', '(44)4002-8922', 'ohomidascarçaerguida@yahoo.com', 'Banido_Banido');
INSERT INTO Usuario(nomeUsu, telefone, email, senha) VALUES ('Maria Firmina', '(44)9999-9999', 'firminaMaria@hotmail.com', 'maria123654');
INSERT INTO Atleta(cpf, altura, peso, idade, imc, calGastas, calConsumidas) VALUES ('549.642.923-84', 1.80, 76.0, 45, 23.46, 2000, 3000);
INSERT INTO Atleta(cpf, altura, peso, idade, imc, calGastas, calConsumidas) VALUES ('864.896.759-37', 1.40, 62.8, 16, 32.04, 100, 4000);
INSERT INTO Atleta(cpf, altura, peso, idade, imc, calGastas, calConsumidas) VALUES ('999.888.777-66', 1.59, 60.5, 19, 23.93, 2500, 2500);

INSERT INTO Produto(nomeProduto, tipoProduto, descricaoProd, preco, estoque, idVend) VALUES ('Barra Energética Plus', 'Energética', 'A barra perfeita para pré e pós treino', 2.50, 140, 1);
INSERT INTO Produto(nomeProduto, tipoProduto, descricaoProd, preco, estoque, idVend) VALUES ('Creatina Growth', 'Pré-treino', 'Mais energia para o seu treino', 140, 60, 2);
INSERT INTO Produto(nomeProduto, tipoProduto, descricaoProd, preco, estoque, idVend) VALUES ('Whey Protein Probiótica', 'Pós-treino', 'Faça seu treino render muito mais!', 120, 80, 3);
INSERT INTO Produto(nomeProduto, tipoProduto, descricaoProd, preco, estoque, idVend) VALUES ('Barra Energética Probiótica', 'Energética', 'A barra perfeita para pré e pós treino', 5.50, 140, 3);

INSERT INTO Dieta(tipoDieta, descricaoDieta) VALUES ('Low Carb', 'Dieta baseada em baixo consumo de carboidratos');
INSERT INTO Dieta(tipoDieta, descricaoDieta) VALUES ('Vegetariana', 'Dieta rica em fibras, gorduras saudáveis, carboidratos e proteínas vegetais');
INSERT INTO Dieta(tipoDieta, descricaoDieta) VALUES ('Sem açucar', 'Dieta sem consumo de açucar, excelente pra obesos e diabéticos');
INSERT INTO Dieta(tipoDieta, descricaoDieta) VALUES ('Dukan', 'Dieta rica em proteínas e com pouco carboidrato, para perder peso e manter o peso perdido');

INSERT INTO Possui(idAtle, idDie) VALUES (1, 4);
INSERT INTO Possui(idAtle, idDie) VALUES (3, 2);

INSERT INTO Anuncio(categoria, idVend, idProd) VALUES ('comum', 1, 1);
INSERT INTO Anuncio(categoria, idVend, idProd) VALUES ('comum', 2, 2);
INSERT INTO Anuncio(categoria, idVend, idProd) VALUES ('comum', 3, 3);
INSERT INTO Anuncio(categoria, idVend, idProd) VALUES ('premium', 3, 3);
INSERT INTO Anuncio(categoria, idVend, idProd) VALUES ('premium', 3, 4);

INSERT INTO Compra(idAtle, idProd, dataCompra, valorParcelas, numParcelas, valorTotal, metodo) VALUES (1, 1, '2023-03-12', 25.00, 1, 25.00, 'debito');
INSERT INTO Compra(idAtle, idProd, dataCompra, valorParcelas, numParcelas, valorTotal, metodo) VALUES (1, 4, '2023-03-26', 27.50, 2, 55.00, 'debito');
INSERT INTO Compra(idAtle, idProd, dataCompra, valorParcelas, numParcelas, valorTotal, metodo) VALUES (2, 3, '2023-03-30', 120, 1, 120.00, 'debito');
INSERT INTO Compra(idAtle, idProd, dataCompra, valorParcelas, numParcelas, valorTotal, metodo) VALUES (3, 2, '2023-04-02', 70, 2, 140.00, 'credito');

SELECT * FROM Usuario;
SELECT * FROM Vendedor;
SELECT * FROM Atleta;
SELECT * FROM Dieta;
SELECT * FROM Possui;
SELECT * FROM Produto;
SELECT idVend FROM Produto;
SELECT * FROM Anuncio;
SELECT * FROM Compra;

#1-Select * na tabela Possui.
SELECT * FROM Possui;

#2-Atletas que tenham menos que 18 anos.
SELECT * FROM Atleta WHERE idade < 18;

#3-União para mostrar as informações dos produtos em estoque e a categoria dos seus anuncios.
SELECT idProduto, nomeProduto
FROM Produto WHERE estoque > 0
UNION
SELECT idProd, categoria
FROM Anuncio;

#4-Todos os atletas que não possuem dieta.
SELECT * FROM Atleta WHERE NOT EXISTS (SELECT * FROM Possui WHERE Atleta.idAtleta = Possui.idAtle);

#5-Produtos do vendedor id=3 que foram comprados por alguém.
SELECT * FROM Produto NATURAL JOIN Compra WHERE idProd = idProduto AND idVend = 3;

#6-Produtos possuem um preço menor do que a média de preço dos produtos do vendedor com id=2.
SELECT nomeProduto, preco, idVend
FROM Produto
WHERE preco < (SELECT AVG(preco) FROM Produto WHERE idVend = 2);

#7 a)-Compras que tenham um valor = que o menor valor das compras do atleta id=1.
SELECT dataCompra, valorTotal
FROM Compra
WHERE valorTotal IN (SELECT MIN(valorTotal) FROM Compra
WHERE idAtle = 1);

#7 b)-Produtos que tenham o preço superior a qualquer outro do vendedor id=2.
SELECT nomeProduto, preco, estoque
FROM Produto
WHERE estoque > ANY (SELECT estoque FROM Produto
WHERE idVend = 2);

#7 c)-Apenas atletas que possuem dieta.
SELECT * FROM Atleta
WHERE EXISTS (SELECT * FROM Possui WHERE
Possui.idAtle = Atleta.idAtleta);

#7 d)-Atleta que tem um imc maior que a média de todos os atletas.
SELECT cpf, idade, calGastas, imc FROM Atleta
WHERE imc > ALL (SELECT AVG(imc) FROM Atleta);

#8-Produtos que possuem o preço mínimo entre os produtos do seu vendedor.
SELECT idProduto, nomeProduto, idVend
FROM Produto
WHERE (idVend, preco) IN (SELECT idVend, MIN(preco) FROM Produto GROUP BY idVend);

#9-Informações do vendedor e as categorias de seus anuncios.
SELECT Anuncio.categoria, Vendedor.*
FROM Anuncio RIGHT OUTER JOIN Vendedor
ON Anuncio.idVend = Vendedor.idVendedor;

#10-Nome de produto e o id do vendedor que está vendendo ele.
SELECT Produto.nomeProduto, Vendedor.idVendedor
FROM Produto LEFT OUTER JOIN Vendedor
ON Produto.idVend = Vendedor.idVendedor;

#11-Média do valor total que o atleta com id=1 gastou em suas compras.
SELECT SUM(valorTotal) / (SELECT COUNT(*) FROM Compra Where idAtle = 1)
FROM Compra WHERE idAtle = 1;

#12-Média dos valores dos produtos vendidos por cada vendedor.
SELECT idVend, AVG(preco) FROM Produto
GROUP BY idVend;

#13-Média da quantidade de calorias gastas pelos atletas.
SELECT idade, AVG(calGastas), AVG(calConsumidas)
FROM Atleta GROUP BY idade;

#14-Soma dos valores de todas as compras que foram feitas com produto id > 1.
SELECT idProd, SUM(valorTotal)
FROM Compra GROUP BY idProd
HAVING idProd > 1;

#15-Informações do atleta e o id da dieta que ele possui.
SELECT Atleta.*, idDie
FROM Atleta JOIN Possui
ON idAtleta = idAtle;

#16-Idade do atleta e o tipo da dieta que ele segue para analisar se possui alguma relação entre os dois.
SELECT idade, tipoDieta, descricaoDieta
FROM ((Atleta JOIN Possui
ON idAtleta = idAtle)
JOIN Dieta ON idDie = idDieta);

#17-Verificar se os atletas compram produtos relacionados ao tipo de dieta que eles seguem.
SELECT Atleta.*, idDie, idProduto, tipoProduto
FROM ((Possui JOIN Atleta ON Possui.idAtle = Atleta.idAtleta)
JOIN Compra ON idAtleta = Compra.idAtle)
JOIN Produto
ON idProd = idProduto;




