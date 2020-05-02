import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To Do List',
      theme: ThemeData(primarySwatch: Colors.red, fontFamily: "IndieFlower"),
      navigatorKey: Modular.navigatorKey,
      initialRoute: '/',
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
