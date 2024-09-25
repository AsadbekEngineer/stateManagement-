import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:lesson36_statemanagement/screens/confirm/confirm_phone.dart';
import 'package:lesson36_statemanagement/screens/log_in/register_screen.dart';

class Numberpage extends StatefulWidget {
  const Numberpage({super.key});

  @override
  State<Numberpage> createState() => _NumberpageState();
}
class _NumberpageState extends State<Numberpage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  var _keyForm = GlobalKey<FormState>();
  var _numberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 40, right: 20, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => RegisterScreen()));
              },
              icon: Icon(CupertinoIcons.back),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Country of Residence",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Add your Phone number for Verification ID",
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(
              height: 20,
            ),
            //! FORM
            Expanded(
              child: Form(
                key: _keyForm, // Attach the GlobalKey here
                child: Column(
                  children: [
                    IntlPhoneField(
                      controller: _numberController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(20),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey.shade300)),
                        labelText: 'Phone Number',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                        ),
                      ),
                      initialCountryCode: 'UZ',
                      onChanged: (phone) {
                        print(phone.completeNumber);
                      },
                      validator: (phone) {
                        if (phone == null || phone.toString().length < 5) {
                          return "Please enter a valid phone number";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(height: 0),
                    Row(
                      children: [
                        Text("Send it another way ?"),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Email",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                    Spacer(), // This will push the "CONTINUE" button to the bottom
                    //! CONTINUE
                    Align(
                      alignment: Alignment.bottomCenter,
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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          ConfirmPhonePage()));
                            }
                          },
                          child: Center(
                            child: Text(
                              "CONTINUE",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 17),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    //! TERMS PRIVACY POLICY
                    Center(
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
            ),
          ],
        ),
      ),
    );
  }
}
