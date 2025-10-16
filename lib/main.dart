import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:custom_bottom_nav/screens/home_screen.dart';
import 'package:custom_bottom_nav/models/app_state.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (context) => AppState(), child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Bottom Nav Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
