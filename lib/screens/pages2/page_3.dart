import 'package:flutter/material.dart';

class Page_3 extends StatelessWidget {
  const Page_3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: EdgeInsets.all(40),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            color: Colors.deepPurple[400],
            child: Center(
                child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    "https://media.idownloadblog.com/wp-content/uploads/2022/11/Calendar-app-iPhone.png"),
              )),
            )),
          ),
        ),
      ),
    );
  }
}
