import 'package:e_wallet/wallet/domain/wallet.dart';
import 'package:test/test.dart';

void main()  {
  group('wallet feature tests for functions', ()  {
    var wallet = Wallet(0,"0",0,"0");
    test('wallet creation function', ()  {
      // returns the current balance
      expect(wallet.getBalance, 0);
    });
    test('add to balance', ()  {
// adds 5 to balance in wallet
      wallet.addToBalance(5);
      expect(wallet.getBalance, 5);
    });

    test('remove balance from wallet', ()  {
      // remove balance from wallet
      wallet.takeFromBalance(5);
      expect(wallet.getBalance, 0);
    });

    test('No negative value is permitted', ()  {
      // try remove more than balance
      var a = wallet.getBalance;
      wallet.takeFromBalance(a + 1);
      expect(wallet.getBalance, isA<String>());
    });
  });
}
