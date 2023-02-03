import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:loginform/screens/login.dart';

class SingupForm extends StatefulWidget {
  const SingupForm({super.key});

  @override
  State<SingupForm> createState() => _SingupForm();
}

class _SingupForm extends State<SingupForm> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool isLoading = false;
  register() async {
    try {
      isLoading = true;
      setState(() {});
      var response = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text, password: password.text);
      print("Success");
    } catch (e) {
      print(e);
    }
    isLoading = false;
    setState(() {});
  }

  bool? isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Container(
                    height: 400,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 2, 21, 114),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(800),
                            bottomRight: Radius.circular(800))),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 60),
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 2, 21, 114),
                                border:
                                    Border.all(color: Colors.cyan, width: 4),
                                borderRadius: BorderRadius.circular(100)),
                            child: Icon(
                              Icons.login_rounded,
                              color: Colors.white,
                              size: 80,
                            ),
                            width: 130,
                            height: 130,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            decoration: BoxDecoration(),
                            child: Text(
                              'Sing up',
                              style: GoogleFonts.acme(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(255, 223, 219, 219),
                  ),
                  child: TextField(
                      controller: email,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          hintText: 'enter email ',
                          hintStyle: GoogleFonts.amiko(
                              fontSize: 20,
                              color: Color.fromARGB(255, 145, 144, 144)),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.mail,
                            color: Color.fromARGB(255, 2, 21, 114),
                          ))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(255, 223, 219, 219),
                  ),
                  child: TextField(
                      controller: password,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                          hintText: 'enter password ',
                          hintStyle: GoogleFonts.amiko(
                              fontSize: 20,
                              color: Color.fromARGB(255, 145, 144, 144)),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.mail,
                            color: Color.fromARGB(255, 2, 21, 114),
                          ))),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                          value: isChecked,
                          onChanged: (newBool) {
                            setState(() {
                              isChecked = newBool;
                            });
                          }),
                      Text(
                        'Remember me',
                        style: GoogleFonts.amarante(
                            color: Colors.cyan, fontSize: 20),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 60,
              ),
              Center(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 25, right: 25),
                      child: Container(
                        width: double.infinity,
                        child: RawMaterialButton(
                          fillColor: Color.fromARGB(255, 2, 21, 114),
                          elevation: 0.0,
                          padding: EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) => LoginForm()));
                            register();
                          },
                          child: Text('Sign up ',
                              style: GoogleFonts.amarante(
                                  color: Colors.white, fontSize: 20)),
                        ),
                      ),
                    ),
                    // SizedBox(
                    //   height: 20,
                    // ),
                    // Row(
                    //   children: [
                    //     Icon(Icons.fec),
                    //     Icon(Icons.email),
                    //     Icon(Icons.chrome_reader_mode_sharp)
                    //   ],
                    // )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    ));
  }
}
