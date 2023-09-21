import 'dart:convert';
import 'dart:io';

import 'package:meu_app_imc/classes/pessoa.dart';

void main(List<String> arguments) {
  print("Digite seu nome: ");
  String? nomePessoa = stdin.readLineSync(encoding: utf8);
  print("Digite seu peso: ");
  String? pesoPessoa = stdin.readLineSync(encoding: utf8);
  print("Digite sua altura: ");
  String? alturaPessoa = stdin.readLineSync(encoding: utf8);

  double imc;
  var pessoa = Pessoa();
  pessoa.setNome(nomePessoa.toString());
  pessoa.setPeso(double.parse(pesoPessoa.toString()));
  pessoa.setAltura(double.parse(alturaPessoa.toString()));

  double calculaImc() {
    imc = (double.parse(pesoPessoa.toString()) /
        (double.parse(alturaPessoa.toString()) *
            double.parse(alturaPessoa.toString())));
    return imc;
  }

  String classificacaoResultado() {
    String classificacao = "";
    if (calculaImc() < 16) {
      classificacao = "Magreza grave";
    } else if (calculaImc() <= 16 && calculaImc() < 17) {
      classificacao = "Magreza moderada";
    } else if (calculaImc() <= 17 && calculaImc() < 18.5) {
      classificacao = "Magreza leve";
    } else if (calculaImc() <= 18.5 && calculaImc() < 25) {
      classificacao = "Saudável";
    } else if (calculaImc() <= 25 && calculaImc() < 30) {
      classificacao = "Sobrepeso";
    } else if (calculaImc() <= 30 && calculaImc() < 35) {
      classificacao = "Obesidade Grau I";
    } else if (calculaImc() <= 35 && calculaImc() < 40) {
      classificacao = "Obesidade Grau II(severa)";
    } else if (calculaImc() >= 40) {
      classificacao = "Obesidade Grau III(mórbida)";
    } else {
      classificacao = "Não foi possível calcular o imc";
    }

    return classificacao;
  }

  print(pessoa);

  print(
      "Olá $nomePessoa, a taxa de seu IMC é de ${calculaImc().round()} e a sua classificação é: ${classificacaoResultado()}");
}
