import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

// back option
void nextScreen(context, page) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}

// no back option
void nextScreenReplace(context, page) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => page));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFf312783)
        ),
        textTheme: GoogleFonts.outfitTextTheme(
          Theme.of(context).textTheme
        ),
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}


// splash screen at the begining of the application
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      // After 3 seconds, navigate to the main screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()), // Replace HomeScreen with your desired screen
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'images/logo.png',
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> 
with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _showQuote = false; // Declare the boolean variable
  double _progress = 0; // initial progress value
  int _currentStep = 0;
  final _answerController = TextEditingController();
  final _numberController = TextEditingController();
  String _answerResult = '';
  String _answer = '';
  String _answer2 = '';
  String _answerResult2 = '';
  String _answer3 = '';
  String _answerResult3 = '';

  List<bool> _correctAnswers = [false, false, false, false];

  @override
  void initState() {
      super.initState();
      _controller = AnimationController(
        duration: const Duration(seconds: 3),
        vsync: this,
      );

      _animation = CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      );

      _controller.forward();
  }

  @override
  void dispose() {   
      _controller.dispose();
      super.dispose();
  }

  void _showCorrectAnswer() {
    setState(() {
      _answerResult = 'Correct!';
    });
  }

  void _showIncorrectAnswer() {
    setState(() {
      _answerResult = 'Incorrect!';
    });
  }

  final _pageController = PageController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // app bar
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              FadeTransition
              (
                opacity: _animation,
                child: const Text(
                  "SP",
                  style: TextStyle(color: Colors.white),
                  )
              )
            ],
          ),
        ),
      ),
      // body
      body: PageView(
        controller: _pageController,
        onPageChanged: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children:  [
          // Section 1
          ListView(
            children: [
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent, width: 2), // add a trendy border
                        borderRadius: BorderRadius.circular(10), // rounded corners
                    ),
                    padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center, // Add this line
                  children: [
                      const Text('Welcome to Programming!'),
                      const SizedBox(height: 10),
                      IconButton(
                        icon: const Icon(Icons.info),
                        onPressed: () {
                          setState(() {
                            _showQuote = true;
                          });
                        },
                      ),
                      _showQuote
                          ? const Text('“Code is like humor. When you have to explain it, it’s not funny anymore.” - Cory House')
                          : Container(),
                      const Divider(),
                      const Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        child: Text('History of Dart:'),
                        ),
                      const Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        child:  Text('Dart is a programming language developed by Google in 2011.'),
                        ),
                      const Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 10), // add padding
                        child: Text(
                          'The first version of Dart, version 0.0, was released in October 2011.',
                          style: TextStyle( // subtle color
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        child: Text('Dart 1.0 was released in November 2013, and since then, it has been constantly evolving.') ,
                        ),
                      const Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        child: Text('Dart is used to build web, mobile, and desktop applications, and is also used as a scripting language.'),
                        ),
                      const Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        child:  Text('2011: Dart was first announced by Google in October 2011.'),
                        ),
                      const Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        child:  Text('2013: Dart 1.0 was released in November 2013.'),
                        ),
                      const Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        child:  Text('2015: Dart 1.12 was released, which added support for async/await.'),
                        ),
                      const Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        child:  Text('2017: Dart 1.24 was released, which added support for type inference.'),
                        ),
                      const Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        child:  Text('2018: Dart 2.0 was released, which introduced a new runtime and a more concise syntax.'),
                        ),
                        ],
                      ), // add some padding
              ),
            ],
          ),
          // Section 2C
          ListView(
            children: [
              Container(
                alignment: Alignment.center,
                      decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent, width: 2), // add a trendy border
                      borderRadius: BorderRadius.circular(10), // rounded corners
                    ),
                    padding: const EdgeInsets.all(20),
                child: // Section 2
                    Center(
                      child: Column(
                        children: [
                          const Text('Variables and Data Types'),
                          const SizedBox(height: 10),
                          CircularProgressIndicator(value: _progress),
                          const SizedBox(height: 10),
                          const Text('What is the data type of the variable "x" in the following code: int x = 5;'),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  decoration: const InputDecoration(
                                    labelText: 'answer',
                                    hintText: 'Enter datatype',
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.blue),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.green),
                                    ),
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      _answer = value;
                                      _progress = _progress+1;
                                    });
                                  },
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.send),
                                onPressed: () {
                                  if (_answer == 'int') {
                                    setState(() {
                                      _answerResult = 'Correct!';
                                    });
                                  } else {
                                    setState(() {
                                      _answerResult = 'Incorrect. The correct answer is int.';
                                    });
                                  }
                                },
                              ),
                            ],
                          ),
                          Text(_answerResult),
                          const Divider(),
                          const Text('What is the purpose of the "final" keyword in Dart?'),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  decoration: const InputDecoration(
                                    labelText: 'answer',
                                    hintText: 'Enter keyword',
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.blue),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.green),
                                    ),
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      _answer2 = value;
                                    });
                                  },
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.send),
                                onPressed: () {
                                  if (_answer2 == 'to declare a constant') {
                                    setState(() {
                                      _answerResult2 = 'Correct!';
                                    });
                                  } else {
                                    setState(() {
                                      _answerResult2 = 'Incorrect. The correct answer is to declare a constant.';
                                    });
                                  }
                                },
                              ),
                            ],
                          ),
                          Text(_answerResult2),
                          const Divider(),
                          const Text('What is the difference between "var" and "dynamic" in Dart?'),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  decoration: const InputDecoration(
                                    labelText: 'answer',
                                    hintText: 'Enter datatype',
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.blue),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.green),
                                    ),
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      _answer3 = value;
                                    });
                                  },
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.send),
                                onPressed: () {
                                  if (_answer3 == 'var is for inferred type, dynamic is for explicit type') {
                                    setState(() {
                                      _answerResult3 = 'Correct!';
                                    });
                                  } else {
                                    setState(() {
                                      _answerResult3 = 'Incorrect. The correct answer is var is for inferred type, dynamic is for explicit type.';
                                    });
                                  }
                                },
                              ),
                            ],
                          ),
                          Text(_answerResult3),
                        ],
                      ),
                    ),
              ),
            ],
          ),
          // Section 3
          Stepper(
            steps: [
              Step(
                title: const Text('If-Else Statements'),
                content: DragTarget<String>(
                        onWillAccept: (data) => true,
                        onAccept: (data) {
                          setState(() {
                            if (data == 'correctAnswer') {
                              _correctAnswers[0] = true;
                            }
                          });
                        },
                        builder: (context, candidateData, rejectedData) {
                          return Column(
                            children: [
                              Text('Write a program to check if a number is even or odd.'),
                              Wrap(
                                spacing: 8,
                                runSpacing: 4,
                                children: [
                                  Draggable<String>(
                                    data: 'if (num % 2 == 0)',
                                    child: Text('if (num % 2 == 0)'),
                                    feedback: Text('if (num % 2 == 0)'),
                                  ),
                                  Draggable<String>(
                                    data: 'print("Even")',
                                    child: Text('print("Even")'),
                                    feedback: Text('print("Even")'),
                                  ),
                                  Draggable<String>(
                                    data: 'else',
                                    child: Text('else'),
                                    feedback: Text('else'),
                                  ),
                                  Draggable<String>(
                                    data: 'print("Odd")',
                                    child: Text('print("Odd")'),
                                    feedback: Text('print("Odd")'),
                                  ),
                                ],
                              ),
                              _correctAnswers[0]
                                  ? Text('Correct!', style: TextStyle(color: Colors.green))
                                  : Text(''),
                            ],
                          );
                        },
                      ),
      
                isActive: _currentStep >= 0,
              ),
              Step(
                title: const Text('Loops'),
                content: const Text('Write a program to print the numbers from 1 to 10.'),
                isActive: _currentStep >= 1,
              ),
              Step(
                title: const Text('Functions'),
                content: const Text('What is the purpose of a function in programming?'),
                isActive: _currentStep >= 2,
              ),
              Step(
                title: const Text('Arrays'),
                content: const Text('What is the difference between an array and a list?'),
                isActive: _currentStep >= 3,
              ),
            ],
            onStepTapped: (int index) {
              setState(() {
                _currentStep = index;
              });
            },
            currentStep: _currentStep,
          ),
        ],
      ),
      // end of body
    );
  }
}