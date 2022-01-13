import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List habits = ['drink water', 'workout', 'study'];
  Color _expandedColor = Colors.black;

  bool isButtonActive = false;
  TextEditingController? controller;

  TextEditingController _habitName = TextEditingController();

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
                  child: TextField(
                    controller: _habitName,
                    decoration: const InputDecoration(
                      hintText: 'Habit name',
                      hintStyle:
                          TextStyle(fontSize: 25, color: Color(0xffe5e5e5)),
                      filled: true,
                      fillColor: Color(0xfff6f6f6),
                      enabledBorder: InputBorder.none,
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
                        hintText: '#',
                        hintStyle:
                            TextStyle(fontSize: 25, color: Color(0xffe5e5e5)),
                        filled: true,
                        fillColor: Color(0xfff6f6f6),
                        enabledBorder: InputBorder.none,
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
                              var _habit = _habitName.text;
                              final newIndex = habits.length;

                              setState(() => isButtonActive = false);
                              controller!.clear();
                              Navigator.of(context).pop();
                              habits.insert(newIndex, _habit);
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
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
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
                  child: SizedBox(
                    height: 1000,
                    child: ListView(
                      children: [
                        LinearPercentIndicator(
                          animation: true,
                          padding: EdgeInsets.only(left: 100, bottom: 20),
                          width: 300,
                          lineHeight: 20,
                          percent: 0.7,
                          progressColor: const Color(0xff7b61ff),
                          backgroundColor: Colors.white,
                        ),
                        Container(
                          width: 360,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: habits.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                  child: Theme(
                                    data: Theme.of(context).copyWith(
                                        dividerColor: Colors.transparent),
                                    child: ExpansionTile(
                                      // onExpansionChanged: (expanded) {
                                      //   setState(() {
                                      //     if (expanded) {
                                      //       _expandedColor = const Color(0xff7b61ff);
                                      //     } else {
                                      //       _expandedColor = Colors.black;
                                      //     }
                                      //   });
                                      // },
                                      leading: const Icon(
                                        Icons.favorite,
                                        color: Color(0xffece8ff),
                                      ),
                                      title: Text(
                                        '${habits[index]}',
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      children: [
                                        ListTile(
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 40),
                                          onTap: () {},
                                          title: const Text('hi'),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
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

// class Habit {
//   int id;
//   String name;
//   int days;
//
//   Habit(this.id, this.name, this.days);
// }

// child: ListView.builder(
//   itemCount: habitData.length,
//   itemBuilder: (BuildContext context, int index) {
//     return Padding(
//       padding: const EdgeInsets.all(20.0),
//       child: Center(
//         child: SizedBox(
//           width: 3050,
//           height: 80,
//           child: Card(
//             child: ListTile(
//               title: Text('${habitData[index]}'),
//             ),
//           ),
//         ),
//       ),
//     );
//   },
// ),

// working  !!!
// Container(
// width: 400,
// child: ListView(
// children: [
// Padding(
// padding: const EdgeInsets.all(10.0),
// child: Card(
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(20.0)),
// child: ExpansionTile(
// leading: Icon(Icons.restaurant_menu_outlined),
// title: Text('Test'),
// children: [
// ListTile(
// contentPadding:
// EdgeInsets.symmetric(horizontal: 40),
// onTap: () {},
// title: Text('Test description'),
// ),
// ],
// ),
// ),
// ),
// ],
// ),
// ),
