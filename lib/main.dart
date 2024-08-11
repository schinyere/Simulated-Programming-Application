import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spa/lessonPaths.dart';
import 'package:spa/sections/sectionOne.dart';

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
  int _currentSection = 0;
  bool _section1Completed = true;
  bool _section2Completed = false;
  bool _section3Completed = false;

  List<bool?> _correctAnswers = List.filled(5, null);
  

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
                  "Roshly",
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
          // Section 2
          LessonPath(),
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
          // Section 3
        Stepper(
          steps: [
            Step(
              title: const Text('If-Else Statements'),
              content: DragTarget<String>(
                onWillAccept: (data) => true,
                onAccept: (data) {
                  setState(() {
                    if (data == 'if (number % 2 == 0) {\n  print("The number is even");\n} else {\n  print("The number is odd");\n}') {
                      _correctAnswers[0] = true;
                    } else {
                      _correctAnswers[0] = false;
                    }
                  });
                },
                builder: (context, candidateData, rejectedData) {
                  return Column(
                    children: [
                      const Text('Write a program to check if a number is even or odd.'),
                      _correctAnswers[0] == null
                      ? const Text('Drag Answer')
                      : _correctAnswers[0] != null && _correctAnswers[0]!
                        ? const Text('Correct!', style: TextStyle(color: Colors.green))
                        : const Text('Wrong!', style: TextStyle(color: Colors.red)),
                      const SizedBox(width: 30),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text('Answer 1'),
                                    content: const Text('if (number % 2 == 0) {\n  print("The number is even");\n} else {\n  print("The number is odd");\n}'),
                                    actions: [
                                      ElevatedButton(
                                        child: const Text('Close'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          child: Draggable<String>(
                            data: 'if (number % 2 == 0) {\n  print("The number is even");\n} else {\n  print("The number is odd");\n}',
                            feedback: Container(
                              decoration: BoxDecoration(
                                border: Border.all(width: 1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: const EdgeInsets.all(10),
                              child: const Text(
                                      '**if** ...',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    )
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(width: 1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: const EdgeInsets.all(10),
                              child: const Text(
                                'if .....',
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text('Answer 2'),
                                  content: const Text('if (number % 2 != 0) {\n  print("The number is even");\n} else {\n  print("The number is odd");\n}'),
                                  actions: [
                                    ElevatedButton(
                                      child: const Text('Close'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: Draggable<String>(
                            data: 'if (number % 2 != 0) {\n  print("The number is even");\n} else {\n  print("The number is odd");\n}',
                            feedback: Container(
                              decoration: BoxDecoration(
                                border: Border.all(width: 1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: const EdgeInsets.all(10),
                              child: const Text(
                                      '**if** ...',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    )
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(width: 1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: EdgeInsets.all(10),
                              child: const Text(
                                'if ...',
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text('Answer 3'),
                                  content: const Text('if (number % 3 == 0) {\n  print("The number is even");\n} else {\n  print("The number is odd");\n}'),
                                  actions: [
                                    ElevatedButton(
                                      child: const Text('Close'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: Draggable<String>(
                            data: 'if (number % 3 == 0) {\n  print("The number is even");\n} else {\n  print("The number is odd");\n}',
                            feedback: Container(
                              decoration: BoxDecoration(
                                border: Border.all(width: 1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: const EdgeInsets.all(10),
                              child: const Text(
                                      '**if** ...',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.pink,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    )
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(width: 1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: const EdgeInsets.all(10),
                              child: const Text(
                                'if ...',
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ),
                          ],
                        ),
                      )
                    ],
                  );
                },
              ),
              isActive: _currentStep >= 0,
            ),
            Step(
              title: const Text('For Loop Statements'),
              content: DragTarget<String>(
                onWillAccept: (data) => true,
                onAccept: (data) {
                  setState(() {
                    if (data == 'for (int i = 0; i < 5; i++) {\n  print(i);\n}') {
                      _correctAnswers[1] = true;
                    } else {
                      _correctAnswers[1] = false;
                    }
                  });
                },
                builder: (context, candidateData, rejectedData) {
                  return Column(
                    children: [
                      const Text('Write a program to print the numbers from 0 to 4.'),
                      _correctAnswers[1] == null
                      ? const Text('Drag Answer')
                      : _correctAnswers[1] != null && _correctAnswers[1]!
                        ? const Text('Correct!', style: TextStyle(color: Colors.green))
                        : const Text('Wrong!', style: TextStyle(color: Colors.red)),
                      const SizedBox(width: 30),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: const Text('Answer 1'),
                                      content: const Text('for (int i = 0; i < 5; i++) {\n  print(i);\n}'),
                                      actions: [
                                        ElevatedButton(
                                          child: const Text('Close'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: Draggable<String>(
                                data: 'for (int i = 0; i < 4; i++) {\n  print(i);\n}',
                                feedback: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 1),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  padding: const EdgeInsets.all(10),
                                  child: const Text(
                                    '**for** ...',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  )
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 1),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  padding: const EdgeInsets.all(10),
                                  child: const Text(
                                    'for ...',
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: const Text('Answer 2'),
                                      content: const Text('for (int i = 2; i < 5; i++) {\n  print(i);\n}'),
                                      actions: [
                                        ElevatedButton(
                                          child: const Text('Close'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: Draggable<String>(
                                data: 'for (int i = 0; i < 5; i++) {\n  print(i);\n}',
                                feedback: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 1),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  padding: const EdgeInsets.all(10),
                                  child: const Text(
                                    '**for** ...',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  )
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 1),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  padding: const EdgeInsets.all(10),
                                  child: const Text(
                                    'for ...',
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ),
                             GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: const Text('Answer 3'),
                                      content: const Text('for (int i = 0; i < 5; i++) {\n  print(i);\n}'),
                                      actions: [
                                        ElevatedButton(
                                          child: const Text('Close'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: Draggable<String>(
                                data: 'for (int i = 0; i < 5; i++) {\n  print(i);\n}',
                                feedback: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 1),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  padding: const EdgeInsets.all(10),
                                  child: const Text(
                                    '**for** ...',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  )
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 1),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  padding: const EdgeInsets.all(10),
                                  child: const Text(
                                    'for ...',
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  );
                },
              ),
              isActive: _currentStep >= 2,
            ),

            Step(
              title: const Text('List Operations'),
              content: DragTarget<String>(
                onWillAccept: (data) => true,
                onAccept: (data) {
                  setState(() {
                    if (data == 'List<int> numbers = [0, 1, 2, 3, 4];\nfor (int num in numbers) {\n  print(num);\n}') {
                      _correctAnswers[2] = true;
                    } else {
                      _correctAnswers[2] = false;
                    }
                  });
                },
                builder: (context, candidateData, rejectedData) {
                  return Column(
                    children: [
                      const Text('Write a program to print the numbers in a list from 0 to 4.'),
                      _correctAnswers[2] == null
                      ? const Text('Drag Answer')
                      : _correctAnswers[2] != null && _correctAnswers[2]!
                        ? const Text('Correct!', style: TextStyle(color: Colors.green))
                        : const Text('Wrong!', style: TextStyle(color: Colors.red)),
                      const SizedBox(width: 30),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: const Text('Answer 1'),
                                      content: const Text('List<int> numbers = [0, 1, 2, 3, 4];\nfor (int num in numbers) {\n  print(num);\n}'),
                                      actions: [
                                        ElevatedButton(
                                          child: const Text('Close'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: Draggable<String>(
                                data: 'List<int> numbers = [0, 1, 2, 3, 4];\nfor (int num in numbers) {\n  print(num);\n}',
                                feedback: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 1),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  padding: const EdgeInsets.all(10),
                                  child: const Text(
                                    '**List** ...',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  )
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 1),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  padding: const EdgeInsets.all(10),
                                  child: const Text(
                                    'List ...',
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ),
                            // Add more answer options here
                            GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: const Text('Answer 1'),
                                      content: const Text('List<int> numbers = [0, 1, 2, 3, 4];\nfor (int num in numbers) {\n  print(num);\n}'),
                                      actions: [
                                        ElevatedButton(
                                          child: const Text('Close'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: Draggable<String>(
                                data: 'List<int> numbers = 0, 1, 2, 3, 4;\nfor (int num in numbers) {\n  print(num);\n}',
                                feedback: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 1),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  padding: const EdgeInsets.all(10),
                                  child: const Text(
                                    '**List** ...',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  )
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 1),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  padding: const EdgeInsets.all(10),
                                  child: const Text(
                                    'List ...',
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: const Text('Answer 1'),
                                      content: const Text('List<int> numbers = [0, 1, 2, 3, 4];\nfor (int num in numbers) {\n  print(num);\n}'),
                                      actions: [
                                        ElevatedButton(
                                          child: const Text('Close'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: Draggable<String>(
                                data: 'List<int> numbers = [0, 1, 2, 3, 4];\nfor (int num in numbers) {\n  print(num);\n}',
                                feedback: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 1),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  padding: const EdgeInsets.all(10),
                                  child: const Text(
                                    '**List** ...',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  )
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 1),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  padding: const EdgeInsets.all(10),
                                  child: const Text(
                                    'List ...',
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  );
                },
              ),
              isActive: _currentStep >= 3,
            ),

            Step(
              title: const Text('Function Operations'),
              content: DragTarget<String>(
                onWillAccept: (data) => true,
                onAccept: (data) {
                  setState(() {
                    if (data == 'int add(int a, int b) {\n  return a + b;\n}') {
                      _correctAnswers[3] = true;
                    } else {
                      _correctAnswers[3] = false;
                    }
                  });
                },
                builder: (context, candidateData, rejectedData) {
                  return Column(
                    children: [
                      const Text('Write a function that takes two integers and returns their sum.'),
                      _correctAnswers[3] == null
                      ? const Text('Drag Answer')
                      : _correctAnswers[3] != null && _correctAnswers[3]!
                        ? const Text('Correct!', style: TextStyle(color: Colors.green))
                        : const Text('Wrong!', style: TextStyle(color: Colors.red)),
                      const SizedBox(width: 30),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: const Text('Answer 1'),
                                      content: const Text('add(int a, int b) {\n  return a + b;\n}'),
                                      actions: [
                                        ElevatedButton(
                                          child: const Text('Close'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: Draggable<String>(
                                data: 'int add(int a, int b) {\n  return a + b;\n}',
                                feedback: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 1),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  padding: const EdgeInsets.all(10),
                                  child: const Text(
                                    '**Function** ...',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  )
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 1),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  padding: const EdgeInsets.all(10),
                                  child: const Text(
                                    'Function',
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ),
                            // Add more answer options here
                            GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: const Text('Answer 1'),
                                      content: const Text('int add(int a, int b) {\n  return a + b;\n}'),
                                      actions: [
                                        ElevatedButton(
                                          child: const Text('Close'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: Draggable<String>(
                                data: 'int add(int a) {\n  return a + b;\n}',
                                feedback: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 1),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  padding: const EdgeInsets.all(10),
                                  child: const Text(
                                    '**Function** ...',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  )
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 1),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  padding: const EdgeInsets.all(10),
                                  child: const Text(
                                    'Function',
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ),

                            GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: const Text('Answer 1'),
                                      content: const Text('int add() {\n  return a + b;\n}'),
                                      actions: [
                                        ElevatedButton(
                                          child: const Text('Close'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: Draggable<String>(
                                data: 'int add(int a, int b) {\n  return a + b;\n}',
                                feedback: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 1),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  padding: const EdgeInsets.all(10),
                                  child: const Text(
                                    '**Function** ...',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  )
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 1),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  padding: const EdgeInsets.all(10),
                                  child: const Text(
                                    'Function',
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  );
                },
              ),
              isActive: _currentStep >= 4,
            ),
            // variables
            Step(
              title: const Text('Variable Operations'),
              content: DragTarget<String>(
                onWillAccept: (data) => true,
                onAccept: (data) {
                  setState(() {
                    if (data == 'int x = 5;\nint y = 10;\nprint(x + y);') {
                      _correctAnswers[3] = true;
                    } else {
                      _correctAnswers[3] = false;
                    }
                  });
                },
                builder: (context, candidateData, rejectedData) {
                  return Column(
                    children: [
                      const Text('Write a program to add two variables x and y.'),
                      _correctAnswers[3] == null
                          ? const Text('Drag Answer')
                          : _correctAnswers[3] != null && _correctAnswers[3]!
                              ? const Text('Correct!', style: TextStyle(color: Colors.green))
                              : const Text('Wrong!', style: TextStyle(color: Colors.red)),
                      const SizedBox(width: 30),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: const Text('Answer 1'),
                                      content: const Text('int x = 5;\nint y = 10;\nprint(x + y);'),
                                      actions: [
                                        ElevatedButton(
                                          child: const Text('Close'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: Draggable<String>(
                                data: 'int x = 5;\nint y = 10;\nprint(x + y);',
                                feedback: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 1),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  padding: const EdgeInsets.all(10),
                                  child: const Text(
                                    'int x = 5;\nint y = 10;\nprint(x + y);',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 1),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  padding: const EdgeInsets.all(10),
                                  child: const Text(
                                    'int x = 5;\nint y = 10;\nprint(x + y);',
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ),
                            // Add more answer options here
                          ],
                        ),
                      )
                    ],
                  );
                },
              ),
              isActive: _currentStep >= 4,
            ),
          ],
          onStepTapped: (int index) {
            setState(() {
              _currentStep = index;
            });
          },
          currentStep: _currentStep,
        )
        ],
      ),
      // end of body
    );
  }
}