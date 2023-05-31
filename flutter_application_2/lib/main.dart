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
  int _counter1=0,_counter2=0;
  void increment(){
    setState(() {_counter1++;});
  }
  void decrement(){
    setState(() {_counter1--;});
  }
  void increment2(){
    setState(() {_counter2++;});
  }
  void decrement2(){
    setState(() {_counter2--;});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter App"),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // const Text("Hello World", style: TextStyle(color: Colors.red, fontSize: 24, fontWeight: FontWeight.bold)),
                Text("Team A : $_counter1", style: const TextStyle(color: Colors.blue, fontSize: 24, fontWeight: FontWeight.bold)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: increment, 
                      child: const Icon(Icons.add)
                      ),
                      const SizedBox(width: 5,),
                    ElevatedButton(
                      onPressed: decrement, 
                      child: const Icon(Icons.remove)
                      ),
                  ],
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // const Text("Hello World", style: TextStyle(color: Colors.red, fontSize: 24, fontWeight: FontWeight.bold)),
                Text("Team B : $_counter2", style: const TextStyle(color: Colors.blue, fontSize: 24, fontWeight: FontWeight.bold)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(shape: const CircleBorder()),
                      onPressed: increment2, 
                      child: const Padding(
                        padding: EdgeInsets.all(9),
                        child: Icon(Icons.add)
                        )
                      ),
                    
                    const SizedBox(width: 5,),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(shape: const CircleBorder()),
                      onPressed: decrement2, 
                      child: const Padding(
                        padding: EdgeInsets.all(9),
                        child: Icon(Icons.remove)
                        )
                      ),
                  ],
                )
              ],
            ),
          ],
        )
      ),
    );
  }
}