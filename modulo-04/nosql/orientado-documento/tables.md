## 🗂️ Entidades no Banco de Dados Relacional

* `alunos`
* `alunos_turmas`
* `notas`
* `turmas`
* `disciplinas`
* `cursos`
* `especialidades`
* `professores`
* `professores_disciplinas`

---

## 📦 Modelagem MongoDB

### 📁 Coleção `alunos`

Inclui:

* `alunos`
* `alunos_turmas`
* `notas` 
* `turmas` 

```json
{
  "matricula": "2021001",
  "nome": "Maria Silva",
  "data_nascimento": "2003-08-15",
  "email": "maria@example.com",
  "turmas": [
    {
      "cod_turma": "T2024A",
      "ano": 2024,
      "cod_curso": "ADS"
    }
  ],
  "notas": [
    {
      "cod_disciplina": "BD101",
      "cod_turma": "T2024A",
      "ano": 2024,
      "semestre": 1,
      "nota": 8.5
    }
  ]
}
```

---

### 📁 Coleção `cursos`

Inclui:

* `cursos`
* `disciplinas` 

```json
{
  "cod_curso": "ADS",
  "nome": "Análise e Desenvolvimento de Sistemas",
  "qtde_semestres": 6,
  "disciplinas": [
    {
      "cod_disciplina": "BD101",
      "nome": "Banco de Dados",
      "carga_horaria": 80
    },
    {
      "cod_disciplina": "POO102",
      "nome": "Programação Orientada a Objetos",
      "carga_horaria": 80
    }
  ]
}
```

---

### 📁 Coleção `professores` 

Inclui:

* `professores`
* `especialidades` 
* `professores_disciplinas` 

```json
{
  "ni_professor": "P001",
  "nome": "Carlos Souza",
  "email": "carlos@example.com",
  "disciplinas": [
    "BD101",
    "POO102"
  ],
  "especialidades": [
    {
      "cod_especialidade": "E001",
      "descricao": "Banco de Dados"
    }
  ]
}
```
