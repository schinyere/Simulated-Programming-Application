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

  void completeSection5() {
    setState(() {
      _section4Completed = true;
    });
    _saveCompletionStatus();
  }

  void completeSection6() {
    setState(() {
      _section4Completed = true;
    });
    _saveCompletionStatus();
  }
  void completeSection7() {
    setState(() {
      _section4Completed = true;
    });
    _saveCompletionStatus();
  }

  void completeSection8() {
    setState(() {
      _section4Completed = true;
    });
    _saveCompletionStatus();
  }

  void completeSection9() {
    setState(() {
      _section4Completed = true;
    });
    _saveCompletionStatus();
  }

  void completeSection10() {
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
      _section5Completed = prefs.getBool('section5Completed')?? false;
      _section6Completed = prefs.getBool('section6Completed')?? false;
      _section7Completed = prefs.getBool('section7Completed')?? false;
      _section8Completed = prefs.getBool('section8Completed')?? false;
      _section9Completed = prefs.getBool('section9Completed')?? false;
      _section10Completed = prefs.getBool('section10Completed')?? false;
    });
  }

  _saveCompletionStatus() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('section1Completed', _section1Completed);
    prefs.setBool('section2Completed', _section2Completed);
    prefs.setBool('section3Completed', _section3Completed);
    prefs.setBool('section4Completed', _section4Completed);
    prefs.setBool('section5Completed', _section4Completed);
    prefs.setBool('section6Completed', _section4Completed);
    prefs.setBool('section7Completed', _section4Completed);
    prefs.setBool('section8Completed', _section4Completed);
    prefs.setBool('section9Completed', _section4Completed);
    prefs.setBool('section10Completed', _section4Completed);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            const Row(
              children: <Widget>[
                Expanded(
                  child: Divider(),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text('Start'),
                ),
                Expanded(
                  child: Divider(),
                ),
              ],
            ),
            // Variables and Datatypes 1
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
                        child: const Text('Datatypes'),
                      ),
                    ),
                  ),
                ],
              ),
              const Row(
              children: <Widget>[
                Expanded(
                  child: Divider(),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text('Beginners'),
                ),
                Expanded(
                  child: Divider(),
                ),
              ],
            ),
            const SizedBox(height: 15),
            // Conditionals 2
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
                    child: const Text('Conditionals'),
                  ),
                ),
              ],
            ),
            const Row(
              children: <Widget>[
                Expanded(
                  child: Divider(),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text('Intermediate'),
                ),
                Expanded(
                  child: Divider(),
                ),
              ],
            ),
            const SizedBox(height: 15),
            // Functions 3
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
                    child: const Text('Functions'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            // Data Structures
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
                    child: const Text('Data Structures'),
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
                    child: const Text('Functions'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            const Row(
              children: <Widget>[
                Expanded(
                  child: Divider(),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text('Advanced'),
                ),
                Expanded(
                  child: Divider(),
                ),
              ],
            ),
            const SizedBox(height: 15),
            // Object Oriented Programming
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: _section1Completed && _section2Completed && _section3Completed && !_section4Completed
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
                    child: const Text('Object Oriented Programming'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            // List and Collections
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: _section1Completed && _section2Completed && _section3Completed && _section4Completed && !_section5Completed
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
                    child: const Text('List and Collections'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            // Error Handling and Exceptions
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: _section1Completed && _section2Completed && _section3Completed && _section4Completed && _section5Completed && !_section6Completed
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
                    child: const Text('Error Handling and Exceptions'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            // Widgets and Layouts
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
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
                    child: const Text('Widgets and Layouts'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            // State Management
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
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
                    child: const Text('State Management'),
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

  const Section1(this.completeSection, {super.key});

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
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: 'Answer',
                                hintText: 'Enter answer',
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green),
                                ),
                                errorText: _answerResult, // Display the result below the TextField
                              ),
                              onChanged: (value) {
                                setState(() {
                                  _answer = value;
                                  _answerResult = ''; // Clear the result when the user types something
                                });
                              },
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.send),
                            onPressed: _answer.isNotEmpty // Disable the button if the answer is empty
                              ? () {
                                  if (_answer == _questions[_currentQuestion]['correctAnswer']) {
                                    setState(() {
                                      _answer = ''; // Clear the answer when it's correct
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
                                }
                              : null, // Disable the button if the answer is empty
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
                  child: const Text('Complete Section 1'),
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

  const Section2(this.completeSection, {super.key});

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
                      padding: const EdgeInsets.all(10),
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
                  child: const Text('Complete Section 1'),
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

  const Section3(this.completeSection, {super.key});

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
        title: const Text('Functions'),
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
                      padding: const EdgeInsets.all(10),
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
                  child: const Text('Complete Section 3'),
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


class Section4 extends StatefulWidget {
  final VoidCallback completeSection;

  const Section4(this.completeSection, {super.key});

  @override
  State<Section4> createState() => _Section4State();
}

class _Section4State extends State<Section4> {
  int _currentQuestion = 0;
  String _answer = '';
  String _answerResult = '';
  int _hearts = 5;
  bool _allAnswersCorrect = false;
  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'What is the concept of creating objects that contain data and functions that operate on that data?',
      'correctAnswer': 'Encapsulation',
    },
    {
      'question': 'What is the process of creating a new class based on an existing class?',
      'correctAnswer': 'Inheritance',
    },
    {
      'question': 'What is the ability of an object to take on multiple forms?',
      'correctAnswer': 'Polymorphism',
    },
    {
      'question': 'What is the concept of hiding implementation details and showing only necessary information?',
      'correctAnswer': 'Abstraction',
    },
    {
      'question': 'What is the relationship between two classes where one class is a specialized version of the other?',
      'correctAnswer': 'Inheritance',
    },
    {
      'question': 'What is the process of creating objects from a class?',
      'correctAnswer': 'Instantiation',
    },
    {
      'question': 'What is the concept of bundling data and methods that operate on that data?',
      'correctAnswer': 'Encapsulation',
    },
    {
      'question': 'What is the ability of an object to respond to a message?',
      'correctAnswer': 'Responsiveness',
    },
    {
      'question': 'What is the concept of creating a new class that is a modified version of an existing class?',
      'correctAnswer': 'Subclassing',
    },
    {
      'question': 'What is the relationship between two classes where one class is a generalization of the other?',
      'correctAnswer': 'Generalization',
    },
    {
      'question': 'What is the concept of hiding internal implementation details?',
      'correctAnswer': 'Encapsulation',
    },
    {
      'question': 'What is the ability of an object to be treated as an instance of its superclass?',
      'correctAnswer': 'Polymorphism',
    },
    {
      'question': 'What is the concept of creating a new object from an existing object?',
      'correctAnswer': 'Cloning',
    },
    {
      'question': 'What is the relationship between two classes where one class is dependent on the other?',
      'correctAnswer': 'Dependency',
    },
    {
      'question': 'What is the concept of creating a class that cannot be instantiated?',
      'correctAnswer': 'Abstract',
    },
    {
      'question': 'What is the ability of an object to be used in a variety of situations?',
      'correctAnswer': 'Flexibility',
    },
    {
      'question': 'What is the concept of creating a class that is a combination of two or more classes?',
      'correctAnswer': 'Multiple',
    },
    {
      'question': 'What is the relationship between two classes where one class is a part of the other?',
      'correctAnswer': 'Composition',
    },
    {
      'question': 'What is the concept of creating a class that is a variation of an existing class?',
      'correctAnswer': 'Specialization',
    },
    {
      'question': 'What is the ability of an object to be used in a specific context?',
      'correctAnswer': 'Contextual',
    },
    {
      'question': 'What is the concept of creating a class that is a blueprint for other classes?',
      'correctAnswer': 'Template',
    },
    {
      'question': 'What is the relationship between two classes where one class is a container for the other?',
      'correctAnswer': 'Aggregation',
    },
    {
      'question': 'What is the concept of creating a class that is a simplified version of an existing class?',
      'correctAnswer': 'Simplification',
    },
    {
      'question': 'What is the ability of an object to be used in a variety of contexts?',
      'correctAnswer': 'Versatility',
    },
    {
      'question': 'What is the concept of creating a class that is a combination of two or more interfaces?',
      'correctAnswer': 'Hybrid',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Object Oriented Programming'),
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
                      padding: const EdgeInsets.all(10),
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
                  child: const Text('Complete Section 4'),
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


class Section5 extends StatefulWidget {
  final VoidCallback completeSection;

  const Section5(this.completeSection, {super.key});

  @override
  State<Section5> createState() => _Section5State();
}

class _Section5State extends State<Section5> {
  int _currentQuestion = 0;
  String _answer = '';
  String _answerResult = '';
  int _hearts = 5;
  bool _allAnswersCorrect = false;
  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'What is a collection of objects that can be of any data type?',
      'correctAnswer': 'List',
    },
    {
      'question': 'What is a collection of unique objects?',
      'correctAnswer': 'Set',
    },
    {
      'question': 'What is a collection of key-value pairs?',
      'correctAnswer': 'Map',
    },
    {
      'question': 'What is a list that cannot be modified?',
      'correctAnswer': 'Immutable',
    },
    {
      'question': 'What is a list that can be modified?',
      'correctAnswer': 'Mutable',
    },
    {
      'question': 'What is the process of adding an element to a list?',
      'correctAnswer': 'Insert',
    },
    {
      'question': 'What is the process of removing an element from a list?',
      'correctAnswer': 'Remove',
    },
    {
      'question': 'What is the process of accessing an element in a list?',
      'correctAnswer': 'Index',
    },
    {
      'question': 'What is a list that is stored in contiguous memory locations?',
      'correctAnswer': 'Array',
    },
    {
      'question': 'What is a list that is implemented as a linked list?',
      'correctAnswer': 'LinkedList',
    },
    {
      'question': 'What is a collection of objects that are sorted in a specific order?',
      'correctAnswer': 'SortedSet',
    },
    {
      'question': 'What is a collection of objects that are stored in a specific order?',
      'correctAnswer': 'OrderedSet',
    },
    {
      'question': 'What is the process of combining two lists into one?',
      'correctAnswer': 'Concat',
    },
    {
      'question': 'What is the process of splitting a list into multiple lists?',
      'correctAnswer': 'Split',
    },
    {
      'question': 'What is the process of reversing the order of a list?',
      'correctAnswer': 'Reverse',
    },
    {
      'question': 'What is the process of sorting a list in a specific order?',
      'correctAnswer': 'Sort',
    },
    {
      'question': 'What is a list that is used to implement a stack?',
      'correctAnswer': 'ArrayList',
    },
    {
      'question': 'What is a list that is used to implement a queue?',
      'correctAnswer': 'LinkedList',
    },
    {
      'question': 'What is the process of searching for an element in a list?',
      'correctAnswer': 'Search',
    },
    {
      'question': 'What is the process of iterating over the elements of a list?',
      'correctAnswer': 'Iterate',
    },
    {
      'question': 'What is a list that is used to implement a graph?',
      'correctAnswer': 'AdjacencyList',
    },
    {
      'question': 'What is a list that is used to implement a tree?',
      'correctAnswer': 'NodeList',
    },
    {
      'question': 'What is the process of converting a list to a string?',
      'correctAnswer': 'ToString',
    },
    {
      'question': 'What is the process of converting a string to a list?',
      'correctAnswer': 'Split',
    },
    {
      'question': 'What is a list that is used to implement a heap?',
      'correctAnswer': 'ArrayList',
    },
    {
      'question': 'What is a list that is used to implement a trie?',
      'correctAnswer': 'NodeList',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List and Collections'),
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
                      padding: const EdgeInsets.all(10),
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
                  child: const Text('Complete Section 5'),
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



class Section6 extends StatefulWidget {
  final VoidCallback completeSection;

  const Section6(this.completeSection, {super.key});

  @override
  State<Section6> createState() => _Section6State();
}

class _Section6State extends State<Section6> {
  int _currentQuestion = 0;
  String _answer = '';
  String _answerResult = '';
  int _hearts = 5;
  bool _allAnswersCorrect = false;
  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'What is an event that occurs during the execution of a program?',
      'correctAnswer': 'Exception',
    },
    {
      'question': 'What is a block of code that is executed when an exception occurs?',
      'correctAnswer': 'Catch',
    },
    {
      'question': 'What is a block of code that is executed regardless of whether an exception occurs?',
      'correctAnswer': 'Finally',
    },
    {
      'question': 'What is a type of exception that is thrown by the program itself?',
      'correctAnswer': 'RuntimeException',
    },
    {
      'question': 'What is a type of exception that is thrown by the compiler?',
      'correctAnswer': 'CheckedException',
    },
    {
      'question': 'What is the process of handling an exception?',
      'correctAnswer': 'Catch',
    },
    {
      'question': 'What is the process of throwing an exception?',
      'correctAnswer': 'Throw',
    },
    {
      'question': 'What is a type of error that occurs at compile-time?',
      'correctAnswer': 'SyntaxError',
    },
    {
      'question': 'What is a type of error that occurs at runtime?',
      'correctAnswer': 'RuntimeException',
    },
    {
      'question': 'What is a type of exception that is thrown when a null value is used?',
      'correctAnswer': 'NullPointerException',
    },
    {
      'question': 'What is a type of exception that is thrown when an array index is out of bounds?',
      'correctAnswer': 'IndexOutOfBoundsException',
    },
    {
      'question': 'What is a type of exception that is thrown when a class is not found?',
      'correctAnswer': 'ClassNotFoundException',
    },
    {
      'question': 'What is a type of exception that is thrown when a method is not found?',
      'correctAnswer': 'NoSuchMethodException',
    },
    {
      'question': 'What is a type of exception that is thrown when a file is not found?',
      'correctAnswer': 'FileNotFoundException',
    },
    {
      'question': 'What is a type of exception that is thrown when a network connection is lost?',
      'correctAnswer': 'IOException',
    },
    {
      'question': 'What is a type of exception that is thrown when a security violation occurs?',
      'correctAnswer': 'SecurityException',
    },
    {
      'question': 'What is a type of exception that is thrown when a thread is interrupted?',
      'correctAnswer': 'InterruptedException',
    },
    {
      'question': 'What is a type of exception that is thrown when a timeout occurs?',
      'correctAnswer': 'TimeoutException',
    },
    {
      'question': 'What is a type of exception that is thrown when a parsing error occurs?',
      'correctAnswer': 'ParseException',
    },
    {
      'question': 'What is a type of exception that is thrown when a formatting error occurs?',
      'correctAnswer': 'FormatException',
    },
    {
      'question': 'What is a type of exception that is thrown when a database error occurs?',
      'correctAnswer': 'SQLException',
    },
    {
      'question': 'What is a type of exception that is thrown when a XML parsing error occurs?',
      'correctAnswer': 'XMLParseException',
    },
    {
      'question': 'What is a type of exception that is thrown when a JSON parsing error occurs?',
      'correctAnswer': 'JSONException',
    },
    {
      'question': 'What is a type of exception that is thrown when a HTTP error occurs?',
      'correctAnswer': 'HttpException',
    },
    {
      'question': 'What is a type of exception that is thrown when a socket error occurs?',
      'correctAnswer': 'SocketException',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List and Collections'),
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
                      padding: const EdgeInsets.all(10),
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
                  child: const Text('Complete Section 6'),
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



class Section7 extends StatefulWidget {
  final VoidCallback completeSection;

  const Section7(this.completeSection, {super.key});

  @override
  State<Section7> createState() => _Section7State();
}

class _Section7State extends State<Section7> {
  int _currentQuestion = 0;
  String _answer = '';
  String _answerResult = '';
  int _hearts = 5;
  bool _allAnswersCorrect = false;
  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'What is an event that occurs during the execution of a program?',
      'correctAnswer': 'Exception',
    },
    {
      'question': 'What is a block of code that is executed when an exception occurs?',
      'correctAnswer': 'Catch',
    },
    {
      'question': 'What is a block of code that is executed regardless of whether an exception occurs?',
      'correctAnswer': 'Finally',
    },
    {
      'question': 'What is a type of exception that is thrown by the program itself?',
      'correctAnswer': 'RuntimeException',
    },
    {
      'question': 'What is a type of exception that is thrown by the compiler?',
      'correctAnswer': 'CheckedException',
    },
    {
      'question': 'What is the process of handling an exception?',
      'correctAnswer': 'Catch',
    },
    {
      'question': 'What is the process of throwing an exception?',
      'correctAnswer': 'Throw',
    },
    {
      'question': 'What is a type of error that occurs at compile-time?',
      'correctAnswer': 'SyntaxError',
    },
    {
      'question': 'What is a type of error that occurs at runtime?',
      'correctAnswer': 'RuntimeException',
    },
    {
      'question': 'What is a type of exception that is thrown when a null value is used?',
      'correctAnswer': 'NullPointerException',
    },
    {
      'question': 'What is a type of exception that is thrown when an array index is out of bounds?',
      'correctAnswer': 'IndexOutOfBoundsException',
    },
    {
      'question': 'What is a type of exception that is thrown when a class is not found?',
      'correctAnswer': 'ClassNotFoundException',
    },
    {
      'question': 'What is a type of exception that is thrown when a method is not found?',
      'correctAnswer': 'NoSuchMethodException',
    },
    {
      'question': 'What is a type of exception that is thrown when a file is not found?',
      'correctAnswer': 'FileNotFoundException',
    },
    {
      'question': 'What is a type of exception that is thrown when a network connection is lost?',
      'correctAnswer': 'IOException',
    },
    {
      'question': 'What is a type of exception that is thrown when a security violation occurs?',
      'correctAnswer': 'SecurityException',
    },
    {
      'question': 'What is a type of exception that is thrown when a thread is interrupted?',
      'correctAnswer': 'InterruptedException',
    },
    {
      'question': 'What is a type of exception that is thrown when a timeout occurs?',
      'correctAnswer': 'TimeoutException',
    },
    {
      'question': 'What is a type of exception that is thrown when a parsing error occurs?',
      'correctAnswer': 'ParseException',
    },
    {
      'question': 'What is a type of exception that is thrown when a formatting error occurs?',
      'correctAnswer': 'FormatException',
    },
    {
      'question': 'What is a type of exception that is thrown when a database error occurs?',
      'correctAnswer': 'SQLException',
    },
    {
      'question': 'What is a type of exception that is thrown when a XML parsing error occurs?',
      'correctAnswer': 'XMLParseException',
    },
    {
      'question': 'What is a type of exception that is thrown when a JSON parsing error occurs?',
      'correctAnswer': 'JSONException',
    },
    {
      'question': 'What is a type of exception that is thrown when a HTTP error occurs?',
      'correctAnswer': 'HttpException',
    },
    {
      'question': 'What is a type of exception that is thrown when a socket error occurs?',
      'correctAnswer': 'SocketException',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List and Collections'),
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
                      padding: const EdgeInsets.all(10),
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
                  child: const Text('Complete Section 7'),
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
