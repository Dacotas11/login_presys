import 'package:flutter/material.dart';
import 'package:login_presys/pages/home/home_page.dart';
import 'package:login_presys/pages/login/login_page.dart';
import 'package:login_presys/pages/login/login_page_mobile.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
      routes: {
        "home": (_) => HomePage(),
        "login": (_) => LoginPage(),
      },
    );
  }
}
