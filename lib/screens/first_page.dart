import 'package:flutter/material.dart';
import 'package:lesson36_statemanagement/main_screen2.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext) => MainScreen2()));
          },
          child: Container(
            height: 420,
            width: 420,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(220),
            ),
            child: Center(
              child: Text("Loopday App"),
            ),
          ),
        ),
      ),
    );
  }
}
