-- Criação do banco de dados
CREATE DATABASE pousada_recanto_das_aguas;
USE pousada_recanto_das_aguas;

-- TABELAS
CREATE TABLE HOSPEDE (
    id_hospede INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    email VARCHAR(100) UNIQUE
);


CREATE TABLE CATEGORIA_ACOMODACAO (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL UNIQUE,
    capacidade_maxima INT NOT NULL CHECK (capacidade_maxima > 0),
    valor_diaria_referencia DECIMAL(10,2) NOT NULL CHECK (valor_diaria_referencia > 0)
);


CREATE TABLE ACOMODACAO (
    id_acomodacao INT AUTO_INCREMENT PRIMARY KEY,
    identificacao VARCHAR(20) NOT NULL UNIQUE,
    ativo BOOLEAN NOT NULL DEFAULT TRUE,
    id_categoria INT NOT NULL,
    FOREIGN KEY (id_categoria) REFERENCES CATEGORIA_ACOMODACAO(id_categoria) ON UPDATE CASCADE ON DELETE RESTRICT
);


CREATE TABLE RESERVA (
    id_reserva INT AUTO_INCREMENT PRIMARY KEY,
    data_reserva DATE NOT NULL,
    data_entrada DATE NOT NULL,
    data_saida DATE NOT NULL,
    quantidade_hospedes INT NOT NULL CHECK (quantidade_hospedes > 0),
    valor_diaria DECIMAL(10,2) NOT NULL CHECK (valor_diaria > 0),
    situacao VARCHAR(20) NOT NULL DEFAULT 'PENDENTE' CHECK (situacao IN ('PENDENTE', 'CONFIRMADA', 'CANCELADA', 'FINALIZADA')),
    id_hospede INT NOT NULL,
    id_acomodacao INT NOT NULL,
    CHECK (data_saida > data_entrada),
    FOREIGN KEY (id_hospede) REFERENCES HOSPEDE(id_hospede) ON UPDATE CASCADE ON DELETE RESTRICT,
    FOREIGN KEY (id_acomodacao) REFERENCES ACOMODACAO(id_acomodacao) ON UPDATE CASCADE ON DELETE RESTRICT
);


CREATE TABLE SERVICO (
    id_servico INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL UNIQUE,
    valor_referencia DECIMAL(10,2) NOT NULL CHECK (valor_referencia > 0),
    ativo BOOLEAN NOT NULL DEFAULT TRUE
);


CREATE TABLE CONSUMO_SERVICO (
    id_consumo INT AUTO_INCREMENT PRIMARY KEY,
    data_consumo DATE NOT NULL,
    quantidade INT NOT NULL CHECK (quantidade > 0),
    valor_unitario DECIMAL(10,2) NOT NULL CHECK (valor_unitario > 0),
    id_reserva INT NOT NULL,
    id_servico INT NOT NULL,
    FOREIGN KEY (id_reserva) REFERENCES RESERVA(id_reserva) ON UPDATE CASCADE ON DELETE RESTRICT,
    FOREIGN KEY (id_servico) REFERENCES SERVICO(id_servico) ON UPDATE CASCADE ON DELETE RESTRICT
);


CREATE TABLE PAGAMENTO (
    id_pagamento INT AUTO_INCREMENT PRIMARY KEY,
    data_pagamento DATE NOT NULL,
    valor_pagamento DECIMAL(10,2) NOT NULL CHECK (valor_pagamento > 0),
    forma_pagamento VARCHAR(20) NOT NULL CHECK (forma_pagamento IN ('PIX', 'DINHEIRO', 'CARTAO_CREDITO', 'CARTAO_DEBITO')),
    id_reserva INT NOT NULL,
    FOREIGN KEY (id_reserva) REFERENCES RESERVA(id_reserva) ON UPDATE CASCADE ON DELETE RESTRICT
);