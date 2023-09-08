import 'package:e_wallet/wallet/domain/user.dart';
import 'package:e_wallet/wallet/domain/wallet.dart';
import 'package:hive/hive.dart';

class Database {
  final Box userBox;
  final Box<Map<dynamic, dynamic>> walletsBox;
  Database(this.userBox, this.walletsBox) {
    walletsBox.clear();
  }

  User getUserInfo() {
    //TODO implament
    return User.fromJson({
      'id': userBox.get('id'),
      'pin': userBox.get('pin'),
      'username': userBox.get('username'),
    });
  }

  void saveUser(User user) async {
    await userBox.clear();
    await userBox.putAll(user.toJson());
  }

  List<Wallet> getWallets() {
    List<Wallet> list = [];
    for (var wallet in walletsBox.values) {
      list.add(Wallet.fromJson(wallet.cast<String, dynamic>()));
    }
    return list;
  }

  void addWallet(Wallet w) async {
    await walletsBox.add(w.toJson());
  }

  void updateWallet(Wallet w) async {
    await walletsBox.put('w.id', w.toJson());
  }

  void deleteWallet(Wallet w) async {
    await walletsBox.delete(w.id);
  }
}
