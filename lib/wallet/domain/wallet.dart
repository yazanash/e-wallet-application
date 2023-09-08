class Wallet {
  final String name;
  final int? id;
  final String type;

  double _balance = 0.0;
  Wallet(double? balance, this.name, this.id, this.type) {
    if (balance != null) {
      _balance = balance;
    }
  }
  double get getBalance => _balance;
  void addToBalance(double value) {
    _balance += value;
  }

  void takeFromBalance(double debt) {
    _balance -= debt;
  }

  factory Wallet.fromJson(Map<dynamic, dynamic> json) {
    return Wallet(json['balance'], json['name'], json['id'], json['type']);
  }
  Map<dynamic, dynamic> toJson() {
    return {
      id: id,
      'balance': _balance,
      'name': name,
      'type': type,
    };
  }
}
