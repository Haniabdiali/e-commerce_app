import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 226, 226, 228),
      appBar: AppBar(
        title: Text('All Carts'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 7, 37, 189),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('user-order')
              .doc(FirebaseAuth.instance.currentUser!.email)
              .collection('items')
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text('error occured'),
              );
            }
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) => Column(
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.circular(20)),
                        margin: EdgeInsets.all(5),
                        padding: EdgeInsets.all(10),
                        child: ListTile(
                          title: Text(snapshot.data!.docs[index]['name']),
                          leading: Image.network(
                            snapshot.data!.docs[index]['imgUrl'],
                          ),
                          subtitle: Text("price \$" +
                              snapshot.data!.docs[index]['prise'].toString()),
                          trailing: Column(
                            children: [
                              GestureDetector(
                                child: Icon(
                                  Icons.delete,
                                  size: 30,
                                ),
                                onTap: () {
                                  FirebaseFirestore.instance
                                      .collection('user-order')
                                      .doc(FirebaseAuth
                                          .instance.currentUser!.email)
                                      .collection('items')
                                      .doc(snapshot.data!.docs[index].id)
                                      .delete();
                                },
                              ),
                              //Text('data')
                            ],
                          ),
                        )),
                  ],
                ),
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
