CREATE DATABASE IF NOT EXISTS db_curso_da_minha_vida;

USE db_curso_da_minha_vida;

CREATE TABLE IF NOT EXISTS tb_categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50),
    descricao VARCHAR(255),
    tipo VARCHAR(50)
);

INSERT INTO tb_categorias (nome, descricao, tipo) VALUES
('Programação', 'Cursos de programação e desenvolvimento de software', 'Tecnologia'),
('Design', 'Cursos de design gráfico e web design', 'Criatividade'),
('Negócios', 'Cursos de empreendedorismo e administração', 'Empreendedorismo'),
('Marketing', 'Cursos de marketing digital e estratégias de vendas', 'Marketing'),
('Idiomas', 'Cursos de idiomas e comunicação', 'Idiomas');

CREATE TABLE IF NOT EXISTS tb_cursos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    descricao VARCHAR(255),
    valor DECIMAL(8,2),
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id)
);

INSERT INTO tb_cursos (nome, descricao, valor, id_categoria) VALUES
('Curso de Java Avançado', 'Aprenda Java do básico ao avançado', 800.00, 1),
('Curso de Photoshop Profissional', 'Domine todas as técnicas do Photoshop', 600.00, 2),
('Curso de Gestão Financeira', 'Aprenda a gerenciar suas finanças pessoais e empresariais', 900.00, 3),
('Curso de Marketing Digital', 'Estratégias avançadas para alavancar seu negócio na internet', 700.00, 4),
('Curso de Inglês Fluente', 'Aprenda inglês de forma prática e eficiente', 1200.00, 5),
('Curso de Python para Data Science', 'Aprenda Python aplicado à análise de dados', 1000.00, 1),
('Curso de Illustrator', 'Crie ilustrações profissionais com o Illustrator', 550.00, 2),
('Curso de Gestão de Projetos', 'Domine as melhores práticas em gestão de projetos', 850.00, 3);

SELECT * FROM tb_cursos WHERE valor > 500.00;

SELECT * FROM tb_cursos WHERE valor BETWEEN 600.00 AND 1000.00;

SELECT * FROM tb_cursos WHERE nome LIKE '%J%';

SELECT c.*, cat.nome AS categoria_nome, cat.descricao AS categoria_descricao
FROM tb_cursos c
INNER JOIN tb_categorias cat ON c.id_categoria = cat.id;

SELECT c.*, cat.nome AS categoria_nome, cat.descricao AS categoria_descricao
FROM tb_cursos c
INNER JOIN tb_categorias cat ON c.id_categoria = cat.id
WHERE cat.nome = 'Programação';