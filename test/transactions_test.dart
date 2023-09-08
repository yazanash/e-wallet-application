import 'package:e_wallet/wallet/assets/constant.dart';
import 'package:e_wallet/wallet/domain/transaction.dart';
import 'package:e_wallet/wallet/domain/usecases.dart';
import 'package:e_wallet/wallet/domain/wallet.dart';
import 'package:test/test.dart';

void main() {
  group('wallet feature tests for functions', () {
    var transaction_use_case = TransactionUseCases(Wallet(0,"s",1,"no type yet"));
    test("create transaction", () {
      Transaction transaction = Transaction(
          1,
          "description2",
          10000,
          TransactionType.repeated,
          DateTime.now(),
          TransactionDirection.income);
      expect(transaction_use_case.create_transaction(transaction),
          "transaction saved successfully");
    });
    test("create transaction for income ", () {
      Transaction transaction = Transaction(
          2,
          "description2",
          10000,
          TransactionType.repeated,
          DateTime.now(),
          TransactionDirection.income);
      expect(transaction_use_case.create_transaction(transaction),
          "transaction saved successfully");
    });
    test("create transaction no balance for outcome Error", () {
      Transaction transaction = Transaction(
          4,
          "description2",
          30000,
          TransactionType.repeated,
          DateTime.now(),
          TransactionDirection.outcome);
          
      expect(transaction_use_case.create_transaction(transaction),
          "no enough balance");
    });
    test("update transaction", () {
      Transaction transaction = Transaction(
          1,
          "description",
          50000,
          TransactionType.repeated,
          DateTime.now(),
          TransactionDirection.income);
      expect(transaction_use_case.update_transaction(transaction),
          "transaction updated successfully with description ${transaction.description}");
    });
    
    test("update transaction for income", () {
      Transaction transaction = Transaction(
          2,
          "description2",
          5000,
          TransactionType.repeated,
          DateTime.now(),
          TransactionDirection.income);
      expect(transaction_use_case.update_transaction(transaction),
          "transaction updated successfully with description ${transaction.description}");
    });
    test("update transaction no balance for outcome Error", () {
      Transaction transaction = Transaction(
          2,
          "description2",
          200000,
          TransactionType.repeated,
          DateTime.now(),
          TransactionDirection.outcome);
      expect(transaction_use_case.update_transaction(transaction),
          "no enough balance");
    });
    test("update transaction not exist Error", () {
      Transaction transaction = Transaction(
          20,
          "description2",
          500000,
          TransactionType.repeated,
          DateTime.now(),
          TransactionDirection.income);
      expect(transaction_use_case.update_transaction(transaction),
          "No record found");
    });
    test("delete transaction", () {
      int id =1;
      expect(transaction_use_case.delete_transaction(id),false);
    });
    test("delete transaction Error", () {
      int id =15;
      expect(transaction_use_case.delete_transaction(id),false);
     
    });
  });
}
