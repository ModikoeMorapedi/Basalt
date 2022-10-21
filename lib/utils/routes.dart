import 'package:basalt_stock_app/utils/connectivity_provider.dart';
import 'package:basalt_stock_app/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../views/no_internet_view.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) {
      final isConnected =
          Provider.of<ConnectivityProvider>(context).isConnected;
      if (!isConnected!) {
        return NoInternetView();
      }
      switch (settings.name) {
        case '/HomeView':
          return HomeView();
      }
      return HomeView();
    });
  }
}
