import 'cliente.dart';

class ContaCorrente {
  ContaCorrente(int novaAgencia, this.conta) {
    if (agencia > 0) {
      _agencia = novaAgencia;
    }
    totalDeContasCorrentes++;
  }

  static int totalDeContasCorrentes = 0;
  Cliente titular = Cliente();
  int _agencia = 145;
  int conta = 0;
  double _saldo = 20.0;
  double chequeEspecial = -100.0;

  get agencia => _agencia;
  set agencia(novaAgencia) {
    if (_agencia > 0) {
      _agencia = _agencia;
    }
  }

  get saldo1 {
    return _saldo;
  }

  set saldo(double novoSaldo) {
    if (novoSaldo >= chequeEspecial) {
      _saldo = novoSaldo;
    } else {
      print("Erro!");
    }
  }

  bool verificaSaldo(double valor) {
    if (this._saldo - valor < chequeEspecial) {
      print("Sem saldo suficente");
      return false;
    } else {
      print("Transação realizada com sucesso");
      return true;
    }
  }

  bool transferencia(double valorDaTransferencia, ContaCorrente contaDestino) {
    if (!verificaSaldo(valorDaTransferencia)) {
      print("Sem saldo suficente");
      return false;
    } else {
      this._saldo -= valorDaTransferencia;
      contaDestino.deposito(valorDaTransferencia);
      print("Transação realizada com sucesso");
      return true;
    }
  }

  bool saque(double valorDoSaque) {
    if (!verificaSaldo(valorDoSaque)) {
      return false;
    } else {
      this._saldo -= valorDoSaque;
      return true;
    }
  }

  double deposito(double valorDoDeposito) {
    this._saldo += valorDoDeposito;
    return this._saldo;
  }
}
