import 'package:flutter/material.dart';
import 'package:lesson36_statemanagement/screens/log_in/create_account.dart';
// import 'package:lesson36_statemanagement/screens/pages/page1.dart';
import 'package:lesson36_statemanagement/screens/pages2/page_1.dart';
import 'package:lesson36_statemanagement/screens/pages2/page_2.dart';
import 'package:lesson36_statemanagement/screens/pages2/page_3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MainScreen2 extends StatefulWidget {
  const MainScreen2({super.key});

  @override
  State<MainScreen2> createState() => _MainScreen2State();
}

class _MainScreen2State extends State<MainScreen2> {
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 500,
            child: PageView(
              controller: _controller,
              children: [
                Page_1(),
                Page_2(),
                Page_3(),
              ],
            ),
          ),
          SmoothPageIndicator(
            controller: _controller,
            count: 3,
            effect: ExpandingDotsEffect(
              dotHeight: 5,
              dotWidth: 5,
              activeDotColor: Colors.deepPurple,
              dotColor: Colors.deepPurple.shade100,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Set Your Schedule",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Text("Quickly see your upcoming event, task,",
              style: TextStyle(color: Colors.grey)),
          Text(
            "conference calls, weather, and more",
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Color.fromARGB(255, 77, 168, 243)),
            height: 50,
            width: 350,
            child: Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => CreateAccount()));
                },
                child: Text(
                  "Get Started",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
