USE pousada_recanto_das_aguas;

-- HÓSPEDES 
INSERT INTO HOSPEDE (nome, telefone, email) VALUES
('Ana Silva', '11999990001', NULL),
('Bruno Souza', '21999990002', NULL),
('Carlos Lima', '31999990003', 'carlos@email.com'),
('Daniela Costa', '41999990004', 'daniela@email.com'),
('Eduardo Alves', '51999990005', 'eduardo@email.com'),
('Fernanda Rocha', '61999990006', 'fernanda@email.com'),
('Gabriel Dias', '71999990007', 'gabriel@email.com'),
('Helena Moura', '81999990008', 'helena@email.com'),
('Igor Martins', '91999990009', 'igor@email.com'),
('Juliana Mendes', '85999990010', 'juliana@email.com');

-- CATEGORIAS 
INSERT INTO CATEGORIA_ACOMODACAO (nome, capacidade_maxima, valor_diaria_referencia) VALUES
('Standard', 2, 150.00),
('Superior', 3, 250.00),
('Chalé', 5, 400.00);

-- ACOMODAÇÕES 
INSERT INTO ACOMODACAO (identificacao, ativo, id_categoria) VALUES
('101', TRUE, 1),
('102', TRUE, 1),
('103', TRUE, 1),
('201', TRUE, 2),
('202', TRUE, 2),
('301', TRUE, 3),
('302', FALSE, 3);

-- RESERVAS 
INSERT INTO RESERVA (data_reserva, data_entrada, data_saida, quantidade_hospedes, valor_diaria, situacao, id_hospede, id_acomodacao) VALUES
('2026-08-10', '2026-09-01', '2026-09-05', 2, 150.00, 'FINALIZADA', 1, 1),  
('2026-08-15', '2026-09-10', '2026-09-15', 2, 140.00, 'CONFIRMADA', 2, 2),  
('2026-08-20', '2026-09-20', '2026-09-22', 1, 150.00, 'CANCELADA', 2, 3),   
('2026-09-01', '2026-10-01', '2026-10-10', 3, 250.00, 'FINALIZADA', 1, 4),  
('2026-09-05', '2026-10-15', '2026-10-18', 4, 450.00, 'CONFIRMADA', 3, 6),   
('2026-09-10', '2026-10-20', '2026-10-22', 2, 150.00, 'PENDENTE', 4, 1),    
('2026-09-12', '2026-11-01', '2026-11-03', 2, 250.00, 'CANCELADA', 5, 5),   
('2026-09-15', '2026-11-05', '2026-11-12', 4, 400.00, 'PENDENTE', 6, 6),    
('2026-09-20', '2026-11-15', '2026-11-20', 2, 150.00, 'CONFIRMADA', 7, 2),
('2026-09-25', '2026-11-21', '2026-11-25', 1, 150.00, 'FINALIZADA', 8, 3),
('2026-10-01', '2026-11-26', '2026-11-28', 2, 250.00, 'FINALIZADA', 9, 4),
('2026-10-05', '2026-11-29', '2026-11-30', 2, 250.00, 'CONFIRMADA', 10, 5);

-- SERVIÇOS 
INSERT INTO SERVICO (nome, valor_referencia, ativo) VALUES
('Café Especial', 35.00, TRUE),
('Lavanderia', 50.00, TRUE),
('Transfer', 120.00, TRUE),
('Passeio de Barco', 200.00, TRUE),
('Massagem Relaxante', 150.00, FALSE);

-- CONSUMO DE SERVIÇOS 
INSERT INTO CONSUMO_SERVICO (data_consumo, quantidade, valor_unitario, id_reserva, id_servico) VALUES
('2026-09-02', 1, 35.00, 1, 1),  
('2026-10-02', 2, 35.00, 4, 1),  
('2026-10-03', 1, 50.00, 4, 2),
('2026-10-16', 1, 200.00, 5, 4),
('2026-10-17', 2, 120.00, 5, 3),
('2026-11-06', 1, 120.00, 8, 3), 
('2026-11-16', 1, 120.00, 9, 3),
('2026-11-22', 1, 35.00, 10, 1),
('2026-11-23', 1, 50.00, 10, 2),
('2026-11-24', 2, 30.00, 10, 1), 
('2026-11-27', 1, 50.00, 11, 2),
('2026-11-29', 1, 120.00, 12, 3),
('2026-11-29', 1, 35.00, 12, 1),
('2026-11-30', 2, 200.00, 12, 4),
('2026-11-30', 1, 50.00, 12, 2);


-- PAGAMENTOS 
INSERT INTO PAGAMENTO (data_pagamento, valor_pagamento, forma_pagamento, id_reserva) VALUES
('2026-09-05', 600.00, 'PIX', 1),                
('2026-10-01', 500.00, 'CARTAO_CREDITO', 4),      
('2026-10-10', 1870.00, 'DINHEIRO', 4), 
('2026-10-15', 500.00, 'PIX', 5),
('2026-10-18', 1290.00, 'CARTAO_DEBITO', 5),      
('2026-11-15', 750.00, 'CARTAO_CREDITO', 9),
('2026-11-25', 600.00, 'DINHEIRO', 10),
('2026-11-26', 250.00, 'PIX', 11),
('2026-11-28', 300.00, 'DINHEIRO', 11),
('2026-11-30', 905.00, 'CARTAO_CREDITO', 12);