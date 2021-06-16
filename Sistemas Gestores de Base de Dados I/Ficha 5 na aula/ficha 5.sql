
/* a*/
USE srs;

CREATE TABLE medicamento (
medicamento_id  INT auto_increment PRIMARY KEY,
nome VARCHAR(200) NOT NULL,
preco DECIMAL(5,2)  NOT NULL,
substancia VARCHAR(155)  NOT NULL,
origem VARCHAR(45) NOT NULL
);


/* selecionar e carregar no flash 
b*/

ALTER TABLE medicamento
CHANGE substancia subtancia_activa VARCHAR(155) NOT NULL;

/* c */
ALTER TABLE medicamento
DROP COLUMN origem;

/* d */
/* ENUM RESTRINGE AS OPÇÕES DE ESCOLHA */
ALTER TABLE medicamento
ADD COLUMN forma_farmaceutica ENUM('Comprimido', 'Comprimido efervescente', 'Comprimido revestido', 'Comprimido revestido com película') NOT NULL;

/* e */
ALTER TABLE medicamento
MODIFY nome VARCHAR(100) NOT NULL;

/* exercicio 2 */
INSERT INTO medicamento (nome, preco, subtancia_activa, forma_farmaceutica) VALUES 
('Dafalgan 1g', 1.72, 'Paracetamol', 'Comprimido efervescente'),
('Ciprofloxacina Sandoz', 4.51, 'Ciprofloxacina', 'Comprimido revestido'),
('Nurofen', 3.59, 'Ibuprofeno', 'Comprimido revestido'),
('Ben-U-Ron', 2.37, 'Paracetamol', 'Comprimido'),
('Rosilan', 4.82, 'Deflazacorte', 'Comprimido' ),
('Aspirina Microactive', 1.32, 'Ácido acetilsalicílico', 'Comprimido revestido'),
('Lepicortinolo', 1.95, 'Prednisolona', 'Comprimido'),
('Deflazacorte Farmoz', 4.19, 'Deflazacorte', 'Comprimido'),
('Alka-Seltzer', 6.44, 'Bicarbonato de sódio', 'Comprimido efervescente');

/*
SELECT * FROM medicamento;
*/


/* Alinea a*/
UPDATE medicamento SET preco = 3.07 WHERE medicamento_id = 4;

/* Alinea b*/
SET SQL_SAFE_UPDATES = 0;
UPDATE medicamento SET nome = 'Brufen' WHERE nome ='Nurofen';

/* Alinea c*/

UPDATE medicamento SET forma_farmaceutica = 'Comprimido revestido com película', preco = preco + 0.50 
WHERE forma_farmaceutica ='Comprimido revestido';

/* Alinea d*/
DELETE FROM medicamento WHERE subtancia_activa = 'Deflazacorte';
SELECT * FROM medicamento;


/*a começar a aqui*/
CREATE TABLE doenca (
doenca_id INT auto_increment PRIMARY KEY,
nome VARCHAR(150) NOT NULL,
data_descoberta DATE,
origem VARCHAR(45)
);

CREATE TABLE medicamento_doenca(
medicamento_id INT,
doenca_id INT,
PRIMARY KEY(medicamento_id,doenca_id),

FOREIGN KEY(medicamento_id) REFERENCES medicamento(medicamento_id),
FOREIGN KEY(doenca_id) REFERENCES doenca(doenca_id)
);




















