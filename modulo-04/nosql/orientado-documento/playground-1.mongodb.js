// MongoDB Playground
// Use Ctrl+Space inside a snippet or a string literal to trigger completions.

// The current database to use.
use("escola");

// 1. Buscar todos os cursos
db.getCollection("cursos").find({});

// 2. Buscar os cursos com a qtde de semestre
// igual a 4
// db.getCollection("cursos").find(
//     { "qtde_semestres": 4 },
//     {
//         "_id": 0,
//         "cod_curso": 1,
//         "nome": 1,
//         "disciplinas": 1
//     }
// );
