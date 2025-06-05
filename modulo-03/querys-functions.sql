-- 1.0 Retorna o funcionario pelo id e sua situação

create or replace function
    get_nome_funcionario(func_id int)
    returns text as
    $$
    declare
    nome text;
    situacao text;
    BEGIN
        SELECT
            funcionario_nome,
            funcionario_situacao
            into nome, situacao
        FROM
            funcionarios
        WHERE
            id = func_id;

        if situacao = 'A' then
            return nome || '(Funcionário Ativo)';
        else
            return nome || '(Funcionário Inativo)';
        end if;
    END
    $$
    LANGUAGE PLPGSQL;

-- Testando a function
select get_nome_funcionario(4);

-- 2.0 Busca o valor da comissão por funcionario(id)
create or replace function
get_valor_comissao(func_id int)
returns real as
$$
    DECLARE
    valor_comissao real;
    BEGIN
        SELECT 
            funcionario_comissao
            into valor_comissao
        FROM
            funcionarios
        WHERE
            id = func_id;
        return valor_comissao;
    END
$$
LANGUAGE PLPGSQL;

-- Testando a function
select get_valor_comissao(1);