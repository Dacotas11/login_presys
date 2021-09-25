import 'dart:io';

import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class LocalAuthController {
  static final _auth = LocalAuthentication();

  static Future<bool> hasBiometrics() async {
    if (Platform.isIOS || Platform.isAndroid) {
      try {
        return await _auth.canCheckBiometrics;
      } on PlatformException catch (e) {
        return false;
      }
    } else {
      return false;
    }
  }

  static Future<List> listBiometrics() async {
    if (await hasBiometrics()) {
      final biometrics = await _auth.getAvailableBiometrics();
      print(biometrics);
      return biometrics;
    }
    return [];
  }

  static Future<bool> authenticate() async {
    final isAvailable = await hasBiometrics();

    if (!isAvailable) return false;

    try {
      return await _auth.authenticate(
          localizedReason: 'Verifica tu identidad',
          biometricOnly: true,
          stickyAuth: true,
          useErrorDialogs: true);
    } on PlatformException catch (e) {
      return false;
    }
  }
}
