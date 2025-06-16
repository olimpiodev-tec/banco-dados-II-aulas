import { redis } from "./conexao-redis.js";

const alunos = [
    {
        matricula: "A1B2C3",
        nome: "Pedro",
        disciplinas: [
            { nome: "Lógica de Programação", notas: [7.5, 6.8, 8.0, 9.1], aulas: 100, faltas: 10 },
            { nome: "Matemática Discreta", notas: [5.2, 6.0, 6.7, 7.5], aulas: 90, faltas: 12 },
            { nome: "Banco de Dados", notas: [8.0, 9.1, 7.8, 8.4], aulas: 95, faltas: 5 },
            { nome: "Redes de Computadores", notas: [6.0, 6.5, 7.0, 6.2], aulas: 100, faltas: 20 }
        ]
    },
    {
        matricula: "D4E5F6",
        nome: "Ana",
        disciplinas: [
            { nome: "Lógica de Programação", notas: [9.0, 8.7, 9.1, 8.8], aulas: 100, faltas: 2 },
            { nome: "Engenharia de Software", notas: [7.0, 7.5, 8.0, 6.5], aulas: 90, faltas: 7 },
            { nome: "Banco de Dados", notas: [6.2, 7.1, 6.8, 7.4], aulas: 95, faltas: 10 },
            { nome: "Estrutura de Dados", notas: [8.1, 8.3, 7.9, 9.0], aulas: 100, faltas: 4 }
        ]
    },
    {
        matricula: "G7H8I9",
        nome: "Lucas",
        disciplinas: [
            { nome: "Programação Orientada a Objetos", notas: [5.0, 5.5, 6.0, 4.5], aulas: 100, faltas: 25 },
            { nome: "Redes de Computadores", notas: [6.1, 5.9, 6.5, 7.0], aulas: 90, faltas: 20 },
            { nome: "Banco de Dados", notas: [7.0, 6.5, 7.1, 6.8], aulas: 100, faltas: 5 },
            { nome: "Lógica de Programação", notas: [4.5, 5.2, 5.8, 5.0], aulas: 80, faltas: 10 }
        ]
    },
    {
        matricula: "J1K2L3",
        nome: "Beatriz",
        disciplinas: [
            { nome: "Matemática Discreta", notas: [9.5, 9.0, 8.7, 9.2], aulas: 100, faltas: 0 },
            { nome: "Estrutura de Dados", notas: [7.1, 7.3, 6.8, 7.5], aulas: 90, faltas: 6 },
            { nome: "Desenvolvimento Web", notas: [8.2, 8.0, 7.9, 9.0], aulas: 100, faltas: 3 },
            { nome: "Banco de Dados", notas: [9.0, 8.8, 9.1, 8.7], aulas: 100, faltas: 2 }
        ]
    },
    {
        matricula: "M4N5O6",
        nome: "Rafael",
        disciplinas: [
            { nome: "Arquitetura de Computadores", notas: [6.0, 6.2, 5.9, 7.1], aulas: 100, faltas: 10 },
            { nome: "Lógica de Programação", notas: [5.1, 4.8, 6.0, 5.5], aulas: 95, faltas: 19 },
            { nome: "Redes de Computadores", notas: [6.9, 6.7, 7.0, 6.5], aulas: 90, faltas: 12 },
            { nome: "Banco de Dados", notas: [7.3, 7.0, 6.8, 6.9], aulas: 100, faltas: 4 }
        ]
    },
    {
        matricula: "P7Q8R9",
        nome: "Mariana",
        disciplinas: [
            { nome: "Engenharia de Software", notas: [9.0, 8.5, 8.9, 9.1], aulas: 100, faltas: 1 },
            { nome: "Programação Orientada a Objetos", notas: [8.0, 8.2, 7.5, 7.8], aulas: 90, faltas: 6 },
            { nome: "Desenvolvimento Web", notas: [9.5, 9.0, 8.8, 9.2], aulas: 95, faltas: 2 },
            { nome: "Banco de Dados", notas: [7.0, 7.5, 7.2, 7.8], aulas: 100, faltas: 3 }
        ]
    },
    {
        matricula: "S1T2U3",
        nome: "Tiago",
        disciplinas: [
            { nome: "Sistemas Operacionais", notas: [6.2, 6.5, 5.9, 6.0], aulas: 100, faltas: 23 },
            { nome: "Redes de Computadores", notas: [6.5, 6.0, 6.1, 6.4], aulas: 90, faltas: 18 },
            { nome: "Lógica de Programação", notas: [5.0, 4.8, 5.2, 5.1], aulas: 95, faltas: 22 },
            { nome: "Estrutura de Dados", notas: [6.9, 7.2, 7.0, 6.8], aulas: 100, faltas: 5 }
        ]
    },
    {
        matricula: "V4W5X6",
        nome: "Juliana",
        disciplinas: [
            { nome: "Matemática Discreta", notas: [8.0, 8.5, 8.2, 8.9], aulas: 100, faltas: 4 },
            { nome: "Programação Orientada a Objetos", notas: [7.5, 7.2, 7.0, 7.8], aulas: 95, faltas: 7 },
            { nome: "Banco de Dados", notas: [6.9, 6.8, 7.1, 7.0], aulas: 90, faltas: 6 },
            { nome: "Desenvolvimento Web", notas: [8.5, 8.7, 8.9, 9.0], aulas: 100, faltas: 2 }
        ]
    },
    {
        matricula: "Y7Z8A9",
        nome: "Bruno",
        disciplinas: [
            { nome: "Engenharia de Software", notas: [4.0, 5.0, 5.5, 4.5], aulas: 100, faltas: 28 },
            { nome: "Sistemas Operacionais", notas: [5.8, 6.0, 5.9, 6.1], aulas: 90, faltas: 20 },
            { nome: "Redes de Computadores", notas: [6.2, 6.5, 6.3, 6.1], aulas: 100, faltas: 24 },
            { nome: "Lógica de Programação", notas: [6.0, 6.0, 6.0, 6.0], aulas: 100, faltas: 26 }
        ]
    },
    {
        matricula: "B1C2D3",
        nome: "Larissa",
        disciplinas: [
            { nome: "Desenvolvimento Web", notas: [9.0, 9.2, 8.8, 9.1], aulas: 100, faltas: 1 },
            { nome: "Programação Orientada a Objetos", notas: [8.1, 8.3, 7.9, 8.5], aulas: 95, faltas: 2 },
            { nome: "Estrutura de Dados", notas: [7.0, 7.5, 6.9, 7.2], aulas: 100, faltas: 3 },
            { nome: "Banco de Dados", notas: [8.4, 8.0, 7.9, 8.1], aulas: 90, faltas: 1 }
        ]
    }
];

function adicionarAlunosFila() {
    alunos.forEach(aluno => {
        redis.set(aluno.matricula, aluno)
    })
}

adicionarAlunosFila()