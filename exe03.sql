CREATE DATABASE IF NOT EXISTS db_farmacia_bem_estar;

USE db_farmacia_bem_estar;

CREATE TABLE IF NOT EXISTS tb_categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50),
    descricao VARCHAR(255),
    tipo VARCHAR(50)
);

INSERT INTO tb_categorias (nome, descricao, tipo) VALUES
('Medicamentos', 'Produtos para tratamento de saúde.', 'Prescrito'),
('Cosméticos', 'Produtos de beleza e cuidados pessoais.', 'Beleza'),
('Higiene', 'Produtos de limpeza e cuidados pessoais.', 'Higiene'),
('Suplementos', 'Suplementos nutricionais e vitaminas.', 'Nutrição'),
('Ortopedia', 'Produtos para suporte e correção ortopédica.', 'Ortopedia');

CREATE TABLE IF NOT EXISTS tb_produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50),
    descricao VARCHAR(255),
    valor DECIMAL(8,2),
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id)
);

INSERT INTO tb_produtos (nome, descricao, valor, id_categoria) VALUES
('Paracetamol', 'Analgésico e antitérmico', 10.00, 1),
('Shampoo', 'Limpeza e hidratação para cabelos', 20.00, 2),
('Sabonete', 'Limpeza e hidratação para pele', 5.00, 3),
('Vitamina C', 'Suplemento de vitamina C', 30.00, 4),
('Tala para punho', 'Suporte para imobilização do punho', 40.00, 5),
('Álcool em gel', 'Antisséptico para as mãos', 15.00, 3),
('Creme facial', 'Hidratação para o rosto', 25.00, 2),
('Omega-3', 'Suplemento de ômega-3', 35.00, 4);

SELECT * FROM tb_produtos WHERE valor > 50.00;

SELECT * FROM tb_produtos WHERE valor BETWEEN 5.00 AND 60.00;

SELECT * FROM tb_produtos WHERE nome LIKE '%C%';

SELECT p.*, c.nome AS categoria_nome, c.descricao AS categoria_descricao
FROM tb_produtos p
INNER JOIN tb_categorias c ON p.id_categoria = c.id;

SELECT p.*, c.nome AS categoria_nome, c.descricao AS categoria_descricao
FROM tb_produtos p
INNER JOIN tb_categorias c ON p.id_categoria = c.id
WHERE c.nome = 'Cosméticos';