USE pousada_recanto_das_aguas;

/* Q01 - Reservas em andamento administrativo */
SELECT id_reserva, data_entrada, data_saida, situacao, valor_diaria
FROM RESERVA
WHERE situacao IN ('PENDENTE', 'CONFIRMADA')
ORDER BY data_entrada ASC;

/* Q02 - Hóspedes sem e-mail */
SELECT id_hospede, nome, telefone
FROM HOSPEDE
WHERE email IS NULL
ORDER BY nome ASC;

/* Q03 - Acomodações disponíveis */
SELECT c.nome AS categoria, c.capacidade_maxima, c.valor_diaria_referencia, a.identificacao
FROM ACOMODACAO a
JOIN CATEGORIA_ACOMODACAO c ON a.id_categoria = c.id_categoria
WHERE a.ativo = TRUE
ORDER BY c.nome ASC, a.identificacao ASC;

/* Q04 - Relatório de reservas */
SELECT r.id_reserva, h.nome AS nome_hospede, a.identificacao AS acomodacao, 
       c.nome AS categoria, r.data_entrada, r.data_saida, r.quantidade_hospedes, r.situacao
FROM RESERVA r
JOIN HOSPEDE h ON r.id_hospede = h.id_hospede
JOIN ACOMODACAO a ON r.id_acomodacao = a.id_acomodacao
JOIN CATEGORIA_ACOMODACAO c ON a.id_categoria = c.id_categoria;

/* Q05 - Situação dos pagamentos */
SELECT r.id_reserva, h.nome AS nome_hospede, r.situacao,
       COUNT(p.id_pagamento) AS quantidade_pagamentos,
       COALESCE(SUM(p.valor_pagamento), 0.00) AS valor_total_pago
FROM RESERVA r
JOIN HOSPEDE h ON r.id_hospede = h.id_hospede
LEFT JOIN PAGAMENTO p ON r.id_reserva = p.id_reserva
GROUP BY r.id_reserva, h.nome, r.situacao;

/* Q06 - Serviços mais utilizados */
SELECT s.nome, COUNT(DISTINCT c.id_reserva) AS quantidade_reservas, SUM(c.quantidade) AS quantidade_unidades
FROM CONSUMO_SERVICO c
JOIN SERVICO s ON c.id_servico = s.id_servico
GROUP BY s.id_servico, s.nome
HAVING COUNT(DISTINCT c.id_reserva) >= 3;

/* Q07 - Diárias acima da média */
SELECT r.id_reserva, h.nome AS nome_hospede, r.valor_diaria, r.situacao
FROM RESERVA r
JOIN HOSPEDE h ON r.id_hospede = h.id_hospede
WHERE r.valor_diaria > (SELECT AVG(valor_diaria) FROM RESERVA)
ORDER BY r.valor_diaria DESC;

/* Q08 - Hóspedes com reservas canceladas */
SELECT id_hospede, nome, telefone
FROM HOSPEDE h
WHERE EXISTS (
    SELECT 1 
    FROM RESERVA r 
    WHERE r.id_hospede = h.id_hospede AND r.situacao = 'CANCELADA'
);

/* Q09 - Duração das hospedagens */
SELECT id_reserva, data_entrada, data_saida, 
       DATEDIFF(data_saida, data_entrada) AS quantidade_diarias,
       CASE 
           WHEN DATEDIFF(data_saida, data_entrada) BETWEEN 1 AND 2 THEN 'CURTA'
           WHEN DATEDIFF(data_saida, data_entrada) BETWEEN 3 AND 5 THEN 'MEDIA'
           ELSE 'LONGA'
       END AS classificacao
FROM RESERVA;

/* Q10 - Valor estimado por reserva */
SELECT r.id_reserva, h.nome AS hospede, a.identificacao AS acomodacao,
       (DATEDIFF(r.data_saida, r.data_entrada) * r.valor_diaria) AS valor_diarias,
       COALESCE(SUM(c.quantidade * c.valor_unitario), 0.00) AS valor_servicos,
       ((DATEDIFF(r.data_saida, r.data_entrada) * r.valor_diaria) + COALESCE(SUM(c.quantidade * c.valor_unitario), 0.00)) AS valor_total_estimado
FROM RESERVA r
JOIN HOSPEDE h ON r.id_hospede = h.id_hospede
JOIN ACOMODACAO a ON r.id_acomodacao = a.id_acomodacao
LEFT JOIN CONSUMO_SERVICO c ON r.id_reserva = c.id_reserva
GROUP BY r.id_reserva, h.nome, a.identificacao, r.data_entrada, r.data_saida, r.valor_diaria;