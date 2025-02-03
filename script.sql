USE restauranteru;

-- Consultas --
-- 1: Selecionar funcionarios cujo salário está entre 3000 e 4000
SELECT * FROM funcionario WHERE salario BETWEEN '3000' AND '4000';

-- 2: Selecionar estudantes cujo ano de nascimento está entre 1990 e 1999 (usa duas tabelas)
SELECT * FROM estudante WHERE cpf IN (SELECT cpf FROM usuario WHERE YEAR(data_nascimento) BETWEEN '1990' AND '1999');

-- 3: Selecionar os tickets não consumidos de um aluno a partir de seu CPF
SELECT * FROM ticket_refeicao WHERE usuario = '222.222.222-22' AND data_consumo IS NULL;


-- Alteração --
-- 1: Remover a coluna nome da tabela 'usuario'
DESC usuario;
ALTER TABLE usuario DROP nome;
DESC usuario;

-- Atualização --
-- 2: Mudar o salário de um funcionário para 5000
SELECT * FROM funcionario;
UPDATE funcionario SET salario = '5000' WHERE cpf = '111.111.111-11';
SELECT * FROM funcionario;
