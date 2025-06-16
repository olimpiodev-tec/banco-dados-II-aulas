import { jsPDF } from "jspdf";
import path from "path";

export function gerarBoletim(aluno) {
    const doc = new jsPDF();
    doc.text(`Boletim do Aluno ${aluno.nome}`, 10, 10);
    doc.text(`Matrícula: ${aluno.matricula}`, 10, 20);

    let yPdf = 30;

    for (let i = 0; i < aluno.disciplinas.length; i++) {
        const disciplina = aluno.disciplinas[i];

        doc.text(`Disciplina: ${disciplina.nome}`, 10, yPdf);
        yPdf += 8;
        doc.text(`Situação: ${disciplina.situacao}`, 10, yPdf);
        yPdf += 8;
        doc.text(`Média: ${disciplina.media}`, 10, yPdf);
        yPdf += 8;
        doc.text(`Quantidade de aulas: ${disciplina.aulas}`, 10, yPdf);
        yPdf += 8;
        doc.text(`Faltas: ${disciplina.faltas}`, 10, yPdf);
        yPdf += 8;

        if (disciplina.situacao === "Reprovado") {
            doc.text(`Motivo: ${disciplina.motivo}`, 10, yPdf);
            yPdf += 8;
        }

        yPdf += 6;
    }

    const arquivo = `${aluno.matricula}-boletim.pdf`;
    const caminhoCompleto = path.join("relatorios", arquivo);
    
    doc.save(caminhoCompleto);
}
