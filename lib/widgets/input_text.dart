import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_presys/colors.dart';

class InputText extends StatefulWidget {
  final IconData prefixIcon;
  final double prefixIconSize;
  final bool isObscure;
  final String hintText;
  final double width;
  final void Function(String)? onChanged;
  final TextInputType? keyboardType;
  final void Function(String)? onSubmitted;
  final void Function()? onEditingComplete;
  final TextInputAction? textInputAction;
  const InputText({
    Key? key,
    required this.prefixIcon,
    this.isObscure = false,
    this.hintText = '',
    this.width = double.infinity,
    this.prefixIconSize = 28,
    this.onChanged,
    this.keyboardType,
    this.onSubmitted,
    this.onEditingComplete,
    this.textInputAction,
  }) : super(key: key);

  @override
  _InputTextState createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  bool _obscureText = false;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isObscure;
  }

  void _changeObscure() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      child: TextField(
        obscureText: _obscureText,
        obscuringCharacter: '*',
        onChanged: widget.onChanged,
        keyboardType: widget.keyboardType,
        onSubmitted: widget.onSubmitted,
        onEditingComplete: widget.onEditingComplete,
        textInputAction: widget.textInputAction,
        decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.primaryColor)),
          focusColor: AppColors.primaryColor,
          prefixIcon: Icon(
            widget.prefixIcon,
            size: widget.prefixIconSize,
            color: AppColors.primaryColor,
          ),
          hintText: widget.hintText,
          suffixIcon: widget.isObscure
              ? CupertinoButton(
                  child: Icon(
                    _obscureText
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: AppColors.primaryColor,
                  ),
                  onPressed: () {
                    _changeObscure();
                  },
                )
              : null,
        ),
      ),
    );
  }
}
