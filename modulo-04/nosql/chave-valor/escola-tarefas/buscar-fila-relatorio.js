import { redis } from "./conexao-redis.js";
import { gerarBoletim } from "./gerar-relatorio.js";

const matriculas = [
    "A1B2C3",
    "D4E5F6",
    "G7H8I9",
    "J1K2L3",
    "M4N5O6",
    "P7Q8R9",
    "S1T2U3",
    "V4W5X6",
    "Y7Z8A9",
    "B1C2D3"
];

async function processarAlunos() {
    for (const matricula of matriculas) {
        try {
            const aluno = await redis.get(matricula);

            avaliarAluno(aluno);
            gerarBoletim(aluno);

        } catch (err) {
            console.error(`Erro ao processar matrícula ${matricula}:`, err);
        }
    }
}

function avaliarAluno(aluno) {
    aluno.disciplinas.forEach(disciplina => {
        let soma = 0;
        disciplina.notas.forEach(nota => soma += nota);
        disciplina['media'] = Number(soma / disciplina.notas.length).toFixed(2);

        const limiteFaltas = disciplina.aulas * 0.25;
        const reprovadoPorFalta = disciplina.faltas > limiteFaltas;
        const reprovadoPorNota = disciplina.media < 6;

        if (!reprovadoPorFalta && !reprovadoPorNota) {
            disciplina['situacao'] = 'Aprovado';
        } else {
            disciplina['situacao'] = 'Reprovado';
            
            if (reprovadoPorFalta && reprovadoPorNota) disciplina['motivo'] = 'nota e falta';
            else if (reprovadoPorFalta) disciplina['motivo'] = 'falta';
            else disciplina['motivo'] = 'nota';        
        }    
    })
}

processarAlunos()