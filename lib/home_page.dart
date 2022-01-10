import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List habitData = ['habit one', 'habit two', 'habit three'];
  bool isButtonActive = false;
  TextEditingController? controller;

  @override
  void initState() {
    super.initState();

    controller = TextEditingController();
    controller!.addListener(() {
      final isButtonActive = controller!.text.isNotEmpty;

      setState(() => this.isButtonActive = isButtonActive);
    });
  }

  @override
  void dispose() {
    controller!.dispose();

    super.dispose();
  }

  // void insertHabit() {
  //   final newIndex = habitData.length;
  //   const newHabit = 'habit four';
  //
  //   habitData.insert(newIndex, newHabit);
  //   print("adding habit");
  // }

  Widget buildSheet() => Container(
        height: 500,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 30, top: 20),
                  child: Text(
                    'Add Habit',
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.w800),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 30, top: 20),
                  width: 400,
                  child: const TextField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 3),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xff7b61ff), width: 3),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: const [
                SizedBox(
                  width: 400,
                  child: Padding(
                    padding: EdgeInsets.only(left: 30.0, top: 40),
                    child: Text(
                      'How many days a week would you like to complete this habit?',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  width: 400,
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30.0, top: 20),
                    child: TextField(
                      maxLength: 1,
                      controller: controller,
                      keyboardType:
                          const TextInputType.numberWithOptions(signed: true),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 3),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xff7b61ff), width: 3),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 170, top: 50),
                  child: Container(
                    height: 50,
                    width: 100,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        onSurface: const Color(0xff7b61ff),
                        primary: const Color(0xff7b61ff),
                        onPrimary: Colors.white,
                      ),
                      onPressed: isButtonActive
                          ? () {
                              setState(() => isButtonActive = false);
                              controller!.clear();
                              Navigator.of(context).pop();
                            }
                          : null,
                      child: const Text(
                        'Done',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );

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
                        const EdgeInsets.only(top: 70, left: 110, bottom: 10),
                    child: const Text(
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
              Row(children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 650,
                  decoration: BoxDecoration(
                      color: const Color(0xffECE8FF),
                      borderRadius: BorderRadius.circular(20.0)),
                  alignment: Alignment.center,
                  child: ListView.builder(
                    itemCount: habitData.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Center(
                          child: SizedBox(
                            width: 3050,
                            height: 80,
                            child: Card(
                              child: ListTile(
                                title: Text('${habitData[index]}'),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ]),
              // Collapsable habit, expansion panel list
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SizedBox(
          height: 60,
          width: 60,
          child: FloatingActionButton(
            backgroundColor: const Color(0xff7b61ff),
            onPressed: () => showModalBottomSheet(
                shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20.0))),
                isDismissible: true,
                isScrollControlled: true,
                context: context,
                builder: (context) => SingleChildScrollView(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: buildSheet())),
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
