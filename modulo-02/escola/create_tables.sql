
CREATE TABLE alunos (
    matricula VARCHAR(50) PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    data_nascimento DATE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE cursos (
    cod_curso VARCHAR(10) PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    qtde_semestres INT NOT NULL
);

CREATE TABLE turmas (
    cod_turma VARCHAR(10) PRIMARY KEY,
    ano INT NOT NULL,
    cod_curso VARCHAR(10),
    FOREIGN KEY (cod_curso) REFERENCES cursos(cod_curso)
);

CREATE TABLE professores (
    ni_professor VARCHAR(10) PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE disciplinas (
    cod_disciplina VARCHAR(10) PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    carga_horaria INT NOT NULL,
    cod_curso VARCHAR(10),
    FOREIGN KEY (cod_curso) REFERENCES cursos(cod_curso)
);


CREATE TABLE especialidades (
    cod_especialidade VARCHAR(10) PRIMARY KEY,
    descricao VARCHAR(255) NOT NULL,
    ni_professor VARCHAR(10),
    FOREIGN KEY (ni_professor) REFERENCES professores(ni_professor)
);


CREATE TABLE alunos_turmas (
    matricula_aluno VARCHAR(50),
    cod_turma VARCHAR(10),
    PRIMARY KEY (matricula_aluno, cod_turma),
    FOREIGN KEY (matricula_aluno) REFERENCES alunos(matricula),
    FOREIGN KEY (cod_turma) REFERENCES turmas(cod_turma)
);


CREATE TABLE professores_disciplinas (
    ni_professor VARCHAR(10),
    cod_disciplina VARCHAR(10),
    PRIMARY KEY (ni_professor, cod_disciplina),
    FOREIGN KEY (ni_professor) REFERENCES professores(ni_professor),
    FOREIGN KEY (cod_disciplina) REFERENCES disciplinas(cod_disciplina)
);

CREATE TABLE notas (
    matricula_aluno VARCHAR(50),
    cod_disciplina VARCHAR(10),
    cod_turma VARCHAR(10),
    nota DECIMAL(5,2),
    ano INT NOT NULL,
    semestre INT NOT NULL,  -- Semestre do curso (1 para o primeiro, 2 para o segundo)
    PRIMARY KEY (matricula_aluno, cod_disciplina, cod_turma, ano, semestre),
    FOREIGN KEY (matricula_aluno) REFERENCES alunos(matricula),
    FOREIGN KEY (cod_disciplina) REFERENCES disciplinas(cod_disciplina),
    FOREIGN KEY (cod_turma) REFERENCES turmas(cod_turma)
);

