CREATE DATABASE contaComigoHMG;

USE contaComigoHMG;

CREATE TABLE Restaurante (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255),
    tipoRegistro ENUM('cpf', 'cnpj'),
    valorRegistro VARCHAR(255),
    cep CHAR(8),
    email VARCHAR(255),
    senha VARCHAR(255)
);

CREATE TABLE DetalhesPagamento (
	id INT PRIMARY KEY AUTO_INCREMENT,
    chavePix VARCHAR(255),
    clientId VARCHAR(255),
    clientSecret VARCHAR(255),
    certificado BLOB,
    idRestaurante INT,
    FOREIGN KEY (idRestaurante) REFERENCES Restaurante (id)
);

CREATE TABLE Pedido (
	id INT PRIMARY KEY AUTO_INCREMENT,
    mesa INT,
    idRestaurante INT,
    FOREIGN KEY (idRestaurante) REFERENCES Restaurante (id)
);

CREATE TABLE Comanda (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nomeDono VARCHAR(255),
    idPedido INT,
    FOREIGN KEY (idPedido) REFERENCES Pedido (id)
);

CREATE TABLE Produto (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255),
    categoria VARCHAR(255),
    preco DOUBLE,
    idRestaurante INT,
    FOREIGN KEY (idRestaurante) REFERENCES Restaurante (id)
);

CREATE TABLE ItemComanda (
	id INT PRIMARY KEY AUTO_INCREMENT,
    idComanda INT,
    idProduto INT,
    quantidade INT,
    observacao VARCHAR(255),
    FOREIGN KEY (idComanda) REFERENCES Comanda (id), 
    FOREIGN KEY (idProduto) REFERENCES Produto (id)
);