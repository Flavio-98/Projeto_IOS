class Academia {
    let nome: String 
    private var alunosMatriculados: [String: Aluno] = [:]()
    private var instrutoresContratados: [String: Instrutor] = [:]()
    private var aparelhos: [Aparelho] = []
    private var aulasDisponiveis: [Aula] = []

    init(nome: String) {
        self.nome = nome
    }
    
    func contratarInstrutor(_ instrutor: Instrutor) {
        instrutoresContratados[instrutor.email] = instrutor
        print("Contratado.")
    }
    
    func adicionarAparelho(_ aparelho: Aparelho) {
        aparelhos.append(aparelho)
        print("Aparelho adicionado.")
    }
    
    func adicionarAula(_ aula: Aula) {
        aulasDisponiveis.append(aula)
        print("Aula adicionada.")
    }
    
    func matricularAluno(_ aluno: Aluno) {

        if alunosMatriculados.keys.contains(aluno.matricula) {

        print("Erro: Esse aluno já foi matriculado.")
        
    } else {
        alunosMatriculados[aluno.matricula] = aluno
        print("Esse aluno foi matriculado com sucesso.")
    }
    
    func matricularAluno(nome: String, email: String, cpf: String, 
matricula: String, plano: PlanoPagamento, nivel: NivelAluno) -> Aluno {
        let novoAluno = Aluno(nome: nome,
                              email: email,
                              cpf: cpf,
                              matricula: matricula,
                              plano: plano,
                              nivel: nivel)
        self.matricularAluno(novoAluno) 
        return novoAluno
    }
    
    func buscarAluno(porMatricula matricula: String) -> Aluno? {
        return alunosMatriculados[matricula]
    }

    func listarAlunos() {
        print("\n--- Lista de Alunos Matriculados ---")

        if alunosMatriculados.isEmpty {
            print("Nenhum aluno matriculado.")
            
        } else {
            let todosOsAlunos = alunosMatriculados.values
            let alunosOrdenados = todosOsAlunos.sorted { $0.nome < $1.nome }
            for aluno in alunosOrdenados {
                print(aluno.getDescricao())
            }
        }
        
        print("---------------------------------------\n")
    }
    
    func listarAulas() {
        print("\n--- Lista de Aulas Disponíveis ---")

        if aulasDisponiveis.isEmpty {
            print("Nenhuma aula cadastrada.")
            
        } else {
            for aula in aulasDisponiveis {
                print(aula.getDescricao())
            }
        }
        
        print("-------------------------------------\n")
    }
    
}
