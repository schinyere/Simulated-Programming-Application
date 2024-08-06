import 'package:flutter/material.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class LessonPath extends StatefulWidget {
  @override
  _LessonPathState createState() => _LessonPathState();
}

class _LessonPathState extends State<LessonPath> {
  int _currentSection = 0;
  bool _section1Completed = false;
  bool _section2Completed = false;
  bool _section3Completed = false;
  bool _section4Completed = false;
  bool _section5Completed = false;
  bool _section6Completed = false;
  bool _section7Completed = false;
  bool _section8Completed = false;
  bool _section9Completed = false;
  bool _section10Completed = false;

  
  @override
  void initState() {
    super.initState();
    _loadCompletionStatus();
  }

  void completeSection1() {
    setState(() {
      _section1Completed = true;
    });
    _saveCompletionStatus();
  }

  void completeSection2() {
    setState(() {
      _section2Completed = true;
    });
    _saveCompletionStatus();
  }

  void completeSection3() {
    setState(() {
      _section3Completed = true;
    });
    _saveCompletionStatus();
  }

  void completeSection4() {
    setState(() {
      _section4Completed = true;
    });
    _saveCompletionStatus();
  }

  _loadCompletionStatus() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _section1Completed = prefs.getBool('section1Completed')?? false;
      _section2Completed = prefs.getBool('section2Completed')?? false;
      _section3Completed = prefs.getBool('section3Completed')?? false;
      _section4Completed = prefs.getBool('section4Completed')?? false;
    });
  }

  _saveCompletionStatus() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('section1Completed', _section1Completed);
    prefs.setBool('section2Completed', _section2Completed);
    prefs.setBool('section3Completed', _section3Completed);
    prefs.setBool('section4Completed', _section4Completed);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            // Variables and Datatypes
            Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _currentSection = 1;
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Section1(completeSection1)),
                      );
                    },
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                          color: _section1Completed? Colors.green : Colors.grey,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.all(10),
                        child: Text('Datatypes'),
                      ),
                    ),
                  ),
                ],
              ),
            const SizedBox(height: 15),
            // Conditionals
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: _section1Completed && !_section2Completed
                      ? () {
                          setState(() {
                            _currentSection = 2;
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Section2(completeSection2)),
                          );
                        }
                      : null,
                  child: Container(
                    decoration: BoxDecoration(
                      color: _section2Completed ? Colors.green : Colors.grey,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Text('Conditionals'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            // Functions
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: _section1Completed && _section2Completed && !_section3Completed
                      ? () {
                          setState(() {
                            _currentSection = 3;
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Section3(completeSection3)),
                          );
                        }
                      : null,
                  child: Container(
                    decoration: BoxDecoration(
                      color: _section3Completed ? Colors.green : Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Text('Functions'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            // Functions
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: _section1Completed && _section2Completed && !_section3Completed
                      ? () {
                          setState(() {
                            _currentSection = 3;
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Section3(completeSection3)),
                          );
                        }
                      : null,
                  child: Container(
                    decoration: BoxDecoration(
                      color: _section3Completed ? Colors.green : Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Text('Data Structures'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Section1 extends StatefulWidget {
  final VoidCallback completeSection;

  Section1(this.completeSection);

  @override
  State<Section1> createState() => _Section1State();
}


class _Section1State extends State<Section1> {
  int _currentQuestion = 0;
  String _answer = '';
  String _answerResult = '';
  int _hearts = 5;
  bool _allAnswersCorrect = false;

  final List<Map<String, dynamic>> _questions = [
    
    {
      'question': 'What is the data type of the variable "x" in the following code: int x = 5;',
      'correctAnswer': 'int',
    },
    {
      'question': 'What is the purpose of the "final" keyword in Dart is to declare a ?',
      'correctAnswer': 'constant',
    },
    {
      'question': 'What is the difference between "var" and "dynamic" in Dart?',
      'correctAnswer': 'type',
    },
    {
      'question': 'What is the keyword used to define a function in Dart?',
      'correctAnswer': 'function',
    },
    {
      'question': 'What is the purpose of the "this" keyword in Dart?',
      'correctAnswer': 'reference',
    },
    {
      'question': 'What is the data type of the variable that can hold any type of value in Dart?',
      'correctAnswer': 'dynamic',
    },
    {
      'question': 'What is the keyword used to define a class in Dart?',
      'correctAnswer': 'class',
    },
    {
      'question': 'What is the purpose of the "super" keyword in Dart?',
      'correctAnswer': 'inheritance',
    },
    {
      'question': 'What is the keyword used to define an interface in Dart?',
      'correctAnswer': 'abstract',
    },
    {
      'question': 'What is the purpose of the "async" keyword in Dart?',
      'correctAnswer': 'asynchronous',
    },
    {
      'question': 'What is the keyword used to define a mixin in Dart?',
      'correctAnswer': 'mixin',
    },
    {
      'question': 'What is the purpose of the "await" keyword in Dart?',
      'correctAnswer': 'pause',
    },
    {
      'question': 'What is the keyword used to define a stream in Dart?',
      'correctAnswer': 'stream',
    },
    {
      'question': 'What is the purpose of the "yield" keyword in Dart?',
      'correctAnswer': 'produce',
    },
    {
      'question': 'What is the keyword used to define a library in Dart?',
      'correctAnswer': 'library',
    },
    {
      'question': 'What is the purpose of the "import" keyword in Dart?',
      'correctAnswer': 'include',
    },
    {
      'question': 'What is the keyword used to define a part in Dart?',
      'correctAnswer': 'part',
    },
    {
      'question': 'What is the purpose of the "export" keyword in Dart?',
      'correctAnswer': 'share',
    },
    {
      'question': 'What is the keyword used to define a factory in Dart?',
      'correctAnswer': 'factory',
    },
    {
      'question': 'What is the purpose of the "static" keyword in Dart?',
      'correctAnswer': 'shared',
    },
    {
      'question': 'What is the keyword used to define a getter in Dart?',
      'correctAnswer': 'get',
    },
    {
      'question': 'What is the purpose of the "set" keyword in Dart?',
      'correctAnswer': 'assign',
    },
    {
      'question': 'What is the keyword used to define a constructor in Dart?',
      'correctAnswer': 'constructor',
    },
    {
      'question': 'What is the purpose of the "try" keyword in Dart?',
      'correctAnswer': 'attempt',
    },
    {
      'question': 'What is the keyword used to define a catch block in Dart?',
      'correctAnswer': 'catch',
    },
    {
      'question': 'What is the purpose of the "finally" keyword in Dart?',
      'correctAnswer': 'cleanup',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const Text('Datatypes'),
              const Spacer(),
              Text('$_hearts'),
              const Icon(Icons.favorite, color: Colors.red),
            ],
          ),
        ),
      ),
      body: Center(
        child: ListView(
          children: [
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueAccent, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Image.asset('images/Learning-rafiki.png'),
                  Text(_questions[_currentQuestion]['question']),
                  const SizedBox(height: 10),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: const InputDecoration(
                                labelText: 'answer',
                                hintText: 'Enter answer',
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
                                });
                              },
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.send),
                            onPressed: () {
                              if (_answer == _questions[_currentQuestion]['correctAnswer']) {
                                setState(() {
                                  _answerResult = 'Correct!';
                                  if (_currentQuestion == _questions.length - 1) {
                                    _allAnswersCorrect = true;
                                  } else {
                                    _nextQuestion();
                                  }
                                });
                              } else {
                                setState(() {
                                  _answerResult = 'Incorrect. The correct answer is ${_questions[_currentQuestion]['correctAnswer']}.';
                                  _hearts = _hearts - 1;
                                });
                                _saveHearts();
                              }
                              _nextQuestion();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Text(_answerResult),
                ],
              ),
            ),
            _allAnswersCorrect
             ? ElevatedButton(
                  onPressed: () {
                    widget.completeSection();
                    Navigator.pop(context);
                  },
                  child: Text('Complete Section 1'),
                )
              : Container(),
          ],
        ),
      ),
    );
  }

  void _nextQuestion() {
    setState(() {
      _currentQuestion++;
      _answer = '';
      _answerResult = '';
    });
  }

  _saveHearts() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('hearts', _hearts);
  }
}

class Section2 extends StatefulWidget {
  final VoidCallback completeSection;

  Section2(this.completeSection);

  @override
  State<Section2> createState() => _Section2State();
}

class _Section2State extends State<Section2> {
  int _currentQuestion = 0;
  String _answer = '';
  String _answerResult = '';
  int _hearts = 5;
  bool _allAnswersCorrect = false;

  final List<Map<String, dynamic>> _questions = [
    {
    'question': 'What keyword is used to define a conditional statement in Dart?',
    'correctAnswer': 'if',
    },
    {
      'question': 'What keyword is used to define an alternative conditional statement in Dart?',
      'correctAnswer': 'else',
    },
    {
      'question': 'What keyword is used to define a series of conditional statements in Dart?',
      'correctAnswer': 'else if',
    },
    {
      'question': 'What operator is used to check if two values are equal in a conditional statement?',
      'correctAnswer': '==',
    },
    {
      'question': 'What operator is used to check if two values are not equal in a conditional statement?',
      'correctAnswer': '!=',
    },
    {
      'question': 'What operator is used to check if a value is greater than another in a conditional statement?',
      'correctAnswer': '>',
    },
    {
      'question': 'What operator is used to check if a value is less than another in a conditional statement?',
      'correctAnswer': '<',
    },
    {
      'question': 'What operator is used to check if a value is greater than or equal to another in a conditional statement?',
      'correctAnswer': '>=',
    },
    {
      'question': 'What operator is used to check if a value is less than or equal to another in a conditional statement?',
      'correctAnswer': '<=',
    },
    {
      'question': 'What keyword is used to check if a value is null in a conditional statement?',
      'correctAnswer': 'null',
    },
    {
      'question': 'What keyword is used to check if a value is not null in a conditional statement?',
      'correctAnswer': '!',
    },
    {
      'question': 'What keyword is used to perform a logical AND operation in a conditional statement?',
      'correctAnswer': '&&',
    },
    {
      'question': 'What keyword is used to perform a logical OR operation in a conditional statement?',
      'correctAnswer': '||',
    },
    {
      'question': 'What keyword is used to perform a logical NOT operation in a conditional statement?',
      'correctAnswer': '!',
    },
    {
      'question': 'What keyword is used to perform a ternary operation in a conditional statement?',
      'correctAnswer': '?:',
    },
    {
      'question': 'What keyword is used to perform a switch statement in a conditional statement?',
      'correctAnswer': 'switch',
    },
    {
      'question': 'What keyword is used to define a case in a switch statement?',
      'correctAnswer': 'case',
    },
    {
      'question': 'What keyword is used to define a default case in a switch statement?',
      'correctAnswer': 'default',
    },
    {
      'question': 'What keyword is used to break out of a switch statement?',
      'correctAnswer': 'break',
    },
    {
      'question': 'What keyword is used to continue to the next case in a switch statement?',
      'correctAnswer': 'continue',
    },
    {
      'question': 'What keyword is used to check if a value is contained in a list in a conditional statement?',
      'correctAnswer': 'in',
    },
    {
      'question': 'What keyword is used to check if a value is not contained in a list in a conditional statement?',
      'correctAnswer': '!in',
    },
    {
      'question': 'What keyword is used to check if a value is between two values in a conditional statement?',
      'correctAnswer': 'between',
    },
    {
      'question': 'What keyword is used to check if a value is not between two values in a conditional statement?',
      'correctAnswer': '!between',
    },
    {
      'question': 'What keyword is used to check if a value is null-aware in a conditional statement?',
      'correctAnswer': '?.',
    },
    
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const Text('Conditionals'),
              const Spacer(),
              Text('$_hearts'),
              const Icon(Icons.favorite, color: Colors.red),
            ],
          ),
        ),
      ),
      body: Center(
        child: ListView(
          children: [
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueAccent, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Image.asset('images/Thinking face-rafiki.png'),
                  Text(_questions[_currentQuestion]['question']),
                  const SizedBox(height: 10),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: const InputDecoration(
                                labelText: 'answer',
                                hintText: 'Enter answer',
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
                                });
                              },
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.send),
                            onPressed: () {
                              if (_answer == _questions[_currentQuestion]['correctAnswer']) {
                                setState(() {
                                  _answerResult = 'Correct!';
                                  if (_currentQuestion == _questions.length - 1) {
                                    _allAnswersCorrect = true;
                                  } else {
                                    _nextQuestion();
                                  }
                                });
                              } else {
                                setState(() {
                                  _answerResult = 'Incorrect. The correct answer is ${_questions[_currentQuestion]['correctAnswer']}.';
                                  _hearts = _hearts - 1;
                                });
                                _saveHearts();
                              }
                              _nextQuestion();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Text(_answerResult),
                ],
              ),
            ),
            _allAnswersCorrect
             ? ElevatedButton(
                  onPressed: () {
                    widget.completeSection();
                    Navigator.pop(context);
                  },
                  child: Text('Complete Section 1'),
                )
              : Container(),
          ],
        ),
      ),
    );
  }
  void _nextQuestion() {
    setState(() {
      _currentQuestion++;
      _answer = '';
      _answerResult = '';
    });
  }

  _saveHearts() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('hearts', _hearts);
  }
}

class Section3 extends StatefulWidget {
  final VoidCallback completeSection;

  Section3(this.completeSection);

  @override
  State<Section3> createState() => _Section3State();
}

class _Section3State extends State<Section3> {
  int _currentQuestion = 0;
  String _answer = '';
  String _answerResult = '';
  int _hearts = 5;
  bool _allAnswersCorrect = false;
  final List<Map<String, dynamic>> _questions = [
    {
    'question': 'What is the term for a function that does not return a value in Dart?',
    'correctAnswer': 'Void',
    },
    {
      'question': 'What is the keyword used to define a function parameter in Dart?',
      'correctAnswer': 'Required',
    },
    {
      'question': 'What is the keyword used to define an optional function parameter in Dart?',
      'correctAnswer': 'Optional',
    },
    {
      'question': 'What is the term for a function that can be used as an argument to another function in Dart?',
      'correctAnswer': 'Callback',
    },
    {
      'question': 'What is the term for a function that is defined inside another function in Dart?',
      'correctAnswer': 'Nested',
    },
    {
      'question': 'What is the term for a function that can be assigned to a variable in Dart?',
      'correctAnswer': 'Lambda',
    },
    {
      'question': 'What is the keyword used to define a function that can be used as a constructor in Dart?',
      'correctAnswer': 'Factory',
    },
    {
      'question': 'What is the term for a function that is used to initialize an object in Dart?',
      'correctAnswer': 'Constructor',
    },
    {
      'question': 'What is the term for a function that is used to perform a specific task in Dart?',
      'correctAnswer': 'Method',
    },
    {
      'question': 'What is the term for a function that is used to extend the functionality of a class in Dart?',
      'correctAnswer': 'Extension',
    },
    {
      'question': 'What is the keyword used to define a function that can be used as an event handler in Dart?',
      'correctAnswer': 'Async',
    },
    {
      'question': 'What is the term for a function that is used to handle asynchronous operations in Dart?',
      'correctAnswer': 'Future',
    },
    {
      'question': 'What is the term for a function that is used to handle errors in Dart?',
      'correctAnswer': 'Catch',
    },
    {
      'question': 'What is the term for a function that is used to throw an exception in Dart?',
      'correctAnswer': 'Throw',
    },
    {
      'question': 'What is the term for a function that is used to rethrow an exception in Dart?',
      'correctAnswer': 'Rethrow',
    },
    {
      'question': 'What is the term for a function that is used to define a recursive function in Dart?',
      'correctAnswer': 'Recursive',
    },
    {
      'question': 'What is the term for a function that is used to define a higher-order function in Dart?',
      'correctAnswer': 'Higher',
    },
    {
      'question': 'What is the term for a function that is used to define a pure function in Dart?',
      'correctAnswer': 'Pure',
    },
    {
      'question': 'What is the term for a function that is used to define a closure in Dart?',
      'correctAnswer': 'Closure',
    },
    {
      'question': 'What is the term for a function that is used to define a generator in Dart?',
      'correctAnswer': 'Generator',
    },
    {
      'question': 'What is the term for a function that is used to define an iterator in Dart?',
      'correctAnswer': 'Iterator',
    },
    {
      'question': 'What is the term for a function that is used to define a stream in Dart?',
      'correctAnswer': 'Stream',
    },
    {
      'question': 'What is the term for a function that is used to define a future in Dart?',
      'correctAnswer': 'Future',
    },
    {
      'question': 'What is the term for a function that is used to define a async/await in Dart?',
      'correctAnswer': 'Await',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Functions'),
      ),
      body: Center(
        child: ListView(
          children: [
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueAccent, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Image.asset('images/Stress-rafiki.png'),
                  Text(_questions[_currentQuestion]['question']),
                  const SizedBox(height: 10),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: const InputDecoration(
                                labelText: 'answer',
                                hintText: 'Enter answer',
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
                                });
                              },
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.send),
                            onPressed: () {
                              if (_answer == _questions[_currentQuestion]['correctAnswer']) {
                                setState(() {
                                  _answerResult = 'Correct!';
                                  if (_currentQuestion == _questions.length - 1) {
                                    _allAnswersCorrect = true;
                                  } else {
                                    _nextQuestion();
                                  }
                                });
                              } else {
                                setState(() {
                                  _answerResult = 'Incorrect. The correct answer is ${_questions[_currentQuestion]['correctAnswer']}.';
                                  _hearts = _hearts - 1;
                                });
                                _saveHearts();
                              }
                              _nextQuestion();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Text(_answerResult),
                ],
              ),
            ),
            _allAnswersCorrect
              ? ElevatedButton(
                  onPressed: () {
                    widget.completeSection();
                    Navigator.pop(context);
                  },
                  child: Text('Complete Section 1'),
                )
              : Container(),
          ],
        ),
      ),
    );
  }

  void _nextQuestion() {
    setState(() {
      _currentQuestion++;
      _answer = '';
      _answerResult = '';
    });
  }

  _saveHearts() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('hearts', _hearts);
  }
}