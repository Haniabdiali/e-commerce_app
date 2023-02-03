import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:loginform/screens/cart.dart';

class OrderItems extends StatefulWidget {
  var producct;
  OrderItems(this.producct);
  //const OrderItems({super.key});

  @override
  State<OrderItems> createState() => _OrderItemsState();
}

class _OrderItemsState extends State<OrderItems> {
  Future addToCart() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var currentUser = _auth.currentUser;
    CollectionReference _collectionRef =
        FirebaseFirestore.instance.collection("user-order");
    return _collectionRef
        .doc(currentUser!.email)
        .collection("items")
        .doc()
        .set({
      "name": widget.producct["name"],
      "prise": widget.producct["prise"],
      "imgUrl": widget.producct["imgUrl"],
    }).then((value) => print("Added to cart"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 7, 37, 189),
        centerTitle: true,
        title: Text('Product Detail'),
      ),
      backgroundColor: Color.fromARGB(255, 234, 232, 232),
      body: SafeArea(
          child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 400,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 253, 253),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50)),
            ),
            child: Image.network(
              widget.producct['imgUrl'],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            widget.producct['name'],
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 7, 37, 189)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.favorite,
                      color: Color.fromARGB(255, 7, 37, 189),
                    ),
                    Icon(Icons.favorite,
                        color: Color.fromARGB(255, 7, 37, 189)),
                    Icon(Icons.favorite,
                        color: Color.fromARGB(255, 7, 37, 189)),
                    Icon(Icons.favorite,
                        color: Color.fromARGB(255, 115, 115, 116)),
                  ],
                ),
                Text(
                  "\$" + widget.producct['prise'].toString(),
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 7, 37, 189)),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'In marketing, a product is an object, or system, or service made available , or service made available In marketing, a product is an object, or system, or service made available for consumer use as of the consumer demand In marketing, a product is an object, or system, or service made available',
              style: TextStyle(
                  color: Color.fromARGB(255, 88, 87, 87), fontSize: 17),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          SizedBox(
            width: 200,
            height: 56,
            child: ElevatedButton(
              onPressed: () => {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => Cart())),
                addToCart(),
              },
              child: Text(
                "Add to cart",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 7, 37, 189),
                elevation: 3,
              ),
            ),
          ),
        ],
      )),
    );
  }
}
