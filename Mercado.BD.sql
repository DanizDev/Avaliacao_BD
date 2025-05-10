CREATE DATABASE Pascotto;

USE Pascotto;


CREATE TABLE clientes(
	id_cliente INT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
    data_nasc DATE NOT NULL,
    CPF VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    telefone VARCHAR(40) NOT NULL
);

CREATE TABLE funcionarios(
	id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
	data_nasc DATE NOT NULL,
    departamento VARCHAR (255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    salario DOUBLE NOT NULL,
    id_cargos_fk INT,
    FOREIGN KEY (id_cargos_fk) REFERENCES cargos (id_cargo)
);

CREATE TABLE cargos(
	id_cargo INT AUTO_INCREMENT PRIMARY KEY,
    nome_cargo VARCHAR(255) NOT NULL
);



CREATE TABLE produtos(
	id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome_produto VARCHAR(255) NOT NULL,
    validade DATE NOT NULL, 
    descricao VARCHAR(255) NOT NULL,
    peso DOUBLE NOT NULL,
    preco DOUBLE NOT NULL,
    qtd_estoque DOUBLE NOT NULL,
    id_clientes_fk INT,
    FOREIGN KEY (id_clientes_fk) REFERENCES clientes (id_cliente)
);

CREATE TABLE pedidos(
	id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    status_pedido BOOLEAN NOT NULL,
    data_criacao DATE NOT NULL,
    envio BOOLEAN NOT NULL,
    id_clientes_fk INT,
    FOREIGN KEY (id_clientes_fk) REFERENCES clientes (id_cliente)
);

CREATE TABLE itens_pedido(
	id_itens_pedido INT AUTO_INCREMENT PRIMARY KEY,
    quantidade INT NOT NULL,
    id_pedidos_fk INT,
    FOREIGN KEY (id_pedidos_fk) REFERENCES pedidos (id_pedido),
    id_produtos_fk INT,
    FOREIGN KEY (id_produtos_fk) REFERENCES produtos (id_produto)
);



INSERT INTO clientes (nome, data_nasc, CPF, email, telefone) VALUES
('Josefino', '1990-02-20', '111.111.111-1', 'josefino@gmail.com', '11-11111-1111'),
('Daniel', '2000-03-25', '222-222-222-2', 'daniel@gmail.com', '22-22222-2222'),
('Auristela', '1980-05-02', '333.333.333-3', 'auristela@gmail.com', '33-33333-3333'),
('Leonardo', '1970-06-16', '444.444.444-4', 'josefino@gmail.com', '44-44444-4444'),
('DiCaprio', '1990-01-10', '555.555.555-5', 'josefino@gmail.com', '55-55555-5555'),
('Johny', '1990-08-12', '666.666.666-6', 'josefino@gmail.com', '66-66666-6666'),
('Cage', '1990-07-19', '777.777.777-7', 'josefino@gmail.com', '77-77777-7777');

INSERT INTO funcionarios (nome, data_nasc, departamento,email, salario) VALUES
('Arthur','1999-10-30','Vendas', 'arthur@gmail.com','2000.00'),
('Gabriela','1997-11-31','ADM','gabriela@gmail.com','1990.00'),
('Julia','1992-09-27','Vendas','julia@gmail.com','3000.00'),
('Roberto','1990-11-09','Comercial','roberto@gmail.com','1500.00'),
('Oswaldo','1980-03-04','Vendas','oswaldo@gmail.com','2050.00'),
('Cleiton','1979-04-19','TI','cleiton@gmail.com','1900.00'),
('Paula','2000-01-10','Gerencia','paula@gmail.com','3020.00');

INSERT INTO cargos (nome_cargo) VALUES ('Supervisor'), ('Vendedor'), ('Suporte de TI'), ('ADM'), ('Gerente');

INSERT INTO produtos (nome_produto, validade, descricao, peso, preco, qtd_estoque) VALUES
('Computador', '2027-02-04', 'Computador gamer...', '20.0', '1500', '100'),
('Celular', '2029-05-10', 'Celular Redmi...', '5.0', '1000', '150'),
('Tablet', '2030-01-15', 'Tablet positivo...', '15.0', '1200', '200'),
('Mouse', '2033-10-31', 'Mousegamer...', '02.0', '100', '2000'),
('Teclado', '2032-11-20', 'Teclado gamer...', '10.0', '500', '1500'),
('Mousepad', '2050-09-13', 'Mousepad gamer...', '30.0', '120', '250'),
('Gabinete', '2040-07-12', 'Gabinete gamer...', '35.0', '250', '4000');

INSERT INTO pedidos (status_pedido, data_criacao, envio) VALUES 
('true', '2020-10-05', 'true'),
('false', '2019-11-10', 'false'),
('true', '2018-03-25', 'false'),
('false', '2022-04-30', 'true'),
('true', '2010-09-31', 'false'),
('false', '2023-12-02', 'true'),
('true', '2021-06-01', 'false');

INSERT INTO itens_pedido (quantidade) VALUES 
('10'),
('20'),
('30'),
('100'),
('80'),
('110'),
('90');


SELECT * FROM clientes;
SELECT * FROM pedidos;
SELECT * FROM produtos;
SELECT * FROM funcionarios;
SELECT * FROM cargos;
SELECT * FROM itens_pedido;
