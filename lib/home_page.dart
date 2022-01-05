import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List habitData = ['habit one', 'habit two', 'habit three'];

  // void insertHabit() {
  //   final newIndex = habitData.length;
  //   const newHabit = 'habit four';
  //
  //   habitData.insert(newIndex, newHabit);
  //   print("adding habit");
  // }

  Widget buildSheet() => Container(
        child: Column(
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
              children: const [
                SizedBox(
                  width: 400,
                  child: Padding(
                    padding: EdgeInsets.only(left: 30.0, top: 10),
                    child: TextField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 3),
                        ),
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
      resizeToAvoidBottomInset: false,
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
                    color: const Color(0xffbed8ff),
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
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SizedBox(
          height: 60,
          width: 60,
          child: FloatingActionButton(
            backgroundColor: const Color(0xff7b61ff),
            onPressed: () => showModalBottomSheet(
              context: context,
              builder: (context) => buildSheet(),
            ),
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
