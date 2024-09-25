import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lesson36_statemanagement/screens/confirm/last_page.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ConfirmPhonePage extends StatelessWidget {
  ConfirmPhonePage({super.key});

  final _keyForm = GlobalKey<FormState>();
  var _codeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 40, right: 20, left: 20),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(CupertinoIcons.back),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Confirm your phone number",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Check your message. We have sent you a code for Verification",
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(
                  height: 20,
                ),
                //! FORM
                Form(
                  //! PINCODETEXTFIELD
                  key: _keyForm,
                  child: PinCodeTextField(
                    controller: _codeController,
                    appContext: context,
                    length: 4,
                    onChanged: (value) {},
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 70,
                      fieldWidth: 100,
                      activeFillColor: Colors.white,
                      inactiveColor: Colors.grey
                          .shade300, // Color when the field is not filled or focused
                      selectedColor: Colors
                          .blue, // Color when the field is selected/focused
                      activeColor: Colors.blue,
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value.toString() == "2001") {
                        return null;
                      } else {
                        return "WRONG";
                      }
                    },
                  ),
                ),
              ],
            ),
            Positioned(
              right: 0,
              left: 0,
              bottom: 80,
              child: Container(
                height: 70,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blue,
                ),
                child: GestureDetector(
                  onTap: () {
                    if (_keyForm.currentState!.validate()) {
                      showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (context) => AlertDialog(
                                title: Text(
                                  "MESSAGE",
                                  style: TextStyle(fontSize: 14),
                                ),
                                content: Text(
                                  "YOUR ACCOUNT IS ACTIVE",
                                  style: TextStyle(fontSize: 20),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  LastPage()));
                                    },
                                    child: Text("Ok"),
                                  ),
                                ],
                              ));
                    }
                  },
                  child: Center(
                    child: Text(
                      "CONTINUE",
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  ),
                ),
              ),
            ),
            //! TEMRS AND POLICY
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Text("By continuing, you agree to Loana's terms"),
                  Text(
                    "Terms of Use & Privacy Policy",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
