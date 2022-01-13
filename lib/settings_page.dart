import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  var myInitialItem = 'English';
  List<String> items = ['English', 'Spanish'];

  bool switchValue = true;

  void _showDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: const Text('Sign Out'),
          content: const Text('Do you really want to sign out?'),
          actions: [
            MaterialButton(
              onPressed: () {},
              child: const Text('Yes'),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

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
                          const EdgeInsets.only(top: 70, left: 90, bottom: 10),
                      child: const Text(
                        "settings",
                        style: TextStyle(
                            fontSize: 50,
                            color: Colors.black,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                  ],
                ),
                Row(children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 650,
                    decoration: BoxDecoration(
                        color: const Color(0xffECE8FF),
                        borderRadius: BorderRadius.circular(20.0)),
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Row(
                          children: const [
                            Padding(
                              padding: EdgeInsets.only(top: 50, left: 140),
                              child: CircleAvatar(
                                radius: 50,
                                backgroundColor: Color(0xff7b61ff),
                                child: Text(
                                  "A",
                                  style: TextStyle(
                                    fontSize: 65,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, top: 50.0),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                height: 300,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: ListView(
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    padding: const EdgeInsets.all(0),
                                    children: ListTile
                                        .divideTiles(context: context, tiles: [
                                      ListTile(
                                        title: TextField(
                                          controller: TextEditingController(
                                              text: "Amey Erdenebileg"),
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Color(0xff7b61ff),
                                                  width: 3),
                                            ),
                                            enabledBorder: InputBorder.none,
                                            errorBorder: InputBorder.none,
                                            disabledBorder: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                      ListTile(
                                        title: TextField(
                                          controller: TextEditingController(
                                              text:
                                                  "erdenebileg.amey@gmail.com"),
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Color(0xff7b61ff),
                                                  width: 3),
                                            ),
                                            enabledBorder: InputBorder.none,
                                            errorBorder: InputBorder.none,
                                            disabledBorder: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                      ListTile(
                                        title: TextField(
                                          obscureText: true,
                                          controller: TextEditingController(
                                              text: "password"),
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Color(0xff7b61ff),
                                                  width: 3),
                                            ),
                                            enabledBorder: InputBorder.none,
                                            errorBorder: InputBorder.none,
                                            disabledBorder: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                      ListTile(
                                        title: DropdownButtonHideUnderline(
                                          child: DropdownButton<String>(
                                            onChanged: (value) {
                                              myInitialItem = value!;
                                              setState(() {});
                                            },
                                            value: myInitialItem,
                                            items: items.map((item) {
                                              return DropdownMenuItem(
                                                  value: item,
                                                  child: Text(item));
                                            }).toList(),
                                          ),
                                        ),
                                      ),
                                      ListTile(
                                        leading: const Text(
                                          'Notifications',
                                          style: TextStyle(
                                            fontSize: 17,
                                            color: Colors.black,
                                          ),
                                        ),
                                        trailing: Switch.adaptive(
                                            activeColor:
                                                const Color(0xff7b16ff),
                                            value: switchValue,
                                            onChanged: (switchValue) =>
                                                setState(() =>
                                                    this.switchValue =
                                                        switchValue)),
                                      ),
                                    ]).toList(),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 135.0, top: 60.0),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  onSurface: const Color(0xff7b61ff),
                                  primary: const Color(0xff7b61ff),
                                  onPrimary: Colors.white,
                                ),
                                onPressed: () {
                                  _showDialog();
                                },
                                child: const Text(
                                  'Sign out',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w800),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ]),
              ],
            ),
          ),
        ));
  }
}
