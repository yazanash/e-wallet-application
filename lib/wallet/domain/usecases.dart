import 'package:e_wallet/wallet/assets/constant.dart';
import 'package:e_wallet/wallet/domain/transaction.dart';
import 'package:e_wallet/wallet/domain/wallet.dart';

class TransactionUseCases {
  List<Transaction> transactions = [];
  final Wallet wallet;

  TransactionUseCases(this.wallet);

  create_transaction(Transaction transaction) {
    if (transaction.operation == TransactionDirection.outcome) {
      if (wallet.getBalance - transaction.value < 0) {
        return "no enough balance";
      }
      wallet.takeFromBalance(transaction.value);
    } else {
      wallet.addToBalance(transaction.value);
    }
    transactions.add(transaction);

    return "transaction saved successfully";
  }

  update_transaction(Transaction transaction) {
    int count =
        transactions.where((element) => element.id == transaction.id).length;
    if (count == 0) {
      return "No record found";
    }
    Transaction old_transaction =
        transactions.firstWhere((element) => element.id == transaction.id);
    if (old_transaction.operation == TransactionDirection.outcome) {
      wallet.addToBalance(old_transaction.value);
    } else {
      wallet.takeFromBalance(old_transaction.value);
    }
    if (transaction.operation == TransactionDirection.outcome) {
      if (wallet.getBalance - transaction.value < 0) {
        return "no enough balance";
      }
      wallet.takeFromBalance(old_transaction.value);
    } else {
      wallet.addToBalance(transaction.value);
    }
    transactions.remove(old_transaction);
    transactions.add(transaction);
    Transaction new_transaction =
        transactions.firstWhere((element) => element.id == transaction.id);
    return "transaction updated successfully with description ${new_transaction.description}";
  }

  delete_transaction(int id) {
    int count = transactions.where((element) => element.id == id).length;
    if (count == 0) {
      return false;
    }
    Transaction test = transactions.firstWhere((element) => element.id == id);
    wallet.takeFromBalance(test.value);
    transactions.remove(test);
    bool ch = transactions.contains(test);
    return ch;
  }
}
