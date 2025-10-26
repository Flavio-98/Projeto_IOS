protocol Manutencao {
    func nomeItem() -> String
    func dataUltimaManutencao() -> String
    func realizarManutencao() -> Bool
}

class Aparelho {
    var nomeItem: String
    var dataUltimaManutencao: String
    
    private(set) var dataUltimaManutencao: String = "Nenhuma"
    
    init(nomeAparelho: String) {
        self.nomeAparelho = nomeAparelho
    }
    
    func realizarManutencao() -> Bool {
        print("Realizando manutenção no item: \(self.nome).")
        
        self.dataUltimaManutencao = "30/08/2025" 

        return true
    }
}

class Aula {
    var nome: String
    var instrutor: Instrutor
    
    init(nome: String, instrutor: Instrutor) {
        self.nome = nome
        self.instrutor = instrutor
    }
    
    func getDescricao() -> String {
        return "Aula: \(self.nome)" + "Instrutor: \(self.instrutor)"
    }
}

class AulaPersonal: Aula {
    var aluno: Aluno
    
    init(nome: String, instrutor: Instrutor, aluno: String) {
        self.nome = nome
        super.init(nome: nome, instrutor: instrutor)
    }
    
    override func getDescricao() -> String {
        let descricaoBase = super.getDescricao() 
        return "\(descricaoBase) - Aluno: \(self.aluno.nome)"
}

class AulaColetiva: Aula {
    var alunosInscritos = [String: Aluno]()
    var capacidadeMaxima: int
    
    init(nome: String, instrutor: Instrutor, capacidadeMaxima: 25) {
        self.capacidadeMaxima = capacidadeMaxima
        super.init(nome: nome, instrutor: instrutor)
    }
    
    func inscrever(aluno: Aluno) -> Bool {
        if alunosInscritos.count >= capacidadeMaxima {
            print("Turma cheia")
            return false
            
        if alunosInscritos[aluno.matricula] != {
            print("Ops, esse aluno já foi matriculado")
            return false
            
        alunosInscritos[aluno.matricula] = aluno {
            print("Aluno matriculado")
            return true
            
    override func getDescricao() -> String {
        let descricaoBase = super.getDescricao() 
        let vagasOcupadas = alunosInscritos.count
        let capacidade = self.capacidadeMaxima
        return "\(descricaoBase) - Vagas: \(vagasOcupadas)/\(capacidade)"
    }
}
