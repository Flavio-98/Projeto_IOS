import Foundation

protocol Protocolo {
    func getDescricao() -> String
}

enum NivelAluno {
    case iniciantes
    case intermediario
    case avancado
}

enum PlanoPagamento {
    case mensal
    case trimestral
    case anual
}

class Pessoa: Protocolo {
    var nome: String
    var email: String
    var cpf: String 
    
    init(nome: String, email: String, cpf: String) {
        self.nome = nome
        self.email = email
        self.cpf = cpf
    }
    
    func getDescricao() -> String {
        return "Nome: \(nome) - Email: \(email) - Cpf: \(cpf)"
    }
}

class Aluno: Pessoa {
    var matricula: String
    var nivel: NivelAluno
    
    private(set) var plano: PlanoPagamento 
    
    init(nome: String, email: String, cpf: String, matricula: String, plano: PlanoPagamento, nivel: NivelAluno) {
        
        self.matricula = matricula
        self.plano = plano
        self.nivel = nivel

        super.init(nome: nome, email: email, cpf: cpf)
    }
    
    override func getDescricao() -> String {
        let descricaoBase = super.getDescricao()
        return "\(descricaoBase) - Plano: \(plano) - Nível: \(nivel)"
    }
    
    func atualizarPlano(novoPlano: PlanoPagamento) {
        self.plano = novoPlano
    }
}

class Instrutor: Pessoa {
    var especialidade: String
    
    init(nome: String, email: String, cpf: String, especialidade: String) {
        
        self.especialidade = especialidade
        
        super.init(nome: nome, email: email, cpf: cpf)
    }
    
    override func getDescricao() -> String {
        let descricaoBase = super.getDescricao()
        return "\(descricaoBase) - Especialidade: \(especialidade)"
    }
}

class Plano {
    var nomePlano: String

    init(nomePlano: String) {
        self.nomePlano = nomePlano
    }

    func calcularMensalidade() -> Double {
        return 0.0
    }
}

class PlanoMensal: Plano {
    var valorMensal: Double

    init(valorMensal: Double) { 
        self.valorMensal = valorMensal
        
        super.init(nomePlano: "Plano Mensal") 
    }

    override func calcularMensalidade() -> Double {
        return self.valorMensal 
    }
}

class PlanoAnual: Plano {
    var valorMensalBase: Double

    init(valorMensalBase: Double) { 
        self.valorMensalBase = valorMensalBase

        super.init(nomePlano: "Plano Anual Promocional") 
    }

    override func calcularMensalidade() -> Double {
        let valorBase = self.valorMensalBase 
        let valorAnual = valorBase * 12
        let valorDesconto = valorAnual * 0.8 
        let valorEfetivo = valorDesconto / 12
        return valorEfetivo
    }
}

class PlanoTrimestral: Plano {
    var valorBase: Double

    init(valorBase: Double) { 
        self.valorBase = valorBase

        super.init(nomePlano: "Plano Trimestral") 
    }

    override func calcularMensalidade() -> Double {
        let valorBase = self.valorBase
        let valorTrimestral = valorBase * 3
        let valorDesconto = valorTrimestral * 0.9
        let valorEfetivo = valorDesconto / 3
        return valorEfetivo
    }
}
