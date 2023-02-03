import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginform/screens/cart.dart';
import 'package:loginform/screens/login.dart';
import 'package:loginform/screens/productdetails.dart';

import 'drawer.dart';

class Appbbar extends StatefulWidget {
  const Appbbar({super.key});

  @override
  State<Appbbar> createState() => _AppbbarState();
}

class _AppbbarState extends State<Appbbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 247, 247, 249),
      padding: EdgeInsets.all(25),
      child: Row(
        children: [
          GestureDetector(
            child: Icon(
              Icons.circle,
              size: 30,
              color: Color.fromARGB(255, 7, 37, 189),
            ),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => LoginForm()));
            },
          ),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              'kids shop',
              style: GoogleFonts.amarante(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 7, 37, 189)),
            ),
          ),
          Spacer(),
          Badge(
            badgeContent: Text(
              '7',
              style: TextStyle(color: Colors.white),
            ),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => Cart()));
              },
              child: Icon(
                Icons.shopping_cart,
                size: 30,
                color: Color.fromARGB(255, 7, 37, 189),
              ),
            ),
          )
        ],
      ),
    );
  }
}
