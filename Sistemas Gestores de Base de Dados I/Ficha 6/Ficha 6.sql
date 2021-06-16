
/* FICHA 6*/

CREATE DATABASE exercicio6;

/* A */
CREATE TABLE aluno(
	num_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    genero ENUM('M','F') NOT NULL,
    dataNasc DATE NOT NULL,
    morada VARCHAR(50) NOT NULL
);

/* B */
ALTER TABLE aluno
ADD COLUMN telefone INT NOT NULL;

/* C */
ALTER TABLE aluno
MODIFY morada VARCHAR(60) NOT NULL;

/* D */
INSERT INTO aluno (nome,genero,dataNasc,morada) VALUES
	('Abel','M','1994-12-25','Porto'),
    ('Carla','F','1995-01-10','Braga'),
    ('Daniel','M','1995-02-02','Aveiro'),
    ('Susana','F','1994-12-31','Viseu');

/* Alinea e*/
CREATE TABLE curso(
	curso_id CHAR(5) PRIMARY KEY,
    curso CHAR(50) NOT NULL,
    n_anos INT NOT NULL
);

/* Alinea F*/
INSERT INTO curso(curso_id,curso,n_anos) VALUES
	('TIG','Técnico de Informática de Gestão',3),
    ('TGPSI','Técnico de Gestão e Programação de Sistemas Informáticos',3);

SELECT * FROM curso;



SET SQL_SAFE_UPDATES = 0;
DELETE FROM curso
