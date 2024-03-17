CREATE DATABASE rh_empresa;

USE rh_empresa;

CREATE TABLE colaboradores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    cargo VARCHAR(50),
    salario DECIMAL(10, 2),
    departamento VARCHAR(50),
    data_admissao DATE
);

INSERT INTO colaboradores (nome, cargo, salario, departamento, data_admissao)
VALUES
('Gustavo Alvarenga', 'Analista de RH', 4500.00, 'Recursos Humanos', '2024-01-01'),
('Mariana oliveira', 'Analista de Marketing', 1500.00, 'Marketing', '20-05-2021'),
('Camilla Cleane', 'Programador', 3500.00, 'TI', '10-01-2020'),
('Ana Souza', 'Assistente Administrativo', 1900.00, 'Administração', '20-10-2022'),
('Carlos Ferreira', 'Gerente de Vendas', 3500.00, 'Vendas', '05-11-2018');

SELECT * FROM colaboradores WHERE salario > 2000;

SELECT * FROM colaboradores WHERE salario < 2000;

UPDATE colaboradores SET salario = 2200.00 WHERE nome = 'Maria Santos';