class Wallet {
  double _balance = 0.0;
  Wallet(double? balance) {
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

  factory Wallet.fromJson(Map<String, dynamic> json) {
    return Wallet(json['balance']);
  }
}
