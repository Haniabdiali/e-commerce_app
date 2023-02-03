import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginform/screens/app.dart';
import 'package:loginform/screens/cart.dart';
import 'package:loginform/screens/category.dart';
import 'package:loginform/screens/login.dart';
import 'package:loginform/screens/productdetails.dart';
import 'package:loginform/widgets/order.dart';

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 234, 232, 232),
      body: SafeArea(
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection("Product").snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  Appbbar(),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Text(
                      'Products',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 7, 37, 189)),
                    ),
                  ),
                  Categoires(),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    child: Text(
                      'New Products',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 7, 37, 189)),
                    ),
                  ),
                  //second section
                  Expanded(
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 1,
                                mainAxisSpacing: 2,
                                mainAxisExtent: 320),
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: ((context, index) => Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Color.fromARGB(
                                              255, 255, 255, 255),
                                          borderRadius:
                                              BorderRadius.circular(16)),
                                      child: Column(
                                        children: [
                                          Container(
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Icon(
                                                    Icons.favorite_border,
                                                    color: Color.fromARGB(
                                                        255, 7, 37, 189),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          ClipRRect(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(16),
                                                topRight: Radius.circular(16)),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 20),
                                              child: InkWell(
                                                onTap: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (_) =>
                                                              OrderItems(
                                                                  snapshot.data!
                                                                          .docs[
                                                                      index])));
                                                },
                                                child: Image(
                                                    height: 150,
                                                    width: 350,
                                                    fit: BoxFit.fill,
                                                    image: NetworkImage(snapshot
                                                            .data!.docs[index]
                                                        ['imgUrl'])),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Column(
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.only(
                                                      bottom: 8, top: 10),
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    snapshot.data!.docs[index]
                                                        ["name"],
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Color.fromARGB(
                                                            255, 7, 37, 189)),
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Container(
                                                      padding: EdgeInsets.only(
                                                          top: 10),
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Text(
                                                        "\$" +
                                                            snapshot
                                                                .data!
                                                                .docs[index]
                                                                    ["prise"]
                                                                .toString(),
                                                        style:
                                                            GoogleFonts.andika(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        0,
                                                                        0,
                                                                        0)),
                                                      ),
                                                    ),
                                                    Icon(Icons.shopping_cart)
                                                  ],
                                                ),

                                                // Row(
                                                //   children: [
                                                //     Expanded(
                                                //       child: ElevatedButton(
                                                //           onPressed: () {},
                                                //           child:
                                                //               Text("buy now")),
                                                //     ),
                                                //   ],
                                                // ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ))),
                  ),
                ],
              );
            }
            if (snapshot.hasError) {
              return (Center(
                child: Text("errr"),
              ));
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
