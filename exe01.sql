CREATE DATABASE IF NOT EXISTS db_generation_game_online;

USE db_generation_game_online;

CREATE TABLE IF NOT EXISTS tb_classes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50),
    tipo VARCHAR(50)
);

INSERT INTO tb_classes (nome, tipo) VALUES
('Guerreiro', 'Melee'),
('Mago', 'Magia'),
('Arqueiro', 'Distância'),
('Lutador', 'Melee'),
('Assassino', 'Melee,Distancia');

CREATE TABLE IF NOT EXISTS tb_personagens (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50),
    nivel INT,
    poder_ataque INT,
    poder_defesa INT,
    id_classe INT,
    FOREIGN KEY (id_classe) REFERENCES tb_classes(id)
);

INSERT INTO tb_personagens (nome, nivel, poder_ataque, poder_defesa, id_classe) VALUES
('Medusa', 10, 2500, 1500, 1),
('Mago', 15, 1800, 2200, 2),
('Thor', 12, 2100, 1800, 3),
('Aragorn', 13, 2200, 1900, 1),
('Shen', 11, 2400, 1600, 5),
('Trol', 14, 2600, 1700, 1),
('Darius', 16, 1900, 2100, 2),
('Katarina', 12, 2000, 2000, 3);

SELECT * FROM tb_personagens WHERE poder_ataque > 2000;

SELECT * FROM tb_personagens WHERE poder_defesa BETWEEN 1000 AND 2000;

SELECT * FROM tb_personagens WHERE nome LIKE '%C%';

SELECT p.*, c.nome AS classe_nome, c.tipo AS classe_tipo
FROM tb_personagens p
INNER JOIN tb_classes c ON p.id_classe = c.id;

SELECT p.*, c.nome AS classe_nome, c.tipo AS classe_tipo
FROM tb_personagens p
INNER JOIN tb_classes c ON p.id_classe = c.id
WHERE c.nome = 'Arqueiro';