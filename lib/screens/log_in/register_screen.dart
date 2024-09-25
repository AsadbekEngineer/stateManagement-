import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lesson36_statemanagement/screens/log_in/create_account.dart';
import 'package:lesson36_statemanagement/screens/log_in/log_in.dart';
import 'package:lesson36_statemanagement/screens/log_in/numberPage.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool hidden = false;

  final _keyForm = GlobalKey<FormState>();

  final _nameController = TextEditingController();

  final _emailController = TextEditingController();

  final _passwordController1 = TextEditingController();

  final _passwordControllerFinal = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 40, bottom: 20),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
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
                "Register",
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
              //! FORM
              Form(
                key: _keyForm,
                child: Column(
                  children: [
                    //! Name TextField
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(20),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade300)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7),
                          ),
                          hintText: "Name",
                          hintStyle: TextStyle(color: Colors.grey),
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(left: 20, right: 5),
                            child: Icon(
                              Icons.person_outline,
                              color: Colors.grey,
                            ),
                          )),
                      validator: (value) {
                        if (value!.length < 4) {
                          return "Invalid input";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    //! Email TextField
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(20),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade300)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7),
                          ),
                          hintText: "name@gmail.com",
                          hintStyle: TextStyle(color: Colors.grey),
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(left: 20, right: 5),
                            child: Icon(
                              Icons.mail_outline,
                              color: Colors.grey,
                            ),
                          )),
                      validator: (value) {
                        if (value!.length < 4) {
                          return "Invalid input";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    //! Password TextField
                    TextFormField(
                      obscureText: hidden,
                      controller: _passwordController1,
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
                            borderSide:
                                BorderSide(color: Colors.grey.shade300)),
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
                    SizedBox(
                      height: 10,
                    ),
                    //! SECOND PASSWORD FIELD
                    TextFormField(
                      obscureText: hidden,
                      controller: _passwordControllerFinal,
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
                            borderSide:
                                BorderSide(color: Colors.grey.shade300)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                        ),
                      ),
                      validator: (value) {
                        if (value!.length < 4 ||
                            value != _passwordController1.text) {
                          return "Invalid Password";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ],
                ),
              ), //! END OF FORM
              SizedBox(
                height: 10,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("You have an account?"),
                    SizedBox(
                      width: 0,
                    ),
                    TextButton(
                      onPressed: () {
                        //! REgisterga o'tish
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => LogInScreen(),
                          ),
                        );
                      },
                      child: Text(
                        "Sign in here",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 80,
              ),
              //! Continue CONTAINER
              Container(
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
                              builder: (BuildContext context) => Numberpage()));
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
              SizedBox(
                height: 10,
              ),
              Center(
                child: Column(
                  children: [
                    Text("By continuing, you agree to Loana's terms"),
                    Text(
                      "Terms of Use & Privacy Policy",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
