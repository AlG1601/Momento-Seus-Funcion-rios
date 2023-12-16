SELECT * FROM CARGOS;
-- Inclua suas próprias informações no departamento de tecnologia da empresa
INSERT INTO FUNCIONARIOS(FUNCIONARIO_ID, PRIMEIRO_NOME,SOBRENOME,EMAIL,SENHA,TELEFONE,DATA_CONTRATACAO,CARGO_ID,SALARIO,GERENTE_ID,DEPARTAMENTO_ID) VALUES
(208,'Guilherme','Santos','guilherme.gui@gmail.com.br', 'mysql', '11941486758','2023-08-01', 20, 20000,100,6);

-- A administração está sem funcionários. Inclua alguns colegas de turma nesse departamento. 
INSERT INTO FUNCIONARIOS(FUNCIONARIO_ID, PRIMEIRO_NOME,SOBRENOME,EMAIL,SENHA,TELEFONE,DATA_CONTRATACAO,CARGO_ID,SALARIO,GERENTE_ID,DEPARTAMENTO_ID) VALUES
(209,'Deivid','Moises','deivid.deivid@gmail.com.br', 'mysql', '11950482754','2023-08-01', 3, 5000,102,1);
INSERT INTO FUNCIONARIOS(FUNCIONARIO_ID, PRIMEIRO_NOME,SOBRENOME,EMAIL,SENHA,TELEFONE,DATA_CONTRATACAO,CARGO_ID,SALARIO,GERENTE_ID,DEPARTAMENTO_ID) VALUES
(210,'Julia','Araujo','julia.ju@gmail.com.br', 'mysql', '11961285729','2023-08-01', 2, 10000,103,10);
INSERT INTO FUNCIONARIOS(FUNCIONARIO_ID, PRIMEIRO_NOME,SOBRENOME,EMAIL,SENHA,TELEFONE,DATA_CONTRATACAO,CARGO_ID,SALARIO,GERENTE_ID,DEPARTAMENTO_ID) VALUES
(211,'Nathalia','Santos','nathalia.nath@gmail.com.br', 'mysql', '11981436457','2023-08-01', 9, 7000,101,6);

-- Agora diga, quantos funcionários temos ao total na empresa?
SELECT COUNT(*) FROM FUNCIONARIOS;

-- Quantos funcionários temos no departamento de finanças?
SELECT COUNT(*) FROM FUNCIONARIOS WHERE DEPARTAMENTO_ID = 10;

-- Qual a média salarial do departamento de tecnologia?
SELECT AVG(SALARIO) AS MEDIA_SALARIAL FROM FUNCIONARIOS WHERE DEPARTAMENTO_ID = 6;

-- Quanto o departamento de Transportes gasta em salários?
SELECT SUM(SALARIO) AS TOTAL_GASTO_TRANSPORTE FROM FUNCIONARIOS WHERE DEPARTAMENTO_ID = 5;

-- Um novo departamento foi criado. O departamento de inovações. Ele será locado no Brasil. Por favor, adicione-o no banco de dados.
INSERT INTO ESCRITORIOS (ESCRITORIO_ID, ESCRITORIO_NOME, ENDERECO, CEP, CIDADE, ESTADO_PROVINCIA, PAIS_ID) 
VALUES (4400, 'INOVATION', 'Rua da Inovação, 123', '12345-678', 'Cidade Inovadora', 'Estado Inovador', 'BR');

INSERT INTO DEPARTAMENTOS (DEPARTAMENTO_ID,DEPARTAMENTO_NOME,ESCRITORIO_ID) VALUES (14,'INOVAÇÕES', 4400);

-- Três novos funcionários foram contratados para o departamento de inovações. 
-- Por favor, adicione-os: William Ferreira, casado com Inara Ferreira, possuem uma filha chamada Maria Antônia que tem 1 anos e adora brincar com cachorros. Ele será programador.
-- Já a Fernanda Lima, que é casada com o Rodrigo, não possui filhos. Ela vai ocupar a posição de desenvolvedora.  
-- Por último, a Gerente do departamento será Sumaia Azevedo. Casada, duas filhas (Tainã e Nathalia).
-- O salário de todos eles será a média salarial dos departamentos de administração e finanças.
SELECT DEPARTAMENTOS.DEPARTAMENTO_NOME, AVG(FUNCIONARIOS.SALARIO) AS MEDIA_SALARIAL
FROM FUNCIONARIOS INNER JOIN DEPARTAMENTOS ON FUNCIONARIOS.DEPARTAMENTO_ID = DEPARTAMENTOS.DEPARTAMENTO_ID
WHERE DEPARTAMENTOS.DEPARTAMENTO_NOME IN ('ADMINISTRAÇÃO', 'FINANÇAS') GROUP BY DEPARTAMENTOS.DEPARTAMENTO_NOME;
INSERT INTO CARGOS(CARGO_ID,CARGO_NOME,MIN_SALARIO,MAX_SALARIO) VALUES 
(22, 'Programador', 6000.00, 15000.00),
(23, 'Desenvolvedor', 5000.00, 12000.00),
(24, 'Administrador', 3500.00, 5000.00);
INSERT INTO funcionarios(funcionario_id,primeiro_nome,sobrenome,email,senha,telefone,data_contratacao,cargo_id,salario,gerente_id,departamento_id) VALUES 
(212,'William','Ferreira','william.ferreira@gmail.com','mysql','2456-8756','2023-11-05',22,4700,105,12),
(213,'Fernanda','Lima','fernanda.lima@gmail.com','mysql','2469-4568','2023-11-05',23,4700,105,12),
(214,'Sumaia','Azevedo','sumaia.azevedo@momento.org','mysql','2345-9874','2023-11-05',24,8800,105,12);
INSERT INTO DEPENDENTES(DEPENDENTE_ID,PRIMEIRO_NOME,SOBRENOME,RELACIONAMENTO,FUNCIONARIO_ID) VALUES 
(38, 'Inara', 'Ferreira', 'Partner', 212),
(39, 'Maria', 'Ferreira', 'Child', 212),
(40, 'Rodrigo', 'Ferreira', 'Child', 213),
(41, 'Tainã', 'Azevedo', 'Child', 214),
(42, 'Nathalia', 'Azevedo', 'Child', 214);



-- Informe todas as regiões em que a empresa atua acompanhadas de seus países.
SELECT PAISES.PAIS_NOME, REGIOES.REGIAO_ID, REGIOES.REGIAO_NOME FROM PAISES INNER JOIN REGIOES ON REGIOES.REGIAO_ID = PAISES.REGIAO_ID;

-- Joe Sciarra é filho de quem?
SELECT F.FUNCIONARIO_ID, F.PRIMEIRO_NOME AS PAI,  D.PRIMEIRO_NOME AS FILHO 
FROM DEPENDENTES D INNER JOIN FUNCIONARIOS F ON F.FUNCIONARIO_ID = D.FUNCIONARIO_ID WHERE D.PRIMEIRO_NOME LIKE '%JOE%';

-- Jose Manuel possui filhos?
SELECT * FROM DEPENDENTES WHERE FUNCIONARIO_ID = 112;

-- Qual região possui mais países?
SELECT REGIOES.REGIAO_NOME, COUNT(*) AS TOTAL_PAISES 
FROM REGIOES INNER JOIN PAISES ON PAISES.REGIAO_ID = REGIOES.REGIAO_ID GROUP BY REGIOES.REGIAO_NOME ORDER BY TOTAL_PAISES DESC LIMIT 1;

-- Exiba o nome cada funcionário acompanhado de seus dependentes.
SELECT * FROM DADOS_DEPENDENTES;

-- Karen Partners possui um(a) cônjuge?
SELECT * FROM DEPENDENTES WHERE FUNCIONARIO_ID = 146;