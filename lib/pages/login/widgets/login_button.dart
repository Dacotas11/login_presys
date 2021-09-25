import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:login_presys/colors.dart';

import '../login_controller.dart';

class LoginButton extends StatelessWidget {
  final bool inverted;
  const LoginButton({
    Key? key,
    this.inverted = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      child: Text(
        'INICIAR SESION',
        style:
            TextStyle(color: inverted ? AppColors.primaryColor : Colors.white),
      ),
      onPressed: () {
        if (LoginController.submit()) {
          Navigator.pushNamed(context, 'home');
        }
      },
      color: inverted ? Colors.white : AppColors.primaryColor,
      borderRadius: BorderRadius.circular(30),
    );
  }
}
