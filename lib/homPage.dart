import 'package:flutter/material.dart';
import 'package:spa/lessonPaths.dart';
import 'globals.dart' as globals_lib;
import 'package:url_launcher/url_launcher.dart'; 

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              // Header Section
              HeaderSection(),

              // Hero Section
              HeroSection(),

              // Features Section
              FeaturesSection(),
              const SizedBox(height: 8),
              LineProgressBar(),
              const SizedBox(height: 8),
              // Call to Action
              CallToAction(),
              const SizedBox(height: 8),
              // Footer Section
              FooterSection(),
            ],
          ),
        ),
      ),
    );
  }
}

// Header Section
class HeaderSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 50),
      child: const Text(
        'Welcome',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

// Hero Section
class HeroSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      alignment: Alignment.center,
      child: const Text(
        'Where Accuracy Meets Fun: The Dart Game App!',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

// Features Section
class FeaturesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: SingleChildScrollView(
        child: Column(
          children: [
            FeatureItem('Intuitive Interface',
                'designed to make your coding journey seamless.'),
            FeatureItem('Real-time Feedback',
                'ensuring you\'re always on the right track.'),
            FeatureItem(
                'Collaboration Tools', 'create something truly remarkable.'),
            FeatureItem('Extensive Library',
                'examples to fuel your learning and growth.'),
          ],
        ),
      ),
    );
  }
}

class FeatureItem extends StatelessWidget {
  final String title;
  final String description;

  FeatureItem(this.title, this.description);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Row(
        children: [
          const Icon(Icons.check, color: Colors.blue),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(description),
            ],
          ),
        ],
      ),
    );
  }
}

// Call to Actionclass CallToAction extends StatelessWidget {
class CallToAction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
                onTap: () async {
                  // Handle the tap event here
                  await launch('https://www.youtube.com/playlist?list=PL4cUxeGkcC9iVGY3ppchN9kIauln8IiEh'); 
                },
                child: Card(
                  color: Colors.pink,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  elevation: 5,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Start your Journery',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Dive and Start learning basic Dart Programming',
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                        const SizedBox(height: 14),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text('Get Started'),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            SizedBox(width: 20),
            InkWell(
                onTap: () async {
                  // Handle the tap event here
                  await launch('https://flutter.dev/'); 
                },
                child: Card(
                  color: Colors.purple,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  elevation: 5,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'More on Dart',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Documentation of the Dart Programming Language',
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                        const SizedBox(height: 14),
                        ElevatedButton(
                          onPressed: () async {
                            await launch('https://flutter.dev/');
                          },
                          child: const Text('Get Started'),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            SizedBox(width: 20),
            InkWell(
                onTap: () async {
                  // Handle the tap event here,
                  await launch('https://docs.flutter.dev/get-started/install');
                  
                },
                child: Card(
                  color: Colors.green,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  elevation: 5,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Installation of Dart',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Installation of Dart using Flutter Framework',
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                        const SizedBox(height: 14),
                        ElevatedButton(
                          onPressed: () async {
                            await launch('https://docs.flutter.dev/get-started/install');
                          },
                          child: const Text('Get Started'),
                        )
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

// Footer Section
class FooterSection extends StatelessWidget {
  bool _showQuote = false; // Declare the boolean variable
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(
            color: const Color.fromARGB(255, 1, 1, 2), width: 2), // add a trendy border
        borderRadius: BorderRadius.circular(10), // rounded corners
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Add this line
        children: [
          const Text('Dart Programming!'),
          const SizedBox(height: 10),
          IconButton(
            icon: const Icon(Icons.info),
            onPressed: () {
              _showQuote = true;
            },
          ),
          _showQuote
              ? const Text(
                  '“Code is like humor. When you have to explain it, it’s not funny anymore.” - Cory House')
              : Container(),
          const Divider(),
          const Padding(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            child: Text('History of Dart:'),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            child: Text(
                'Dart is a programming language developed by Google in 2011.'),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10, bottom: 10), // add padding
            child: Text(
              'The first version of Dart, version 0.0, was released in October 2011.',
              style: TextStyle(// subtle color
                  ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            child: Text(
                'Dart 1.0 was released in November 2013, and since then, it has been constantly evolving.'),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            child: Text(
                'Dart is used to build web, mobile, and desktop applications, and is also used as a scripting language.'),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            child: Text(
                '2011: Dart was first announced by Google in October 2011.'),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            child: Text('2013: Dart 1.0 was released in November 2013.'),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            child: Text(
                '2015: Dart 1.12 was released, which added support for async/await.'),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            child: Text(
                '2017: Dart 1.24 was released, which added support for type inference.'),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            child: Text(
                '2018: Dart 2.0 was released, which introduced a new runtime and a more concise syntax.'),
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            child: Text('Advantages:'),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            child: Text(
                'Flutter allows you to build natively compiled applications for mobile (iOS and Android), web, and desktop from a single codebase.'),
          ),
        ],
      ), // add some padding
    );
  }
}

class LineProgressBar extends StatefulWidget {
  @override
  _LineProgressBarState createState() => _LineProgressBarState();
}

class _LineProgressBarState extends State<LineProgressBar> {
  List<String> myList = 
  [
    'Datatypes', 
    'Conditionals', 
    'Functions',
    'Data Structures',
    'Object Oriented Programming',
    'List and Collections',
    'Error Handling and Exceptions',
    'Widgets and Layouts',
    'State Management'
    ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      child: Row(
        children: [
          Expanded(
            child: Card(
              color: Colors.purple, // change the color to blue
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    LinearProgressIndicator(
                      value: globals_lib.progress,
                      backgroundColor: Colors.grey[200],
                      valueColor: const AlwaysStoppedAnimation(Colors.blue),
                    ),
                    const SizedBox(height: 16),
                    Text('Progress: ${(globals_lib.progress * 100).toInt()}%'),
                    const SizedBox(height: 16),
                    Text(
                      'Current Lesson: ${globals_lib.completed > 0 && globals_lib.completed <= myList.length ? myList[globals_lib.completed - 1] : 'Not started'}',
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),
                    ),
                    const SizedBox(height: 16),
                    Text("Completed: ${(globals_lib.completed)}" ),
                    const SizedBox(height: 16),
                    const Text("Total: 10"),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Card(
              color: Colors.pink, // change the color to blue
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    LinearProgressIndicator(
                      value: globals_lib.quiz / 5,
                      backgroundColor: Colors.grey[200],
                      valueColor: const AlwaysStoppedAnimation(Colors.blue),
                    ),
                    const SizedBox(height: 16),
                    Text('Progress: ${(globals_lib.quiz / 5 * 100).toInt()}%'),
                    const SizedBox(height: 16),
                    Text(
                      'Quiz: ${globals_lib.quiz == 0 ? 'Not Started' : globals_lib.quiz}',
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),
                    ),
                    const SizedBox(height: 16),
                    Text("Completed: ${(globals_lib.quiz)}" ),
                    const SizedBox(height: 16),
                    const Text("Total: 5"),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}