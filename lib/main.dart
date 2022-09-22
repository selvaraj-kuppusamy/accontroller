import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Accontroller',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool status1 = false;
  bool status2 = false;
  bool status3 = false;
  bool status4 = false;

  int temperature = 0;
  int fan = 20;
  int index = -1;
  int index1 = -1;
  int photo = 1;

  final Color iconColor1 = Colors.white;
  final Color iconColor2 = Colors.blue;

  final Color disableColor = Colors.white;
  final Color enableColor = Colors.blue;

  void tempincrement() {
    setState(() {
      if (!status1) {
        temperature = 0;
      }
      else if (temperature >= 32) {
        temperature = 32;
      }
      else {
        temperature++;
      }
    });
  }

  void tempdecrement() {
    setState(() {
      if (!status1) {
        temperature = 0;
      } else if (temperature <= 16) {
        temperature = 16;
      } else {
        temperature--;
      }
    });
  }

  void fanincrement() {
    setState(() {
       if (fan >= 75) {
      fan = 75;
      }
       else {
         fan++;
       }
    });
  }

  void fandecrement() {
    setState(() {
      if (fan <= 16) {
        fan = 16;
      } else {
        fan--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFFf4f6f8), Color(0xFFdae6f9)])),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Text(
                      'Air Conditioner',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Center(
                  child: Text(
                    'Voltas',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                '$temperature',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 40.0,
                                ),
                              ),
                              Image.asset(
                                'assets/celsius.png',
                                height: 50,
                                width: 50,
                              ),
                              if (photo == 1)
                                Image.asset(
                                  'assets/1.png',
                                  height: 50,
                                  width: 50,
                                )
                              else if (photo == 2)
                                Image.asset(
                                  'assets/2.png',
                                  height: 50,
                                  width: 50,
                                )
                              else if (photo == 3)
                                Image.asset(
                                  'assets/3.png',
                                  height: 50,
                                  width: 50,
                                )
                              else if (photo == 4)
                                Image.asset(
                                  'assets/4.png',
                                  height: 50,
                                  width: 50,
                                )
                              else if (photo == 5)
                                Image.asset(
                                  'assets/5.png',
                                  height: 50,
                                  width: 50,
                                ),
                            ],
                          ),
                          const SizedBox(height: 20.0),
                          const Text(
                            'POWER COOLING',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15.0,
                            ),
                          ),
                          const SizedBox(height: 20.0),
                          Row(
                            children: [
                              if (status2 == false)
                                Image.asset(
                                  'assets/thermometer2.jpg',
                                  height: 50,
                                  width: 50,
                                )
                              else if (status2 == true)
                                Image.asset(
                                  'assets/thermometer1.png',
                                  height: 50,
                                  width: 50,
                                ),
                              const SizedBox(width: 50.0),
                              FlutterSwitch(
                                width: 60.0,
                                activeColor: const Color(0xff48b923),
                                height: 30.0,
                                valueFontSize: 15.0,
                                toggleSize: 20.0,
                                value: status1,
                                borderRadius: 30.0,
                                showOnOff: true,
                                onToggle: (val) {
                                  setState(() {
                                    status1 = val;
                                    if (!status1) {
                                      temperature = 0;
                                    } else {
                                      temperature = 16;
                                    }
                                  });
                                },
                              ),
                            ],
                          ),
                          //end
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          width: 29.0,
                          height: 200.0,
                          color: const Color(0xFFe5eff9),
                          child: Column(
                            children: [
                              Column(
                                children: const [
                                  Text('High'),
                                  SizedBox(
                                    height: 150.0,
                                  ),
                                  Text('Low'),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 2.0,
                      height: 230.0,
                      color: Colors.white,
                      child: const VerticalDivider(
                        width: 20,
                        thickness: 2,
                        color: Colors.black,
                      ),
                    ),
                    Container(
                      height: 220.0,
                      width: 50.0,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 3,
                          color: Colors.white,
                          style: BorderStyle.solid,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30.0)),
                        color: Colors.red,
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: 70.0,
                            width: 50.0,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  width: 3,
                                  color: const Color(0xfff5f9fd),
                                  style: BorderStyle.solid,
                                ),
                                borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(22.0),
                                    topLeft: Radius.circular(22.0)),
                                color: const Color(0xfff5f9fd)),
                          ),
                          Container(
                            height: 144.0,
                            width: 50.0,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 3,
                                color: const Color(0xff89bcff),
                                style: BorderStyle.solid,
                              ),
                              borderRadius: const BorderRadius.only(
                                  bottomRight: Radius.circular(22.0),
                                  bottomLeft: Radius.circular(22.0)),
                              color: const Color(0xff89bcff),
                            ),
                            child: Center(
                              child: Text(
                                '$fan°C',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              FloatingActionButton(
                                onPressed: tempdecrement,
                                tooltip: 'decrement',
                                backgroundColor: Colors.white,
                                child: const Icon(
                                  Icons.remove,
                                  color: Colors.black,
                                ),
                              ),
                              const Text('     TEMP     '),
                              FloatingActionButton(
                                onPressed: tempincrement,
                                tooltip: 'increment',
                                backgroundColor: Colors.white,
                                child:
                                    const Icon(Icons.add, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              FloatingActionButton(
                                onPressed: fandecrement,
                                tooltip: 'decrement',
                                backgroundColor: Colors.white,
                                child: const Icon(
                                  Icons.remove,
                                  color: Colors.black,
                                ),
                              ),
                              const Text('     FAN      '),
                              FloatingActionButton(
                                onPressed: fanincrement,
                                tooltip: 'increment',
                                backgroundColor: Colors.white,
                                child:
                                    const Icon(Icons.add, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          height: 55.0,
                          width: 200.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              const Text('     SWING      '),
                              FlutterSwitch(
                                width: 60.0,
                                activeColor: const Color(0xff48b923),
                                height: 30.0,
                                valueFontSize: 15.0,
                                toggleSize: 20.0,
                                value: status2,
                                borderRadius: 30.0,
                                showOnOff: true,
                                onToggle: (val) {
                                  setState(() {
                                    status2 = val;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          height: 55.0,
                          width: 200.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              const Text('     HOLD      '),
                              FlutterSwitch(
                                width: 60.0,
                                activeColor: const Color(0xff48b923),
                                height: 30.0,
                                valueFontSize: 15.0,
                                toggleSize: 20.0,
                                value: status3,
                                borderRadius: 30.0,
                                showOnOff: true,
                                onToggle: (val) {
                                  setState(() {
                                    status3 = val;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          height: 55.0,
                          width: 200.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              const Text('     LAMP      '),
                              FlutterSwitch(
                                width: 60.0,
                                activeColor: const Color(0xff48b923),
                                height: 30.0,
                                valueFontSize: 15.0,
                                toggleSize: 20.0,
                                value: status4,
                                borderRadius: 30.0,
                                showOnOff: true,
                                onToggle: (val) {
                                  setState(() {
                                    status4 = val;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 20.0,
                                ),
                                const Text(
                                  '    Mode    ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 25.0,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      photo = 1;
                                      index = 1;
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: const CircleBorder(),
                                    backgroundColor:
                                        index == 1 ? enableColor : disableColor,
                                    padding: const EdgeInsets.all(25.0),
                                  ),
                                  child: const Text(
                                    'TURBO',
                                  ),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      index = 2;
                                      photo = 2;
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: const CircleBorder(),
                                    backgroundColor:
                                        index == 2 ? enableColor : disableColor,
                                    padding: const EdgeInsets.all(25.0),
                                  ),
                                  child: const Text('ECO'),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      index = 3;
                                      photo = 3;
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: const CircleBorder(),
                                    backgroundColor:
                                        index == 3 ? enableColor : disableColor,
                                    padding: const EdgeInsets.all(25.0),
                                  ),
                                  child: const Text('TRY'),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      index = 4;
                                      photo = 4;
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: const CircleBorder(),
                                    backgroundColor:
                                        index == 4 ? enableColor : disableColor,
                                    padding: const EdgeInsets.all(25.0),
                                  ),
                                  child: const Text(
                                    'AUTO',
                                  ),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      index = 5;
                                      photo = 5;
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: const CircleBorder(),
                                    backgroundColor:
                                        index == 5 ? enableColor : disableColor,
                                    padding: const EdgeInsets.all(25.0),
                                  ),
                                  child: const Text('COOL'),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
