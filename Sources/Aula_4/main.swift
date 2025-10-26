let academia = Academia(nome: "Academia POO 360")

let planoMensal = PlanoMensal(valorMensal: 170.0)

let planoTrimestral = PlanoTrimestral(valorBase: 170.0)

let planoAnual = PlanoAnual(valorMensalBase: 170.0)

let instrutoraGrazielle = Instrutor(nome: "Grazielle", 
                                email: "grazielle@poo360.com", 
                                cpf: "111.222.333-44", 
                                especialidade: "Musculação")

let instrutoraBrigitte = Instrutor(nome: "Brigitte", 
                              email: "brigitte@poo360.com", 
                              cpf: "555.666.777-88", 
                              especialidade: "Yoga")

let instrutorJurandir = Instrutor(nome: "Jurandir", 
                              email: "jurandir@poo360.com", 
                              cpf: "999.000.111-22", 
                              especialidade: "Pilates")

academia.contratarInstrutor(instrutoraGrazielle)
academia.contratarInstrutor(instrutoraBrigitte)
academia.contratarInstrutor(instrutorJurandir)

let alunoFlavio = academia.matricularAluno(nome: "Flávio",
                                     email: "flavio@hotmail.com",
                                     cpf: "123.456.789-12",
                                     matricula: "A001",
                                     plano: .mensal,
                                     nivel: .iniciantes)

let alunoEstevam = academia.matricularAluno(nome: "Estevam",
                                     email: "estevam@hotmail.com",
                                     cpf: "987.654.321-98",
                                     matricula: "A002",
                                     plano: .anual,
                                     nivel: .intermediario)
                                     
let alunoKristoff = academia.matricularAluno(nome: "Kristoff",
                                     email: "kristoff@hotmail.com",
                                     cpf: "000.123.987-45",
                                     matricula: "A003",
                                     plano: .trimestral,
                                     nivel: .avançado)

print("Aluno 1: \(alunoFlavio.nome) - Matrícula: \(alunoFlavio.matricula)")
print("Aluno 2: \(alunoEstevam.nome) - Matrícula: \(alunoEstevam.matricula)")
print("Aluno 3: \(alunoKristoff.nome) - Matrícula: \(alunoKristoff.matricula)")

let aulaPersonal = AulaPersonal(nome: "Treino Personal",
                                    instrutor: instrutoraGrazielle,
                                    aluno: alunoFlavio)

let aulaYogaColetiva = AulaColetiva(nome: "Yoga",
                                  instrutor: instrutoraBrigitte,
                                  capacidadeMaxima: 3)

let aulaPilates = AulaColetiva(nome: "Pilates",
                               instrutor: instrutorJurandir,
                               capacidadeMaxima: 5)

academia.adicionarAula(aulaPersonal)
academia.adicionarAula(aulaYogaColetiva)
academia.adicionarAula(aulaPilates)

print("\n--- [Inscrições na Aula Coletiva: \(aulaYogaColetiva.nome)] ---")
print("Capacidade máxima da turma: \(aulaYogaColetiva.capacidadeMaxima)")

print("\nInscrevendo \(alunoFlavio.nome) (Aluno 1)...")
aulaYogaColetiva.inscrever(aluno: alunoFlavio)

print("Inscrevendo \(alunoEstevam.nome) (Aluno 2)...")
aulaYogaColetiva.inscrever(aluno: alunoEstevam)

print("Inscrevendo \(alunoKristoff.nome) (Aluno 3)...")
aulaYogaColetiva.inscrever(aluno: alunoKristoff)

let alunaSamanta = academia.matricularAluno(nome: "Samanta",
                                          email: "samanta@hotmail.com",
                                          cpf: "987.123.060-45",
                                          matricula: "A004",
                                          plano: .mensal,
                                          nivel: .iniciantes)

print("Inscrevendo \(alunaSamanta.nome) (Aluno 4)...")
aulaYogaColetiva.inscrever(aluno: alunaSamanta)

print("\n--- [Relatório Pós-Inscrições] ---")

academia.listarAulas()
academia.listarAlunos()

let todasAsAulas: [Aula] = [aulaPersonal, aulaYogaColetiva, aulaPilates]

for aula in todasAsAulas {
    
    print(aula.getDescricao())
}

let todasAsPessoas: [Pessoa] = [
    alunoFlavio,        
    instrutoraGrazielle, 
    alunoEstevam,        
    instrutoraBrigitte, 
    alunoKristoff,
    instrutorJurandir
]

for pessoa in todasAsPessoas {
    print(pessoa.getDescricao())
}
