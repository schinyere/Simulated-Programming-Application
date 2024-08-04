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

  _loadCompletionStatus() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _section1Completed = prefs.getBool('section1Completed')?? false;
      _section2Completed = prefs.getBool('section2Completed')?? false;
      _section3Completed = prefs.getBool('section3Completed')?? false;
    });
  }

  _saveCompletionStatus() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('section1Completed', _section1Completed);
    prefs.setBool('section2Completed', _section2Completed);
    prefs.setBool('section3Completed', _section3Completed);
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
              const Text('Lesson Path'),
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
      'question': 'What is the data type of the variable "x" in the following code: int x = 5;',
      'correctAnswer': 'int',
    },
    {
      'question': 'What is the purpose of the "final" keyword in Dart is to declare a ?',
      'correctAnswer': 'constant',
    },
    
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Section 2'),
      ),
      body: Center(
        child: ListView(
          children: [
             ElevatedButton(
              onPressed: () {
                widget.completeSection();
                Navigator.pop(context);
              },
              child: Text('Complete Section 2'),
            ),
          ],
        ),
      ),
    );
  }
}

class Section3 extends StatefulWidget {
  final VoidCallback completeSection;

  Section3(this.completeSection);

  @override
  State<Section3> createState() => _Section3State();
}

class _Section3State extends State<Section3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Section 3'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            widget.completeSection();
            Navigator.pop(context);
          },
          child: Text('Complete Section 3'),
        ),
      ),
    );
  }
}