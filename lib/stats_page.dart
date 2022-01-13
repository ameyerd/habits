import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class StatsPage extends StatefulWidget {
  const StatsPage({Key? key}) : super(key: key);

  @override
  _StatsPageState createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  final List<Color> gradientColors = [
    const Color(0xff7b61ff),
    const Color(0xffFF61C5),
  ];

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
                  child: ListView(
                    // stats
                    // info
                    children: [
                      Container(
                        padding: const EdgeInsets.all(15.0),
                        height: 200,
                        child: LineChart(
                          LineChartData(
                            borderData: FlBorderData(
                              border: Border.all(
                                width: 0.0,
                              ),
                            ),
                            minX: 0,
                            maxX: 6,
                            minY: 0,
                            maxY: 6,
                            gridData: FlGridData(
                              show: true,
                              getDrawingHorizontalLine: (value) {
                                return FlLine(
                                  color: Colors.white,
                                );
                              },
                            ),
                            titlesData: FlTitlesData(
                              leftTitles: SideTitles(showTitles: false),
                              bottomTitles: SideTitles(showTitles: true),
                            ),
                            lineBarsData: [
                              LineChartBarData(
                                spots: [
                                  FlSpot(0, 0),
                                  FlSpot(1, 1),
                                  FlSpot(2, 1),
                                  FlSpot(3, 2),
                                  FlSpot(4, 1),
                                  FlSpot(5, 3),
                                  FlSpot(6, 4)
                                ],
                                isCurved: true,
                                colors: gradientColors,
                                barWidth: 3,
                                belowBarData: BarAreaData(
                                  show: true,
                                  colors: gradientColors
                                      .map((color) => color.withOpacity(0.3))
                                      .toList(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: GridView(
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10,
                                  crossAxisCount: 2),
                          children: [
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 40, left: 30),
                                child: RichText(
                                  text: const TextSpan(
                                    text: '11',
                                    style: TextStyle(
                                      fontSize: 50,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff7b61ff),
                                    ),
                                    children: [
                                      TextSpan(
                                        text: ' days\n',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black,
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'Current Streak',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 40, left: 25),
                                child: RichText(
                                  text: const TextSpan(
                                    text: '64% \n',
                                    style: TextStyle(
                                      fontSize: 50,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff7b61ff),
                                    ),
                                    children: [
                                      TextSpan(
                                        text: 'Completion Rate',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 40, left: 30),
                                child: RichText(
                                  text: const TextSpan(
                                    text: '20',
                                    style: TextStyle(
                                      fontSize: 50,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff7b61ff),
                                    ),
                                    children: [
                                      TextSpan(
                                        text: ' days\n',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black,
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'Highest Streak',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 40, left: 40),
                                child: RichText(
                                  text: const TextSpan(
                                    text: '43 \n',
                                    style: TextStyle(
                                      fontSize: 50,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff7b61ff),
                                    ),
                                    children: [
                                      TextSpan(
                                        text: 'Total Done',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
