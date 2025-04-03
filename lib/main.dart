import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 231, 247, 242),
                Color(0xFFBFEFFF),
              ],
            ),
          ),
          child: Center(
            child: MainScreen(),
          ),
        ),
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  int counter = 0;
  String tree = "tree.png";
  bool showLeaves = false;
  List<Offset> leaves = [];

  void increaseCounter() {
    setState(() {
      counter ++;
      if (counter > 100) {
        showLeaves = true;
        if (counter % 5 == 0) {
          double x = Random().nextDouble() * 200;
          double y = Random().nextDouble() * 200;
          leaves.add(Offset(x, y));
        }
      }
    });
  }

  void decreaseCounter() {
    setState(() {
      if (counter > 0) {
        counter--;
      } else {
        counter = 0;
      }
      if (counter >= 100 && counter%5==0 && leaves.isNotEmpty) {
        leaves.removeLast();
      }
      
    });
  }

  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(9.0),
                child: Text('Select your tree:',
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.black87,
                        fontSize: 15)),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: CircleBorder(),
                  ),
                  onPressed: () {
                    setState(() {
                      tree = "tree.png";
                    });
                  },
                  child: Image.asset(
                    'lib/assets/tree.png',
                    width: 30,
                    height: 30,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: CircleBorder(),
                  ),
                  onPressed: () {
                    setState(() {
                      tree = "palm.png";
                    });
                  },
                  child: Image.asset(
                    'lib/assets/palm.png',
                    width: 30,
                    height: 30,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.only(top: 30, bottom: 50),
            child: Center(
              child: Text(
                "$counter",
                style: const TextStyle(
                  fontSize: 70,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 42, 217, 112),
                ),
              ),
            ),
          ),
          Stack(
            children: [
              Container(
                height: counter <= 100
                    ? (50.0 + (counter * 3)).clamp(370, 600)
                    : 370,
                padding: EdgeInsets.only(bottom: 20),
                alignment: Alignment.bottomCenter,
                child: Image.asset(
                  'lib/assets/$tree',
                  height: 50.0 + (counter * 3),
                  fit: BoxFit.contain,
                ),
              ),
              for (var leaf in leaves)
                Positioned(
                  right: leaf.dx + 160,
                  top: leaf.dy + 55,
                  child: tree == "tree.png"
                      ? Image.asset(
                          'lib/assets/flower.png',
                          height: 30,
                          width: 30,
                          fit: BoxFit.contain,
                        )
                      : Image.asset(
                          'lib/assets/coconut.png',
                          height: 30,
                          width: 30,
                          fit: BoxFit.contain,
                        ),
                ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 100, right: 28),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      backgroundColor: Color.fromARGB(255, 255, 255, 255),
                    ),
                    onPressed: () {
                      decreaseCounter();
                      print("New counter: $counter");
                    },
                    child: Text("-",
                        style: TextStyle(
                            fontSize: 60,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(132, 0, 0, 0))),
                  ),
                ),
                SizedBox(
                  width: 200,
                  height: 200,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(40),
                      backgroundColor: Color(0xFF4CAF50),
                    ),
                    onPressed: () {
                      increaseCounter();
                      print("Counter: $counter");
                    },
                    child: Text("PRESS ME",
                        style: TextStyle(
                          fontFamily: 'Roboto',
                            //fontStyle: FontStyle.italic,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(243, 0, 0, 0))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          counter = 0;
                          showLeaves = false;
                          leaves.clear();
                        });
                      },
                      child: Text("Reset",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(243, 0, 0, 0))),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
