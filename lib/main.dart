import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: MainScreen(),
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
  void increaseCounter() {
    setState(() {
      counter++;
    });
  }
  void decreaseCounter() {
    setState(() {
      if (counter > 0){
        counter--;
      } else {
        counter = 0;
      }
      
    });
  }

  Widget build(BuildContext context) {
    return Center(
        child: Column(
          children: [
            SizedBox(
              height: 200
              ),
            Padding(
              padding: const EdgeInsets.only(top: 30, bottom:50),
              child: Text("$counter",
                  style: const TextStyle(
                      fontSize: 70,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 42, 194, 217))),
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
                    onPressed: (){
                    decreaseCounter();
                    print("New counter: $counter");
                  }, child: Text("-",style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold, color: const Color.fromARGB(132, 0, 0, 0)))),
                ),
                SizedBox(
                    width: 200,
                    height: 200,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(40),
                          backgroundColor: Color.fromARGB(255, 125, 231, 229),
                        ),
                        onPressed: () {
                          increaseCounter();
                          print("Counter: $counter");
                        },
                       child: Text("Press me", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: const Color.fromARGB(148, 0, 0, 0)))),
                ),
              ],
            ),
          ],
        ));
  }
}
