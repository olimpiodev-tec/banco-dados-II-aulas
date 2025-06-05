-- Criar a regra para o usuário
CREATE ROLE func_caixa LOGIN PASSWORD 'caixa123';


-- Permitir que este usuário se conecte ao banco de dados
GRANT CONNECT ON DATABASE restaurante TO func_caixa;


-- Permitir que este usuário tenha acesso ao schema public do banco de dados
GRANT USAGE ON SCHEMA public TO func_caixa;


-- Adicionar as permissões das tabelas para este usuário
GRANT SELECT, INSERT ON TABLE vendas TO func_caixa;
GRANT SELECT ON TABLE itens_vendas TO func_caixa;
