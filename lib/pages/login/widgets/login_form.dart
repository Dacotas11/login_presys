import 'package:flutter/material.dart';
import 'package:login_presys/pages/login/login_controller.dart';
import 'package:login_presys/widgets/input_text.dart';

class LoginPageForm extends StatelessWidget {
  const LoginPageForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: 350,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 15),
          InputText(
            prefixIcon: Icons.person_outline,
            prefixIconSize: 32,
            hintText: 'USUARIO',
            onChanged: (text) => LoginController.onUserChanged(text),
            textInputAction: TextInputAction.next,
          ),
          SizedBox(height: 13),
          InputText(
            prefixIcon: Icons.vpn_key_outlined,
            hintText: 'CONTRASEÑA',
            isObscure: true,
            onChanged: (text) => LoginController.onPasswordChanged(text),
            onEditingComplete: () {
              if (LoginController.submit())
                Navigator.pushNamed(context, 'home');
            },
          ),
        ],
      ),
    );
  }
}
