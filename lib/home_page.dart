import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              // Habits Title
              Row(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.only(top: 70, left: 110, bottom: 10),
                    child: Text(
                      "habits",
                      style: TextStyle(
                          fontSize: 50,
                          color: Colors.black,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                ],
              ),
              // Curved box container
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 650,
                    decoration: BoxDecoration(
                        color: Color(0xffbed8ff),
                        borderRadius: BorderRadius.circular(20.0)),
                  ),
                ],
              ),
              // Collapsable habit, expansion panel list
            ],
          ),
        ));
  }
}
