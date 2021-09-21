import 'package:delivery/screens/MainScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [Provider<Color>.value(value: Colors.yellow)],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Navigating(),
        theme: ThemeData(
            primarySwatch: Colors.green,
            visualDensity: VisualDensity.adaptivePlatformDensity),
      ),
    );
  }
}
