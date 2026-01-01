import 'package:dart_assincronismo/models/account.dart';
import 'package:dart_assincronismo/services/account_service.dart';
import 'dart:io';

import 'package:http/http.dart';

class AccountScreen {
  final AccountService _accountService = AccountService();

  void initializeStream() {
    _accountService.streamInfos.listen((event) {
      print(event);
    });
  }

  void runChatBot() async {
    print(
      "Olá, seja bem-vindo(a) sou Flatter, assistente virtual do Banco d' Ouro!",
    );
    print("É um prazer em ter você aqui. \n");

    bool isRunning = true;
    while (isRunning) {
      print("Como eu posso te ajudar? (digite o número desejado)");
      print("1 - 👀 Visualizar suas contas.");
      print("2 - ➕ Adcionar uma nova conta.");
      print("3 - 📤 Sair do chat.\n");

      String? input = stdin.readLineSync();

      if (input != null) {
        switch (input) {
          case "1":
            {
              await _getAllAccounts();
              break;
            }
          case "2":
            {
              await _addExampleAccount();
              break;
            }
          case "3":
            {
              isRunning = false;
              print("Até mais, quando quiser é só chamar 👋");
              break;
            }
          default:
            {
              print("Desculpe não entendi. Digite uma opção válida!");
            }
        }
      }
    }
  }

  dynamic _getAllAccounts() async {
    try {
      List<Account> lsitAccounts = await _accountService.getAll();
      print(lsitAccounts);
    } on ClientException catch (clientException) {
      print("Não possível alcançar o servidor.");
      print("Tente novamete mais tarde!");
      print(clientException.message);
      print(clientException.uri);
    } on Exception {
      print("Não foi possível recuperar os dados da conta");
      print("Tente novamete mais tarde!\n");
    } finally {
      print("${DateTime.now()} | Ocorreu uma tentativa de consulta.");
    }
  }

  dynamic _addExampleAccount() async {
    try {
  Account example = Account(
    id: "id007",
    name: "Emerson",
    lastName: "Fernandes",
    balance: 500,
    accountType: "Brigadeiro",
  );

    await _accountService.addAccount(example);
} on Exception {
  print("Ocorreu um erro ao tentar adiocnaar um conta.");
}

  }
}
