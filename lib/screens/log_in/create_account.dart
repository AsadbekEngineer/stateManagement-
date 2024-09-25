import 'package:flutter/material.dart';
import 'package:lesson36_statemanagement/screens/log_in/log_in.dart';

class CreateAccount extends StatelessWidget {
  const CreateAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(left: 40, right: 40, top: 10, bottom: 10),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "Let's start your",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              Text(
                "Schedule activity",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 14,
              ),
              Text(
                "Quickly see your upcoming event, task,",
                style: TextStyle(color: Colors.grey),
              ),
              Text(
                "conference calls, weather, and more",
                style: TextStyle(color: Colors.grey),
              ),
              //! The phone image
              SizedBox(
                height: 300,
                child: Image(
                    image: NetworkImage(
                        "https://static.vecteezy.com/system/resources/previews/021/599/408/original/smartphone-mockup-on-transparent-background-file-format-hand-holding-mobile-phone-with-transparent-screen-for-advertising-online-png.png")),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  //!Create account button LOGIC
                },
                //! Creat Account container
                child: Container(
                  height: 70,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue,
                  ),
                  child: Center(
                    child: Text(
                      "Create Account",
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              //! Brand Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BrandButton(
                    imageUrl:
                        "https://png.pngtree.com/png-vector/20230817/ourmid/pngtree-google-internet-icon-vector-png-image_9183287.png",
                    text: 'Google',
                  ),
                  BrandButton(
                      imageUrl:
                          'https://www.freepnglogos.com/uploads/apple-logo-png/apple-logo-png-logo-apple-tmsoft-27.png',
                      text: 'Apple'),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("You have an account?"),
                  //! Log in TextButton
                  TextButton(
                      onPressed: () {
                        //!Log in logic
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => LogInScreen(),
                            ));
                      },
                      child: Text(
                        "Log in",
                        style: TextStyle(color: Colors.blue),
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BrandButton extends StatelessWidget {
  String imageUrl;
  String text;
  BrandButton({required this.imageUrl, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      height: 60,
      width: MediaQuery.of(context).size.width / 2 - 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[200],
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 30,
              width: 30,
              child: Image(image: NetworkImage(imageUrl)),
            ),
            Text(
              text,
              style: TextStyle(fontSize: 17),
            ),
          ],
        ),
      ),
    );
  }
}
