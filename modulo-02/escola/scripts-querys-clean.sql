-- 1) Explorar as tabelas com consultas básicas, contar as quantidades
SELECT * FROM alunos;
SELECT count(nome) FROM alunos;

SELECT * FROM cursos;
SELECT count(cod_curso) FROM cursos;

SELECT * FROM turmas;

SELECT * FROM notas;
SELECT count(semestre) FROM notas;

-- 2) Visualizar quais alunos estão matriculados em uma determinada turma.
-- Saída: matricula, nome aluno, email aluno
SELECT 
	a.matricula, a.nome, a.email, t.cod_turma
FROM alunos AS a
INNER JOIN 
	alunos_turmas AS at ON a.matricula = at.matricula_aluno
INNER JOIN 
	turmas AS t ON at.cod_turma = t.cod_turma
WHERE t.cod_turma = 'T001';

-- 3) Visualizar a grade curricular de um curso específico
-- Saída: cod disciplina, nome disciplina, carga horária
SELECT 
	d.cod_curso, d.cod_disciplina, d.nome, d.carga_horaria
FROM 
	disciplinas d
WHERE d.cod_curso = 'C009';


-- 4) Visualizar as especialidades dos professores
-- Saída: ni professor, nome, especialidade
SELECT 
	p.ni_professor, p.nome AS Nome_Professor, e.descricao
FROM
	especialidades AS e
INNER JOIN
	professores AS p ON p.ni_professor = e.ni_professor;



-- 5) Visualizar os professores e as disciplinas que ministram
-- Saída: professor, disciplina
SELECT 
	p.nome nome_professor, d.nome nome_disciplina
FROM 
	professores p
JOIN professores_disciplinas pd ON p.ni_professor = pd.ni_professor
JOIN disciplinas d ON pd.cod_disciplina = d.cod_disciplina
ORDER BY d.nome;





-- 6) Visualizar a quantidade de alunos por curso
-- Saída: curso, qtde de alunos 
SELECT 
	c.nome nome_curso, COUNT(at.matricula_aluno) qtde_alunos
FROM
	cursos c
JOIN turmas t ON t.cod_curso = c.cod_curso
JOIN alunos_turmas at ON t.cod_turma = at.cod_turma
GROUP BY c.nome
ORDER BY qtde_alunos DESC;


-- 8) Visualizar as médias das notas por disciplina e turma para avaliar desempenho
-- Saída: disciplina, cod turma, media notas




-- 9) Visualizar alunos acima da média (nota > 6.0) em determinada disciplina
-- Saída: matricula, nome, nota




-- 10) Visualizar o curso e sua carga horária total
-- Saída: curso, carga horaria total




-- 11) Visualizar o histórico de notas do aluno
-- Saída: disciplina, cod turma, ano, semestre, nota




-- 12) Visualizar os 10 alunos com maior média geral
-- Saída: matricula, nome, media geral 
