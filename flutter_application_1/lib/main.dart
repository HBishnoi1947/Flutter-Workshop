import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App',
      // theme: ThemeData.dark(),
      theme: ThemeData(
        primarySwatch: Colors.amber
      ),
      home: const LandingPage(),
    );
  }
}


class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int counter=0;
  void increment(){
    setState(() {counter++;});
  }
  void decrement(){
    setState(() {counter--;});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Hello World", style: TextStyle(color: Colors.red, fontSize: 24, fontWeight: FontWeight.bold)),
            Text("Welcome To SGSITS : $counter", style: const TextStyle(color: Colors.blue, fontSize: 24, fontWeight: FontWeight.bold)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: increment, 
                  child: const Icon(Icons.add)
                  ),
                ElevatedButton(
                  onPressed: decrement, 
                  child: const Icon(Icons.remove)
                  ),
              ],
            )
          ],
        )
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {counter++; setState(() {});},
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}