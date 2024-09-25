import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lesson36_statemanagement/screens/log_in/create_account.dart';
import 'package:lesson36_statemanagement/screens/log_in/register_screen.dart';

class LogInScreen extends StatefulWidget {
  LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final _keyForm = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool hidden = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome Back",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Let's Log in to Connect your email",
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(
                height: 20,
              ),
              //! Form
              Form(
                key: _keyForm,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  //! TextFields
                  children: [
                    //! Email TextField
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(20),
                        hintText: "name@example.com",
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(left: 20, right: 5),
                          child: Icon(
                            Icons.mail_outline,
                            color: Colors.grey,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.grey.shade300, width: 2.0)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7)),
                      ),
                      //! Validator
                      validator: (value) {
                        if (value!.length < 3 || !value.contains("@")) {
                          return "Invalid Email";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    //! TextField PASSWORD
                    TextFormField(
                      obscureText: hidden,
                      controller: _passwordController,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                hidden = !hidden;
                              });
                            },
                            icon: Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: Icon(
                                hidden
                                    ? CupertinoIcons.eye_slash
                                    : CupertinoIcons.eye,
                                color: Colors.grey,
                              ),
                            )),
                        contentPadding: EdgeInsets.all(20),
                        hintText: "12345678",
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(left: 20, right: 5),
                          child: Icon(
                            Icons.key,
                            color: Colors.grey,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.grey.shade300, width: 2.0)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                        ),
                      ),
                      validator: (value) {
                        if (value!.length < 4) {
                          return "Invalid Password";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ],
                ),
              ),
              //! The end of FORM
              SizedBox(
                height: 10,
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Forget your password?",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Dont you have an account?"),
                    SizedBox(
                      width: 0,
                    ),
                    TextButton(
                      onPressed: () {
                        //! REgisterga o'tish
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    RegisterScreen()));
                      },
                      child: Text(
                        "Sign up here",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 230,
              ),
              Container(
                height: 70,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blue,
                ),
                child: GestureDetector(
                  onTap: () {
                    if (_keyForm.currentState!.validate()) {}
                  },
                  child: Center(
                    child: Text(
                      "Log In",
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BrandButton(
                      imageUrl:
                          'https://png.pngtree.com/png-vector/20230817/ourmid/pngtree-google-internet-icon-vector-png-image_9183287.png',
                      text: "Google"),
                  BrandButton(
                      imageUrl:
                          'https://png.pngtree.com/png-vector/20230817/ourmid/pngtree-google-internet-icon-vector-png-image_9183287.png',
                      text: "Google"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
