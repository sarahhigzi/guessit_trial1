import 'package:flutter/material.dart';

import 'navigation.dart';
import 'main.dart';



class QuizPage extends StatelessWidget {
  // A stateless widget that represents the UI of the Quiz page in the app
  final String title;

  const QuizPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      // rest of your code
    );
  }
}

class DifficultyPage extends StatelessWidget {
  // This widget displays a list of difficulty levels for the user to choose from
  final String title;

  const DifficultyPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding( //  The body of the scaffold is a Padding widget
        padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 64.0),
        child: GridView.count( // A GridView.count widget with six ElevatedButton widgets, each representing a different difficulty level.
          crossAxisCount: 2,
          mainAxisSpacing: 16.0,
          crossAxisSpacing: 16.0,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push( // When a button is pressed, it navigates to the corresponding QuizPage using Navigator.push
                  context,
                  MaterialPageRoute( // No constraints due to the quiz page being wrapped inside a SizedBox
                      builder: (context) => const SizedBox(child: QuizPage(title: 'Easy A Quiz'))),
                );
              },
              style: ElevatedButton.styleFrom( // widgets are styled using ElevatedButton.styleFrom to set the background color, shape, and minimum size.
                backgroundColor: Colors.lightGreen, // Green background colour for the easy difficulty page box
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                minimumSize: const Size(0, 64.0),
              ),
              child: const Text('Easy A'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push( // When a button is pressed, it navigates to the corresponding QuizPage using Navigator.push
                  context,
                  MaterialPageRoute( // No constraints due to the quiz page being wrapped inside a SizedBox
                      builder: (context) => const SizedBox(child: QuizPage(title: 'Easy B Quiz'))),
                );
              },
              style: ElevatedButton.styleFrom( // The widgets are styled using ElevatedButton.styleFrom to set the background color, shape, and minimum size.
                backgroundColor: Colors.green, // Green background colour for the easy difficulty page box
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                minimumSize: const Size(0, 64.0),
              ),
              child: const Text('Easy B'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push( // When a button is pressed, it navigates to the corresponding QuizPage using Navigator.push
                  context,
                  MaterialPageRoute( // No constraints due to the quiz page being wrapped inside a SizedBox
                      builder: (context) => const SizedBox(child: QuizPage(title: 'Medium A Quiz'))),
                );
              },
              style: ElevatedButton.styleFrom( // The widgets are styled using ElevatedButton.styleFrom to set the background color, shape, and minimum size.
                backgroundColor: Colors.orangeAccent, // Orange background colour for the medium difficulty page box
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                minimumSize: const Size(0, 64.0),
              ),
              child: const Text('Medium A'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push( // When a button is pressed, it navigates to the corresponding QuizPage using Navigator.push
                  context,
                  MaterialPageRoute( // No constraints due to the quiz page being wrapped inside a SizedBox
                      builder: (context) => const SizedBox(child: QuizPage(title: 'Medium B Quiz'))),
                );
              },
              style: ElevatedButton.styleFrom( // The widgets are styled using ElevatedButton.styleFrom to set the background color, shape, and minimum size.
                backgroundColor: Colors.orange, // Orange background colour for the medium difficulty page box
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                minimumSize: const Size(0, 64.0),
              ),
              child: const Text('Medium B'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push( // When a button is pressed, it navigates to the corresponding QuizPage using Navigator.push
                  context,
                  MaterialPageRoute( // No constraints due to the quiz page being wrapped inside a SizedBox
                      builder: (context) => const SizedBox(child: QuizPage(title: 'Hard A Quiz'))),
                );
              },
              style: ElevatedButton.styleFrom( // The widgets are styled using ElevatedButton.styleFrom to set the background color, shape, and minimum size.
                backgroundColor: Colors.redAccent, // Red background colour for the hard difficulty page box
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                minimumSize: const Size(0, 64.0),
              ),
              child: const Text('Hard A'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push( // When a button is pressed, it navigates to the corresponding QuizPage using Navigator.push
                  context,
                  MaterialPageRoute( // No constraints due to the quiz page being wrapped inside a SizedBox
                      builder: (context) => const SizedBox(child: QuizPage(title: 'Hard B Quiz'))),
                );
              },
              style: ElevatedButton.styleFrom( // The widgets are styled using ElevatedButton.styleFrom to set the background color, shape, and minimum size.
                backgroundColor: Colors.red, // Red background colour for the hard difficulty page box
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                minimumSize: const Size(0, 64.0),
              ),
              child: const Text('Hard B'),
            ),
          ],
        ),
      ),
    );
  }
}

