CREATE TABLE logs_produtos (
    id SERIAL PRIMARY KEY,
    data_alteracao TIMESTAMP DEFAULT now(),
    alteracao VARCHAR(10),
    id_old INT,
    produto_nome_old VARCHAR(60),
    produto_valor_old REAL,
    produto_situacao_old VARCHAR(1) DEFAULT 'A',
    data_criacao_old TIMESTAMP,
    data_atualizacao_old TIMESTAMP,
    id_new INT,
    produto_nome_new VARCHAR(60),
    produto_valor_new REAL,
    produto_situacao_new VARCHAR(1) DEFAULT 'A',
    produto_data_criacao_new TIMESTAMP,
    produto_data_atualizacao_new TIMESTAMP
);

-- Criar a function para armazenar as informações na tabela de logs_produtos
CREATE OR REPLACE FUNCTION gerar_log_produtos()
RETURNS TRIGGER AS
$$
BEGIN
    IF TG_OP = 'INSERT' THEN
        INSERT INTO logs_produtos (
            data_alteracao,
            alteracao,
            id_new,
            produto_nome_new,
            produto_valor_new,
            produto_situacao_new,
            produto_data_criacao_new,
            produto_data_atualizacao_new
        ) VALUES (
            now(),
            TG_OP,
            NEW.id,
            NEW.produto_nome,
            NEW.produto_valor,
            NEW.produto_situacao,
            NEW.produto_data_criacao,
            NEW.produto_data_atualizacao
        );
        RETURN NEW;
    END IF;
END
$$
LANGUAGE PLPGSQL;

-- Criar a trigger que vai disparar a function
CREATE TRIGGER tri_log_produtos
AFTER INSERT OR UPDATE OR DELETE ON produtos
FOR EACH ROW
EXECUTE FUNCTION gerar_log_produtos();

-- Teste de inserção
INSERT INTO produtos (
    produto_nome,
    produto_valor,
    produto_situacao,
    produto_data_criacao,
    produto_data_atualizacao
) VALUES (
    'Bolo de Fubá',
    23.99,
    'A',
    '2025-05-28',
    '2025-05-28'   
);
