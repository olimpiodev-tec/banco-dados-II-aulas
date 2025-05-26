
-- 1) Mostrar os alunos matriculados em cada turma, incluindo o nome do curso.
-- Saída: matricula aluno, cod turma, nome aluno, cod curso, nome curso
CREATE VIEW vw_alunos_por_turma AS
SELECT 
    at.matricula_aluno,
    at.cod_turma,
    a.nome AS aluno_nome,
    t.cod_curso,
    c.nome AS curso_nome
FROM 
    alunos_turmas at
JOIN alunos a ON at.matricula_aluno = a.matricula
JOIN turmas t ON at.cod_turma = t.cod_turma
JOIN cursos c ON t.cod_curso = c.cod_curso;

SELECT * FROM vw_alunos_por_turma;

--------------------------------------------------------------------------------------

-- 2) Mostrar o desempenho dos alunos ordenados pela maior nota.
-- Saída: nome curso, matricula aluno, nome aluno, nota
CREATE VIEW vw_desempenho_aluno AS
SELECT
    c.nome AS curso_nome,
    at.matricula_aluno,
    a.nome AS aluno_nome,
    ROUND(AVG(n.nota), 2) AS nota
FROM alunos_turmas at
JOIN alunos a ON at.matricula_aluno = a.matricula
JOIN notas n ON n.matricula_aluno = a.matricula
JOIN turmas t ON t.cod_turma = at.cod_turma
JOIN cursos c ON c.cod_curso = t.cod_curso
GROUP BY at.matricula_aluno, a.nome, c.nome
ORDER BY nota DESC

select * from vw_desempenho_aluno;


--------------------------------------------------------------------------------------

-- 3) Lista os professores e as turmas em que lecionam.
CREATE VIEW vw_professores_turmas AS
SELECT
    t.cod_turma,
    c.nome AS curso_nome,
    p.nome AS nome_professor
FROM turmas AS t
JOIN cursos AS c ON t.cod_curso = c.cod_curso
JOIN disciplinas AS d ON c.cod_curso = d.cod_curso
JOIN professores_disciplinas AS pd ON pd.cod_disciplina = d.cod_disciplina
JOIN professores AS p ON p.ni_professor = pd.ni_professor
GROUP BY t.cod_turma, c.nome, p.nome
ORDER BY c.nome

select * from vw_professores_turmas;


--------------------------------------------------------------------------------------

-- 4) Retorna a quantidade de alunos matriculados em cada turma

CREATE OR REPLACE VIEW vw_qtd_alunos_turma AS
SELECT
    t.cod_turma AS codigo_turma,
    COUNT(at.matricula_aluno) AS total_alunos,
    c.nome AS curso_nome
FROM turmas AS t
JOIN alunos_turmas at ON t.cod_turma = t.cod_turma
JOIN cursos c ON c.cod_curso = t.cod_curso
GROUP BY t.cod_turma, c.nome;

select * from vw_qtd_alunos_turma;

--------------------------------------------------------------------------------------

-- 5) Lista os alunos e sua situação acadêmica baseado na média de notas 
-- (nota mínima de 7.0 para aprovação)
CREATE OR REPLACE VIEW vw_situacao_aluno AS
SELECT
    a.matricula,
    c.nome AS curso_nome,
    d.nome AS disciplina_nome,
    a.nome AS aluno_nome,
    n.nota,
CASE 
    WHEN n.nota >= 7.0
    THEN 'Aprovado'
    ELSE 'Reprovado'
END AS situacao
FROM alunos a
JOIN notas n ON n.matricula_aluno = a.matricula
JOIN disciplinas d ON d.cod_disciplina = n.cod_disciplina
JOIN cursos c ON c.cod_curso = d.cod_curso
ORDER BY n.nota DESC

select * from vw_situacao_aluno;

--------------------------------------------------------------------------------------

-- 6) Mostra o histórico de disciplinas cursadas por cada aluno, incluindo nota
-- matricula aluno, nome do aluno, cod turma, nota



--------------------------------------------------------------------------------------

