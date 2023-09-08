import 'package:e_wallet/wallet/assets/constant.dart';
class Transaction {
  final int id;
  final String description;
  final double value;
  final TransactionType type;
  final DateTime date;
  final TransactionDirection operation;

  Transaction(this.id, this.description, this.value, this.type, this.date, this.operation);
}
