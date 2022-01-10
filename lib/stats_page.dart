import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatsPage extends StatefulWidget {
  const StatsPage({Key? key}) : super(key: key);

  @override
  _StatsPageState createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              // Habits Title
              Row(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.only(top: 70, left: 80, bottom: 10),
                    child: const Text(
                      "statistics",
                      style: TextStyle(
                          fontSize: 50,
                          color: Colors.black,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                ],
              ),
              // Curved box container
              Row(children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 650,
                  decoration: BoxDecoration(
                      color: const Color(0xffECE8FF),
                      borderRadius: BorderRadius.circular(20.0)),
                  alignment: Alignment.center,
                  child: Text('hi'),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
