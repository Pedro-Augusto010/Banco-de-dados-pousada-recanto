USE pousada_recanto_das_aguas;

-- VIEW
CREATE OR REPLACE VIEW vw_reservas_recepcao AS
SELECT r.id_reserva, h.nome AS nome_hospede, h.telefone, a.identificacao AS identificacao_acomodacao,
       c.nome AS categoria_acomodacao, r.data_entrada, r.data_saida, r.quantidade_hospedes, r.situacao
FROM RESERVA r
JOIN HOSPEDE h ON r.id_hospede = h.id_hospede
JOIN ACOMODACAO a ON r.id_acomodacao = a.id_acomodacao
JOIN CATEGORIA_ACOMODACAO c ON a.id_categoria = c.id_categoria
WHERE r.situacao IN ('PENDENTE', 'CONFIRMADA');

-- CONSULTA EXIGIDA
SELECT * FROM vw_reservas_recepcao
ORDER BY data_entrada ASC;