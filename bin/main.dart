import 'package:dart_assincronismo/exceptions/transaction_exceptions.dart';
//import 'package:dart_assincronismo/screens/account_screen.dart';
import 'package:dart_assincronismo/services/transaction_service.dart';

void main() {
  TransactionServices()
      .makeTransaction(idSender: "ID001", idReceiver: "ID002", amount: 5000)
      .catchError((e) {
        print(e.message);
        print(
          "${e.cause.name} possui saldo: R\$${e.cause.balance}, e é menor que R\$${e.amount + e.taxes}",
        );
      }, test: (error) => error is InsuffcientFundsException)
      .then((value) {});
}

// void main() async {
//   try {
//   await TransactionServices().makeTransaction(
//     idSender: "ID001",
//     idReceiver: "ID002",
//     amount: 5000,
//   );
// } on InsuffcientFundsException catch (e) {
//   print(e.message);
//   print("${e.cause.name} possui saldo: R\$${e.cause.balance}, e é menor que R\$${e.amount + e.taxes}");
// }

//   // AccountScreen accountScreen = AccountScreen();
//   // accountScreen.initializeStream();
//   // accountScreen.runChatBot();
// }
