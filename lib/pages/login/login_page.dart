import 'package:flutter/material.dart';
import 'package:login_presys/pages/login/login_page_desktop.dart';
import 'package:login_presys/pages/login/login_page_mobile.dart';
import 'package:login_presys/pages/login/login_page_tablet.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth < 600) {
          return LoginPageMobile();
        } else if (constraints.maxWidth < 900) {
          return LoginPageTablet();
        } else {
          return LoginPageDesktop();
        }
      },
    );
  }
}
