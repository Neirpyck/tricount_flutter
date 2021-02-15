import 'package:flutter/material.dart';
import 'screens/CountScreen/ExpenseScreen/ExpenseScreen.dart';
import 'screens/CreateExpenseScreen/CreateExpenseScreen.dart';
import 'screens/CountScreen/CountScreen.dart';
import 'screens/HomeScreen/HomeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => HomePage(),
        'countPage': (BuildContext context) => CountScreen(),
        'createExpensePage': (BuildContext context) => CreateExpenseScreen(),
        'expensePage': (BuildContext context) => ExpenseScreen(),
      },
    );
  }
}
