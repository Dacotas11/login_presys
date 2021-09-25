import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_presys/colors.dart';
import 'package:login_presys/pages/login/widgets/login_button.dart';
import 'package:login_presys/pages/login/widgets/login_form.dart';

class LoginPageTablet extends StatefulWidget {
  const LoginPageTablet({Key? key}) : super(key: key);

  @override
  _LoginPageTabletState createState() => _LoginPageTabletState();
}

class _LoginPageTabletState extends State<LoginPageTablet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
              child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/img/login_icon.png'),
                Text(
                  'PRESYS',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                )
              ],
            ),
          ),
          Expanded(
              child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                color: AppColors.primaryColor,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('BIENVENIDO DE NUEVO',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white)),
                  SizedBox(height: 50),
                  LoginPageForm(),
                  SizedBox(height: 30),
                  LoginButton(inverted: true)
                ],
              ),
            ],
          ))
        ],
      ))),
    );
  }
}
