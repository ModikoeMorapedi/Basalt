import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'utils/connectivity_provider.dart';
import 'utils/routes.dart';
import 'utils/service_locator.dart';
import 'viewModels/home_view_model.dart';
import 'views/home_view.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<HomeViewModel>(create: (_) => HomeViewModel()),
          ChangeNotifierProvider<ConnectivityProvider>(
              create: (_) => ConnectivityProvider()),
        ],
        child: MaterialApp(
          title: 'Stock  Exchange',
          onGenerateRoute: Routes.generateRoute,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: HomeView(),
          debugShowCheckedModeBanner: false,
        ));
  }
}
