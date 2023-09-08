import 'package:e_wallet/wallet/assets/constant.dart';

class Transaction {
   int id;
   String description;
   double value;
   TransactionType type;
   DateTime date;
   TransactionDirection operation;

  Transaction(this.id, this.description, this.value, this.type, this.date,
      this.operation);
  
}
