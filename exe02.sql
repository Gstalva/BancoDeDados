CREATE DATABASE IF NOT EXISTS db_pizzaria_legal;

USE db_pizzaria_legal;

CREATE TABLE IF NOT EXISTS tb_categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50),
    descricao VARCHAR(255)
);

INSERT INTO tb_categorias (nome, descricao) VALUES
('Salgada', 'Pizzas salgadas com diferentes tipos de recheio.'),
('Doce', 'Pizzas doces com sabores variados e coberturas especiais.'),
('Vegetariana', 'Pizzas vegetarianas com ingredientes frescos e naturais.');

CREATE TABLE IF NOT EXISTS tb_pizzas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50),
    descricao VARCHAR(255),
    valor DECIMAL(8,2),
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id)
);

INSERT INTO tb_pizzas (nome, descricao, valor, id_categoria) VALUES
('Calabresa', 'Molho de tomate, calabresa, cebola e queijo', 40.00, 1),
('Margherita', 'Molho de tomate, queijo mussarela, tomate e manjericão', 45.00, 1),
('Quatro Queijos', 'Molho de tomate, queijo mussarela, queijo gorgonzola, queijo parmesão e queijo catupiry', 55.00, 1),
('Chocolate', 'Chocolate derretido, morangos e chantilly', 60.00, 2),
('Brigadeiro', 'Brigadeiro, granulado e chantilly', 50.00, 2),
('Vegetariana', 'Molho de tomate, champignon, milho, ervilha, cebola, tomate e queijo', 48.00, 3),
('Frango com Catupiry', 'Molho de tomate, frango desfiado, catupiry, milho e cebola', 52.00, 1),
('Mussarela', 'Molho de tomate e queijo mussarela', 35.00, 1);

SELECT * FROM tb_pizzas WHERE valor > 45.00;

SELECT * FROM tb_pizzas WHERE valor BETWEEN 50.00 AND 100.00;

SELECT * FROM tb_pizzas WHERE nome LIKE '%M%';

SELECT p.*, c.nome AS categoria_nome, c.descricao AS categoria_descricao
FROM tb_pizzas p
INNER JOIN tb_categorias c ON p.id_categoria = c.id;

SELECT p.*, c.nome AS categoria_nome, c.descricao AS categoria_descricao
FROM tb_pizzas p
INNER JOIN tb_categorias c ON p.id_categoria = c.id
WHERE c.nome = 'Doce';