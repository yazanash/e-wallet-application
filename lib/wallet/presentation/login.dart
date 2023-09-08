import 'package:e_wallet/wallet/presentation/wallets_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final nameCtl = TextEditingController();
  final pinCtl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(15),
          margin: EdgeInsets.all(15),
          child: Column(
            children: [
              TextField(
                controller: nameCtl,
                decoration: InputDecoration(
                  label: Text('Your Name'),
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  label: Text('PIN / Password'),
                ),
                controller: pinCtl,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>WalletsPage()));
                },
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
