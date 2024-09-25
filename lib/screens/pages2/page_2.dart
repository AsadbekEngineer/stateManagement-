import 'package:flutter/material.dart';

class Page_2 extends StatelessWidget {
  const Page_2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: EdgeInsets.all(40),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            color: Colors.grey[300],
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            "https://www.mwl-law.com/wp-content/uploads/2019/07/AUTO-TEXTING-WHILE-DRIVING.jpg"))),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
