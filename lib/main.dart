import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:loginform/screens/login.dart';
import 'package:loginform/screens/productdetails.dart';
import 'package:loginform/screens/singup.dart';
import 'package:loginform/screens/splash_screen.dart';
import 'package:loginform/widgets/bottomnavbar.dart';

import 'firebase_options.dart';
import 'widgets/products.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LoginForm(),
  ));
}
