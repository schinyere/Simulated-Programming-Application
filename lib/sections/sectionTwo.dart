import 'package:flutter/material.dart';


class LessonPath extends StatefulWidget {
  @override
  _LessonPathState createState() => _LessonPathState();
}

class _LessonPathState extends State<LessonPath> {
  int _currentSection = 0;
  bool _section1Completed = false;
  bool _section2Completed = false;
  bool _section3Completed = false;

  void completeSection1() {
    setState(() {
      _section1Completed = true;
    });
  }

  void completeSection2() {
    setState(() {
      _section2Completed = true;
    });
  }

  void completeSection3() {
    setState(() {
      _section3Completed = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lesson Path'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
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
              child: Container(
                decoration: BoxDecoration(
                  color: _section1Completed ? Colors.green : Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(10),
                child: Text('Section 1'),
              ),
            ),
            SizedBox(height: 10),
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
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(10),
                child: Text('Section 2'),
              ),
            ),
            SizedBox(height: 10),
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
                child: Text('Section 3'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Section1 extends StatelessWidget {
  final VoidCallback completeSection;

  Section1(this.completeSection);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Section 1'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            completeSection();
            Navigator.pop(context);
          },
          child: Text('Complete Section 1'),
        ),
      ),
    );
  }
}

class Section2 extends StatelessWidget {
  final VoidCallback completeSection;

  Section2(this.completeSection);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Section 2'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            completeSection();
            Navigator.pop(context);
          },
          child: Text('Complete Section 2'),
        ),
      ),
    );
  }
}

class Section3 extends StatelessWidget {
  final VoidCallback completeSection;

  Section3(this.completeSection);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Section 3'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            completeSection();
            Navigator.pop(context);
          },
          child: Text('Complete Section 3'),
        ),
      ),
    );
  }
}