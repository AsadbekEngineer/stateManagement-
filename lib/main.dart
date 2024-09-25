import 'package:flutter/material.dart';
import 'package:lesson36_statemanagement/main_screen2.dart';
import 'package:lesson36_statemanagement/screens/confirm/confirm_phone.dart';
import 'package:lesson36_statemanagement/screens/confirm/last_page.dart';
import 'package:lesson36_statemanagement/screens/log_in/create_account.dart';
import 'package:lesson36_statemanagement/screens/log_in/log_in.dart';
import 'package:lesson36_statemanagement/screens/log_in/numberPage.dart';
import 'package:lesson36_statemanagement/screens/log_in/register_screen.dart';
import 'package:lesson36_statemanagement/screens/first_page.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: LastPage(),
      // home: ConfirmPhonePage(),
      // home: Numberpage(),
      // home: RegisterScreen(),
      // home: LogInScreen(),
      // home: CreateAccount(),
      // home: MainScreen2(),
      home: FirstPage(),
    );
  }
}
