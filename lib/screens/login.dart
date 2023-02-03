import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginform/screens/singup.dart';
import 'package:loginform/widgets/bottomnavbar.dart';

import 'splash_screen.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isLoading = false;
  login() async {
    try {
      isLoading = true;
      setState(() {});
      var response = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.text, password: password.text);
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => BottomNavBar()));
      print("Success");
    } catch (e) {
      print(e);
    }
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Container(
                  height: 400,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 2, 21, 114),
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(80))),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 60),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 2, 21, 114),
                              border: Border.all(color: Colors.cyan, width: 4),
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
                          margin: EdgeInsets.only(left: 250),
                          decoration: BoxDecoration(),
                          child: Text(
                            'Login Form',
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
            SizedBox(height: 30),
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
                      hintText: 'Enter email/phone ',
                      hintStyle: GoogleFonts.amiko(
                          fontSize: 20,
                          color: Color.fromARGB(255, 145, 144, 144)),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.mail,
                        color: Color.fromARGB(255, 2, 21, 114),
                      )),
                ),
              ),
            ),
            // SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 223, 219, 219),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: password,
                  keyboardType: TextInputType.visiblePassword,
                  cursorColor: Colors.grey,
                  decoration: InputDecoration(
                      hintText: 'Enter password',
                      hintStyle: GoogleFonts.amiko(
                          fontSize: 20,
                          color: Color.fromARGB(255, 145, 144, 144)),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Color.fromARGB(255, 2, 21, 114),
                      )),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: GestureDetector(
                    child: Text(
                      'Forget password',
                      style: GoogleFonts.amarante(
                          color: Color.fromARGB(255, 2, 21, 114), fontSize: 17),
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => SingupForm()));
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40,
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
                          login();
                        },
                        child: Text('Login ',
                            style: GoogleFonts.amarante(
                                color: Colors.white, fontSize: 20)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text('or',
                      style: GoogleFonts.arbutus(
                          color: Color.fromARGB(255, 2, 21, 114),
                          fontSize: 16)),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    child: RichText(
                      text: TextSpan(
                        text: "Don't have an account ",
                        style: GoogleFonts.amarante(
                            color: Colors.cyan, fontSize: 17),
                        children: [
                          TextSpan(
                              text: "Sign Up",
                              style: GoogleFonts.amarante(
                                  color: Color.fromARGB(255, 2, 21, 114),
                                  fontSize: 17))
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => SingupForm()));
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
