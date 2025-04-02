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
                Color.fromARGB(255, 186, 233, 218),
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
String tree= "tree.png";

  void increaseCounter() {
    setState(() {
      counter++;
    });
  }

  void decreaseCounter() {
    setState(() {
      if (counter > 0) {
        counter--;
      } else {
        counter = 0;
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
          Row(
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
                    backgroundColor: Color.fromARGB(255, 124, 234, 190),
                  ),
                  onPressed: () {
                    increaseCounter();
                    print("Counter: $counter");
                  },
                  child: Text("Press me",
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(243, 0, 0, 0))),
                ),
              ),
            ],
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 25),
              child: Text(
                'Your tree:',
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Colors.black87,
                    fontSize: 22),
              ),
            ),
          ),
          Container(
            height: (50.0 + (counter * 3)).clamp(200, 600),
            padding: EdgeInsets.only(bottom: 20),
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              'lib/assets/$tree',
              height: 50.0 + (counter * 3),
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
