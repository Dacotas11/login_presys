class LoginController {
  static String _userText = '';
  static String _passwordText = '';

  static void onUserChanged(String text) {
    _userText = text;
  }

  static void onPasswordChanged(String text) {
    _passwordText = text;
  }

  static bool submit() {
    print('$_userText, $_passwordText');
    if (_userText.toUpperCase() == 'albinson'.toUpperCase() &&
        _passwordText == '1234') {
      return true;
    } else {
      return false;
    }
  }
}
