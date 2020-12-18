-- Tabelas relacionadas ao cliente --

CREATE TABLE cliente (
  cpf VARCHAR PRIMARY KEY,
  nome VARCHAR NOT NULL,
  email VARCHAR NOT NULL,
  senha VARCHAR NOT NULL,
  telefone1 VARCHAR NOT NULL,
  telefone2 VARCHAR,
  endereco VARCHAR NOT NULL
);

-- Pedidos --
CREATE TABLE pedido (
  codigo_pedido SERIAL PRIMARY KEY,
  data_pedido TIMESTAMP DEFAULT NOW () NOT NULL,
  total FLOAT NOT NULL,
  quantidade_item INT NOT NULL,
  observacao TEXT,
  finalizado BOOLEAN NOT NULL,
  codigo_cliente VARCHAR REFERENCES cliente(cpf) NOT NULL,
  codigo_comida INT REFERENCES comida(codigo_comida) NOT NULL
);

CREATE TABLE item_pedido (
  preco_comida FLOAT NOT NULL,
  data_pedido TIMESTAMP DEFAULT NOW () NOT NULL,
  codigo_pedido INT REFERENCES pedido(codigo_pedido) NOT NULL,
  codigo_comida INT REFERENCES comida(codigo_comida) NOT NULL
);

CREATE TABLE comida (
  codigo_comida SERIAL PRIMARY KEY,
  nome VARCHAR(25) NOT NULL,
  preco FLOAT NOT NULL,
  descricao VARCHAR(100),
  codigo_restaurante VARCHAR REFERENCES restaurante(cnpj) NOT NULL
);

-- Tabelas associadas ao usuário restaurante --

CREATE TABLE restaurante (
  cnpj VARCHAR(14) PRIMARY KEY,
  nome VARCHAR(30) NOT NULL,
  email VARCHAR(30) NOT NULL,
  senha VARCHAR(30) NOT NULL,
  entrega FLOAT NOT NULL,
  endereco VARCHAR NOT NULL,
  aberto BOOLEAN NOT NULL
);

CREATE TABLE categoria (
  codigo_restaurante VARCHAR REFERENCES restaurante(cnpj),
  nome VARCHAR NOT NULL,
  PRIMARY KEY (codigo_restaurante)
);


-- Inserir fake dados nas tabelas --



-- Pesquisa de comida -- 
-- SELECT comida.nome, comida.preco, restaurante.nome FROM comida 
-- INNER JOIN restaurante ON comida.codigo_restaurante=restaurante.cnpj
-- WHERE comida.nome ILIKE 'ham%'

-- SELECT AVG(DISTINCT preco_comida)::numeric(10,2) FROM item_pedido 
-- INNER JOIN comida USING(codigo_comida) 
-- INNER JOIN restaurante ON comida.codigo_restaurante='33.014.556/0001-99' 
-- GROUP BY codigo_comida

-- SELECT AVG(DISTINCT preco_comida)::numeric(10,2),codigo_comida 
-- FROM item_pedido INNER JOIN comida USING(codigo_comida) 
-- INNER JOIN restaurante ON comida.codigo_restaurante='33.014.556/3124-11' 
-- GROUP BY codigo_comida

Arq. Insert Samples

-- Dados de teste --

-- Criando restaurantes
INSERT INTO restaurante (cnpj, nome, email, senha, entrega, aberto) 
VALUES ('33.014.556/0001-99', 'Pizzaria do Paulista', 'paulista@gmail.com', '123456', 0.0, 'true'),
('99.831.514/0001-56', 'HDO', 'hdo@gmail.com', 123, 'hdo', 0.0, 'True'),
('14.480.302/0001-19', 'Bar do Cuscuz', 'cuscuz@gmail.com', 'cuscuz', 0.0, 'true'),
('44.810.967/0001-04', 'Spoleto', 'spoleto@gmail.com', 'spoleto', 0.0, 'true'),
('17.526.380/0001-03', 'Panela de Barro', 'panela@gmail.com', 'panela', 0.0, 'true'),
('56.283.094/0001-08', 'Novo Oriente', 'oriente@gmail.com', 'oriente', 0.0, 'true'),
('11.175.890/0001-99', 'China Taiwan', 'china@gmail.com', 'china', 0.0, 'true')
;

-- Criando o cardápio de cada restaurante --

INSERT INTO comida (nome, preco, descricao, codigo_restaurante)
VALUES ('Hamburguer Especial', 35.60, 'Carne bovina, bacon, queijo do reino, tomate e cebola', '33.014.556/0001-99'),
('Hamburguer Especial', 35.60, 'Carne bovina, bacon, queijo do reino, tomate e cebola', '33.014.556/0001-99'),
('Hamburguer Especial', 35.60, 'Carne bovina, bacon, queijo do reino, tomate e cebola', '33.014.556/0001-99'),
('Hamburguer Especial', 35.60, 'Carne bovina, bacon, queijo do reino, tomate e cebola', '33.014.556/0001-99'),
('Hamburguer Especial', 35.60, 'Carne bovina, bacon, queijo do reino, tomate e cebola', '33.014.556/0001-99'),
('Hamburguer Especial', 35.60, 'Carne bovina, bacon, queijo do reino, tomate e cebola', '33.014.556/0001-99'),
('Hamburguer Especial', 35.60, 'Carne bovina, bacon, queijo do reino, tomate e cebola', '33.014.556/0001-99')
;

-- Restaurante 2 --
INSERT INTO comida (nome, preco, descricao, codigo_restaurante)
VALUES ('Hamburguer Especial', 35.60, 'Carne bovina, bacon, queijo do reino, tomate e cebola', '33.014.556/0001-99'),
('Hamburguer Especial', 35.60, 'Carne bovina, bacon, queijo do reino, tomate e cebola', '33.014.556/0001-99'),
('Hamburguer Especial', 35.60, 'Carne bovina, bacon, queijo do reino, tomate e cebola', '33.014.556/0001-99'),
('Hamburguer Especial', 35.60, 'Carne bovina, bacon, queijo do reino, tomate e cebola', '33.014.556/0001-99'),
('Hamburguer Especial', 35.60, 'Carne bovina, bacon, queijo do reino, tomate e cebola', '33.014.556/0001-99'),
('Hamburguer Especial', 35.60, 'Carne bovina, bacon, queijo do reino, tomate e cebola', '33.014.556/0001-99'),
('Hamburguer Especial', 35.60, 'Carne bovina, bacon, queijo do reino, tomate e cebola', '33.014.556/0001-99')
;

-- Restaurante 3 --
INSERT INTO comida (nome, preco, descricao, codigo_restaurante)
VALUES ('Hamburguer Especial', 35.60, 'Carne bovina, bacon, queijo do reino, tomate e cebola', '33.014.556/0001-99'),
('Hamburguer Especial', 35.60, 'Carne bovina, bacon, queijo do reino, tomate e cebola', '33.014.556/0001-99'),
('Hamburguer Especial', 35.60, 'Carne bovina, bacon, queijo do reino, tomate e cebola', '33.014.556/0001-99'),
('Hamburguer Especial', 35.60, 'Carne bovina, bacon, queijo do reino, tomate e cebola', '33.014.556/0001-99'),
('Hamburguer Especial', 35.60, 'Carne bovina, bacon, queijo do reino, tomate e cebola', '33.014.556/0001-99'),
('Hamburguer Especial', 35.60, 'Carne bovina, bacon, queijo do reino, tomate e cebola', '33.014.556/0001-99'),
('Hamburguer Especial', 35.60, 'Carne bovina, bacon, queijo do reino, tomate e cebola', '33.014.556/0001-99')
;

-- Restaurante 4 --
INSERT INTO comida (nome, preco, descricao, codigo_restaurante)
VALUES ('Hamburguer Especial', 35.60, 'Carne bovina, bacon, queijo do reino, tomate e cebola', '33.014.556/0001-99'),
('Hamburguer Especial', 35.60, 'Carne bovina, bacon, queijo do reino, tomate e cebola', '33.014.556/0001-99'),
('Hamburguer Especial', 35.60, 'Carne bovina, bacon, queijo do reino, tomate e cebola', '33.014.556/0001-99'),
('Hamburguer Especial', 35.60, 'Carne bovina, bacon, queijo do reino, tomate e cebola', '33.014.556/0001-99'),
('Hamburguer Especial', 35.60, 'Carne bovina, bacon, queijo do reino, tomate e cebola', '33.014.556/0001-99'),
('Hamburguer Especial', 35.60, 'Carne bovina, bacon, queijo do reino, tomate e cebola', '33.014.556/0001-99'),
('Hamburguer Especial', 35.60, 'Carne bovina, bacon, queijo do reino, tomate e cebola', '33.014.556/0001-99')
;

-- Restaurante 5 --
INSERT INTO comida (nome, preco, descricao, codigo_restaurante)
VALUES ('Hamburguer Especial', 35.60, 'Carne bovina, bacon, queijo do reino, tomate e cebola', '33.014.556/0001-99'),
('Hamburguer Especial', 35.60, 'Carne bovina, bacon, queijo do reino, tomate e cebola', '33.014.556/0001-99'),
('Hamburguer Especial', 35.60, 'Carne bovina, bacon, queijo do reino, tomate e cebola', '33.014.556/0001-99'),
('Hamburguer Especial', 35.60, 'Carne bovina, bacon, queijo do reino, tomate e cebola', '33.014.556/0001-99'),
('Hamburguer Especial', 35.60, 'Carne bovina, bacon, queijo do reino, tomate e cebola', '33.014.556/0001-99'),
('Hamburguer Especial', 35.60, 'Carne bovina, bacon, queijo do reino, tomate e cebola', '33.014.556/0001-99'),
('Hamburguer Especial', 35.60, 'Carne bovina, bacon, queijo do reino, tomate e cebola', '33.014.556/0001-99')
;

-- clientes --

INSERT INTO cliente (cpf, nome, email, senha, telefone1, telefone2)
VALUES ('956.531.015-08', 'Ana', 'ana@gmail.com', 'ana', '(81)1321655', '(81)1321655'),
('184.337.214-29', 'gustavo', 'gustavo@gmail.com', 'gustavo', '(81)1321655', '(81)1321655'),
('289.267.882-02', 'eraldo', 'eraldo@gmail.com', 'eraldo', '(81)1321655', '(81)1321655'),
('628.109.564-21', 'duda', 'duda@gmail.com', 'duda', '(81)1321655', '(81)1321655'),
('565.707.956-60', 'celia', 'celia@gmail.com', 'celia', '(81)1321655', '(81)1321655'),
('454.228.611-83', 'john', 'john@gmail.com', 'john', '(81)1321655', '(81)1321655');
