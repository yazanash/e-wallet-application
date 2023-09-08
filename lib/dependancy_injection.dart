import 'package:e_wallet/wallet/domain/user.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';

final sl = GetIt.instance;

Future<void> init() async {
  final uBox = await Hive.openBox('userBox');
  sl.registerLazySingleton<Box<dynamic>>(() => uBox);
  final wBox = await Hive.openBox<Map<dynamic,dynamic>>('wallets');
  sl.registerLazySingleton<Box<Map<dynamic,dynamic>>>(() => wBox);
}
