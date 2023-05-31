import 'package:flutter_application_3/bmi.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      theme: ThemeData.dark(),
      home: const MyHomePage(title: 'BMI Calculator'),
    );
  }
}

enum Gender{male, female, other}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _counter1 = 50, _counter2 = 20;
  double _height = 150, bmi=0;
  Gender gender = Gender.other;

  void increment1() {
    setState(() {
      _counter1++;
    });
  }

  void increment2() {
    setState(() {
      _counter2++;
    });
  }

  void decrement1() {
    setState(() {
      _counter1--;
    });
  }

  void decrement2() {
    setState(() {
      _counter2--;
    });
  }

  void calculateBMI(){
    bmi=_counter1/((_height/100)*(_height/100));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: (){
                      setState(() {
                        gender=Gender.male;
                      });
                    },
                    child: SizedBox(
                      height: 200,
                      width: 200,
                      child: Card(
                        elevation: 10,
                        color: gender==Gender.male?Colors.deepOrange:Colors.orange,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "Male",
                              style: TextStyle(
                                fontSize: 30,
                              ),
                            ),
                            Icon(
                              Icons.male,
                              size: 40,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ),
                Expanded(
                    child: InkWell(
                      onTap: (){
                        setState(() {
                          gender=Gender.female;
                        });
                      },
                        child: SizedBox(
                          height: 200,
                          width: 200,
                          child: Card(
                            color: gender==Gender.female?Colors.deepOrange:Colors.orange,
                            elevation: 10,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  "Female",
                                  style: TextStyle(
                                    fontSize: 30,
                                  ),
                                ),
                                Icon(
                                  Icons.female,
                                  size: 40,
                                ),
                              ],
                            ),
                          ),
                        )
                    )),
              ],
            ),
            Container(
              child: Card(
                margin: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const Text('Height', style: TextStyle(fontSize: 20),),
                    Text('${_height.toStringAsFixed(0)} cm', style: const TextStyle(fontSize: 20),),
                    Slider(
                      value: _height,
                      onChanged: (value) {
                        setState(() {
                          _height = value;
                        });
                      },
                      min: 50,
                      max: 300,
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: SizedBox(
                    height: 200,
                    width: 200,
                    child: Card(
                      elevation: 10,
                      color: Colors.orange,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Weight",
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "$_counter1 Kg",
                            style: const TextStyle(fontSize: 30),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  increment1();
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: const CircleBorder(),
                                  backgroundColor: Colors.black,
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(15),
                                  child: Icon(Icons.add),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  decrement1();
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: const CircleBorder(),
                                  backgroundColor: Colors.black,
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(15),
                                  child: Icon(Icons.remove),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: 200,
                    width: 200,
                    child: Card(
                      elevation: 10,
                      color: Colors.orange,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Age",
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            '$_counter2 Yr.',
                            style: const TextStyle(
                              fontSize: 30,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  increment2();
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  shape: const CircleBorder(),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(15),
                                  child: Icon(Icons.add),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  decrement2();
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  shape: const CircleBorder(),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(15),
                                  child: Icon(Icons.remove),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            ElevatedButton(onPressed: () {
              calculateBMI();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context)=>ResultPage(result: bmi.toStringAsFixed(2),)));
            }, child: const Text('Calculate'),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(20),
              textStyle: const TextStyle(fontSize: 24),
              backgroundColor: Colors.black,
            ),)
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}