USE pousada_recanto_das_aguas;

/* M01 - Cadastro de novo hóspede */
INSERT INTO HOSPEDE (nome, telefone, email) 
VALUES ('Luiz Otávio', '11988887777', NULL);

/* M02 - Atualização do hóspede */
UPDATE HOSPEDE 
SET telefone = '11977776666', email = 'luiz.otavio@email.com' 
WHERE nome = 'Luiz Otávio' AND email IS NULL;

/* M03 - Exclusão do hóspede */
DELETE FROM HOSPEDE 
WHERE nome = 'Luiz Otávio' AND email = 'luiz.otavio@email.com';

/* M04 - Alteração da situação de uma reserva */
UPDATE RESERVA 
SET situacao = 'CONFIRMADA' 
WHERE id_reserva = 6 AND situacao = 'PENDENTE';

/* M05 - Atualização do valor de um serviço */
UPDATE SERVICO 
SET valor_referencia = valor_referencia * 1.10 
WHERE id_servico = 1 AND ativo = TRUE;