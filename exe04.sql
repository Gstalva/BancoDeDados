CREATE DATABASE IF NOT EXISTS db_cidade_das_carnes;

USE db_cidade_das_carnes;

CREATE TABLE IF NOT EXISTS tb_categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50),
    descricao VARCHAR(255),
    tipo VARCHAR(50)
);

INSERT INTO tb_categorias (nome, descricao, tipo) VALUES
('Carnes', 'Diferentes tipos de carnes frescas.', 'Proteína'),
('Aves', 'Aves frescas e congeladas.', 'Proteína'),
('Peixes', 'Peixes frescos e frutos do mar.', 'Proteína'),
('Frutas', 'Frutas frescas e variadas.', 'Frescos'),
('Vegetais', 'Vegetais frescos e variados.', 'Frescos');

CREATE TABLE IF NOT EXISTS tb_produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50),
    descricao VARCHAR(255),
    valor DECIMAL(8,2),
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id)
);

INSERT INTO tb_produtos (nome, descricao, valor, id_categoria) VALUES
('Picanha', 'Corte nobre de carne bovina', 70.00, 1),
('Peito de Frango', 'Peito de frango sem pele e sem osso', 30.00, 2),
('Salmão', 'Filé de salmão fresco', 100.00, 3),
('Maçã', 'Maçã vermelha fresca', 5.00, 4),
('Tomate', 'Tomate maduro e fresco', 3.00, 5),
('Filé de Tilápia', 'Filé de tilápia fresca', 40.00, 3),
('Alcatra', 'Corte de carne bovina magra', 60.00, 1),
('Abacaxi', 'Abacaxi fresco e maduro', 8.00, 4);

SELECT * FROM tb_produtos WHERE valor > 50.00;

SELECT * FROM tb_produtos WHERE valor BETWEEN 50.00 AND 150.00;

SELECT * FROM tb_produtos WHERE nome LIKE '%C%';

SELECT p.*, c.nome AS categoria_nome, c.descricao AS categoria_descricao
FROM tb_produtos p
INNER JOIN tb_categorias c ON p.id_categoria = c.id;

SELECT p.*, c.nome AS categoria_nome, c.descricao AS categoria_descricao
FROM tb_produtos p
INNER JOIN tb_categorias c ON p.id_categoria = c.id
WHERE c.nome IN ('Aves', 'Frutas');