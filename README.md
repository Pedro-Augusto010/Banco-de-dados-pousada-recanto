# 🏨 Banco de Dados Relacional: Pousada Recanto das Águas

![MySQL](https://img.shields.io/badge/MySQL-00000F?style=for-the-badge&logo=mysql&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-Script-blue?style=for-the-badge)

## 📌 Sobre o Projeto
Este projeto consiste na modelagem e implementação física de um banco de dados relacional para o sistema de gestão de uma pousada fictícia ("Pousada Recanto das Águas"). 

## ⚙️ Destaques Técnicos e Aprendizados
O script SQL foi construído do zero e contempla técnicas avançadas de DDL, DML e DQL, incluindo:

* **Integridade de Dados:** Aplicação rigorosa de restrições de domínio (`CHECK`, `UNIQUE`, `DEFAULT`) para impedir a inserção de dados inconsistentes (ex: diárias negativas, datas de saída anteriores às datas de entrada).
* **Proteção de Histórico:** Uso de chaves estrangeiras com `ON DELETE RESTRICT` e `ON UPDATE CASCADE`, evitando a destruição acidental do histórico de hospedagens e pagamentos institucionais.
* **Consultas Complexas (DQL):** 
  * Junções de múltiplas tabelas (`INNER JOIN`, `LEFT JOIN`).
  * Tratamento de valores nulos com a função `COALESCE`.
  * Cálculos de datas nativos do SGBD com a função `DATEDIFF`.
  * Agrupamentos e filtros consolidados (`GROUP BY` e `HAVING`).
  * Subconsultas com verificação de existência (`EXISTS`).
* **Views (Visões):** Criação de uma tabela virtual (`VIEW`) adaptada para simplificar a interface de leitura do setor de recepção.

## 🗄️ Estrutura do Banco de Dados
O ecossistema do banco gerencia as seguintes entidades principais:
1. **Hóspedes:** Dados cadastrais e contato.
2. **Acomodações e Categorias:** Controle de capacidade, status de ativação e valor de referência.
3. **Reservas:** Controle de período, quantidade de pessoas e status (Pendente, Confirmada, Cancelada, Finalizada).
4. **Serviços e Consumos:** Catálogo de serviços extras (Lavanderia, Passeios, etc.) e vínculo com as reservas ativas.
5. **Pagamentos:** Registro financeiro com múltiplas formas de pagamento (Pix, Dinheiro, Cartões).

## 🚀 Como Executar
O projeto foi desenvolvido no dialeto **MySQL**. Para testar em sua máquina:

1. Clone este repositório.
2. Abra o seu SGBD preferido (MySQL Workbench, DBeaver, DataGrip, etc.).
3. Carregue o arquivo `trabalho_final.sql` (ou execute os arquivos particionados na ordem: `Estrutura` -> `Carga` -> `Manipulação` -> `Consultas` -> `View`).
4. Execute o script. O código já contempla a criação do *schema* (`CREATE DATABASE`) e a inserção completa de uma massa de dados para testes.
