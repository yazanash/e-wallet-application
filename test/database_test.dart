import 'package:e_wallet/dependancy_injection.dart' as di;
import 'package:e_wallet/wallet/data/database.dart';
import 'package:e_wallet/wallet/domain/wallet.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:test/test.dart';

void main() async {
  await Hive.initFlutter();
  await di.init();

  group('database tests check', () {
    final db = Database(di.sl(), di.sl());

    test('Create wallet', () {
      db.addWallet(Wallet(5, 'name', 0, 'type'));
      expect(db.getWallets().length, 1);
    });
    test('check wallet validity', () {
      final temp = db.getWallets().first;
      expect(temp.getBalance, 5);
      expect(temp.name, 'name');
      expect(temp.type, 'type');
    });
  });
}
