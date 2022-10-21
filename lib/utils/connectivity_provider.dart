import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class ConnectivityProvider with ChangeNotifier {
  ConnectivityProvider() : super() {
    checkConnectivity();
  }
  late bool? _isConnected = false;
  bool? get isConnected => _isConnected;

  checkConnectivity() async {
    Connectivity connectivityResult = Connectivity();
    connectivityResult.onConnectivityChanged.listen((event) async {
      if (event == ConnectivityResult.none) {
        _isConnected = false;
        notifyListeners();
      } else {
        _isConnected = true;
        notifyListeners();
      }
    });
  }
}
