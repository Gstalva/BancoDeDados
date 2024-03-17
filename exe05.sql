CREATE DATABASE IF NOT EXISTS db_construindo_vidas;

USE db_construindo_vidas;

CREATE TABLE IF NOT EXISTS tb_categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50),
    descricao VARCHAR(255),
    tipo VARCHAR(50)
);

INSERT INTO tb_categorias (nome, descricao, tipo) VALUES
('Elétrica', 'Produtos elétricos para construção', 'Elétrica'),
('Hidráulica', 'Produtos hidráulicos para construção', 'Hidráulica'),
('Ferramentas', 'Ferramentas para construção e manutenção', 'Ferramentas'),
('Acabamento', 'Produtos de acabamento para construção', 'Acabamento'),
('Madeiras', 'Produtos de madeira para construção', 'Madeira');

CREATE TABLE IF NOT EXISTS tb_produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50),
    descricao VARCHAR(255),
    valor DECIMAL(8,2),
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id)
);

INSERT INTO tb_produtos (nome, descricao, valor, id_categoria) VALUES
('Fio Elétrico', 'Fio elétrico para instalações', 120.00, 1),
('Torneira', 'Torneira para banheiro', 70.00, 2),
('Martelo', 'Martelo de construção', 15.00, 3),
('Tinta', 'Tinta para pintura', 80.00, 4),
('Prancha de Pinus', 'Prancha de pinus para construção', 25.00, 5),
('Disjuntor', 'Disjuntor para caixa de distribuição', 150.00, 1),
('Serra Circular', 'Serra circular para cortes de madeira', 200.00, 3),
('Cimento', 'Saco de cimento para construção', 40.00, 4);

SELECT * FROM tb_produtos WHERE valor > 100.00;

SELECT * FROM tb_produtos WHERE valor BETWEEN 70.00 AND 150.00;

SELECT * FROM tb_produtos WHERE nome LIKE '%C%';

SELECT p.*, c.nome AS categoria_nome, c.descricao AS categoria_descricao
FROM tb_produtos p
INNER JOIN tb_categorias c ON p.id_categoria = c.id;

SELECT p.*, c.nome AS categoria_nome, c.descricao AS categoria_descricao
FROM tb_produtos p
INNER JOIN tb_categorias c ON p.id_categoria = c.id
WHERE c.nome = 'Hidráulica';