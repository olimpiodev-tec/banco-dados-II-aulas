// MongoDB Playground
// Use Ctrl+Space inside a snippet or a string literal to trigger completions.

// The current database to use.
use("escola");

// 1. Busca todos os professores
//db.getCollection("professores").find();

// 2. Busca um professore pelo ni_professor
// db.getCollection("professores").findOne(
//     { "ni_professor": "P002" }
// );

// 3. Busca todos os professores filtrando
// os campos a serem mostrados
db.getCollection("professores").find(
    {},
    {
        "_id": 0,
        "ni_professor": 1,
        "nome": 1,
        "email": 1,
        "disciplinas": 1
    }
);
