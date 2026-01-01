import 'package:dart_assincronismo/models/account.dart';

class SenderNotExistsException implements Exception {
  String message;

  SenderNotExistsException({this.message = "Remetente não encontrado!"});
}

class ReceiverNotExistsException implements Exception {
  String message;

  ReceiverNotExistsException({this.message = "Destinatário não encontrado!"});
}

class InsuffcientFundsException implements Exception {
  String message; // Mensagem para o usuário
  Account cause; // Objeto causador da exceção
  double amount; // Informações específicas
  double taxes; // Informações específicas

  InsuffcientFundsException({
    this.message = "Fundos insuficientes para a transação.",
    required this.cause,
    required this.amount,
    required this.taxes,
  });
}
