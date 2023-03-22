import 'package:flutter/material.dart';

class MCDrawerHeader extends StatelessWidget {
  const MCDrawerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const UserAccountsDrawerHeader(
      accountName: Text('Sagar Gurjar'),
      accountEmail: Text('sagargurjar@gmail.com'),
      currentAccountPicture: CircleAvatar(
        backgroundColor: Colors.white,
        child: FlutterLogo(
          size: 42.0,
        ),
      ),
    );
  }
}
