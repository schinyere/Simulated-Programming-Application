import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SectionOne extends StatefulWidget {
  const SectionOne({super.key});

  @override
  State<SectionOne> createState() => _SectionOneState();
}

class _SectionOneState extends State<SectionOne> {
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
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
    );
  }
}