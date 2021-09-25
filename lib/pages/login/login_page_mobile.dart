import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:login_presys/pages/login/local_auth_controller.dart';
import 'package:login_presys/pages/login/login_controller.dart';
import 'package:login_presys/pages/login/widgets/login_button.dart';
import 'package:login_presys/pages/login/widgets/login_form.dart';

import '../../colors.dart';

class LoginPageMobile extends StatefulWidget {
  const LoginPageMobile({Key? key}) : super(key: key);

  @override
  _LoginPageMobileState createState() => _LoginPageMobileState();
}

class _LoginPageMobileState extends State<LoginPageMobile> {
  bool _hasBiometrics = false;
  var _authenticationIcon;

  @override
  void initState() {
    super.initState();
    inits();
  }

  Future<void> inits() async {
    _hasBiometrics = await LocalAuthController.hasBiometrics();
    if (_hasBiometrics) {
      final List listBiometrics = await LocalAuthController.listBiometrics();
      switch (listBiometrics[0]) {
        case BiometricType.face:
          _authenticationIcon = Icons.face_outlined;
          break;
        case BiometricType.fingerprint:
          _authenticationIcon = Icons.fingerprint_outlined;
          break;
      }
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, snapshot) {
      return Scaffold(
          body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 40),
              Text(
                'Bienvenido de nuevo',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 34,
                    color: AppColors.primaryColor),
              ),
              SizedBox(height: 60),
              Image.asset(
                'assets/img/login_icon.png',
                width: 265,
              ),
              SizedBox(height: 60),
              LoginPageForm(),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LoginButton(),
                  if (_hasBiometrics)
                    CupertinoButton(
                        child: Icon(
                          _authenticationIcon,
                          size: 50,
                          color: AppColors.primaryColor,
                        ),
                        onPressed: () async {
                          final isAuthenticated =
                              await LocalAuthController.authenticate();
                          if (isAuthenticated) {
                            Navigator.pushNamed(context, 'home');
                          }
                        })
                ],
              )
            ],
          ),
        ),
      ));
    });
  }
}
