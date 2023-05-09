import 'package:flutter/material.dart';
import 'difficulty_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'settings_page.dart';

// Main entry point of the FLUTTER application
void main() {
  runApp(const MyApp());
}

// MyApp widget extends StatefulWidget
  // This means the mutual state can change overtime


// Stateful widget is implemented as the widget should change when the user interacts with it

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  // _MyAppState() - The underscores are showing that the class/members are private
  _MyAppState createState() => _MyAppState();
}

// _MyAppState class stores data that can change over the lifetime of the widget
  // When the app firsts launches the UI displays a Login page
class _MyAppState extends State<MyApp> {
  bool _isLoggedIn = false; // Boolean variable which is initially utilised as false before the user even opens the app
  final TextEditingController _usernameController = TextEditingController(); // The TextEditingController manages the users login and saves them for future use

// This method is only called upon after the user successfully logs in
  void _onLoginSuccess() async {
    final prefs = await SharedPreferences.getInstance(); // The SharedPreferences package stores the two pieces of information in the devices local storage

    prefs.setBool('isLoggedIn', true); // The information stored is a boolean value (Logged in: Yes/No) and the users username
    prefs.setString('username', _usernameController.text);

    setState(() { // Method state gets updated after the user logs in
      _isLoggedIn = true; // this triggers the app to switch from LoginPage to the HomePage
    });
  }

// The root of the applications widget tree that builds the code of the application
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // sets the apps title and theme
      title: 'Guessing Game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      // Determines which page to display based on the fact if the user is logged in or not

      // If the user is logged in (_isLoggedIn is true), then the app displays the HomePage, which serves as the main screen of the app.
      // If the user is not logged in (_isLoggedIn is false), then the app displays the LoginPage, which is where the user enters their login credentials.
      home: _isLoggedIn ? const HomePage() : LoginPage(onLoginSuccess: _onLoginSuccess, usernameController: _usernameController),
     // The onLoginSuccess function is called with the 2 parameters are successful
    );
  }
}

class LoginPage extends StatefulWidget { // A widget which accepts two required parameters
  final void Function() onLoginSuccess; // A callback function - successful when login is complete
  final TextEditingController usernameController; // The TextEditingController holds the username in a login form as a TextField

  // Is responsible for rendering the login UI, capturing the user input
  const LoginPage({Key? key, required this.onLoginSuccess, required this.usernameController}) : super(key: key);
  // The callback onLoginSuccess is used when the user successfully logs in

  @override
  _LoginPageState createState() => _LoginPageState(); // The LoginPage creates a private state class that extends State<LoginPage>
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController(); // A TextEditingController to handle the input for the username field
  final TextEditingController _passwordController = TextEditingController(); // A TextEditingController to handle the input for the password field.
  bool _isErrorVisible = false; // The boolean value _isErrorVisible indicate whether an error message should be displayed if the username or password field is empty.

  bool _validateInputs() { // Checks whether the username and password fields are not empty
    final username = _usernameController.text;
    final password = _passwordController.text;
    if (username.isEmpty || password.isEmpty) { //
      setState(() => _isErrorVisible = true); // If either field is empty, it sets _isErrorVisible to true, which displays an error message
      return false;
    }
    return true; //  If both fields have input, _validateInputs() returns true.
  }

  @override
  Widget build(BuildContext context) { // This class defines the UI for the LoginScreen
    return Scaffold( // Scaffold widget is  used to define the basics of the structure of the screen
      // A  AppBar and Column are displayed as the main part of the body
      appBar: AppBar( // The AppBar consists of the title Login
        title: const Text('Login'), //
      ),
      body: Padding( // Defines the body of the Scaffold widget
        padding: const EdgeInsets.all(16.0), //The padding on all sides
        child: Column( // Defines the two TextField widgets (USERNAME and PASSWORD)
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _usernameController, // First TextField widget
              decoration: const InputDecoration( // The InputDecoration widget provides a hint text for the user
                hintText: 'USERNAME', // In this case this widget is a TextField is for the users USERNAME
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _passwordController, // Second TextField widget
              obscureText: true,
              decoration: const InputDecoration( // The InputDecoration widget provides a hint text for the user
                hintText: 'PASSWORD', // In this case this widget is a TextField is for the users PASSWORD
              ),
            ),
            if (_isErrorVisible) // A code of conditionality
              const SizedBox(height: 16, child: Text('Please enter username and password')), // A text widget with the error message
            const SizedBox(height: 16),
            ElevatedButton( // An ElevatedButton widget is placed for submitting the login form.
              onPressed: () { // The onPressed method handles the validation and navigation if the form is valid
                if (_validateInputs()) { // The_validateInputs property navigates the user
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage())).then((value) {
                    if (value == true) {
                      widget.onLoginSuccess(); // It sets the _isLoggedIn property to true, thus navigating the user to the HomePage.
                    }
                  });
                }
              },
              child: const Text('LOGIN'),
            ),
          ],
        ),
      ),
    );
  }
}



class HomePage extends StatelessWidget { // This class defines the UI for the homepage application
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) { // The build method helps design the UI for the homepage
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('GUESS IT'), // AppBar will be placed at the top of the UI with the title 'GUESS IT'
        ),
        body: const Center(
          child: Text('Home Page'), // Home page class
        ),
        bottomNavigationBar: BottomNavigationBar( // This defines a navigation bar that appears at the bottom of the screen
          items: const <BottomNavigationBarItem>[ // Contains a list of BottomNavigationBarItem widgets, which define each individual navigation bar item.
            BottomNavigationBarItem(
              icon: Icon(Icons.play_circle_outline), // Specific icon and label for the play button
              label: 'Play',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.quiz), // Specific icon and label for the quiz button
              label: 'Quiz',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.emoji_events), // Specific icon and label for the badges button
              label: 'Badges',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings), // Specific icon and label for the settings button
              label: 'Settings',
            ),
          ],
          onTap: (index) { // The onTap function of the BottomNavigationBar widget is called when a user taps on one of the tabs.
            // Shows how the app navigates to a new screen dependant on the tab/button pressed
            if (index == 0) { // A callback for the index
              // check if the icon tab was tapped and relates the user to the correct index
              Navigator.push( // The Navigator.push method creates new routes for the different screens available.
                context,
                MaterialPageRoute(builder: (context) => const DifficultyPage(title: 'Difficulty Page')),
              ); // MaterialPageRoute specifies a builder message for the mew screen and passed the title as a paramenter
            } else if (index == 3) {
              // check if the Settings tab was tapped
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsPage(title: 'Settings')),
              );
            }
          },
          currentIndex: 1, // set the selected index to the Quiz tab
        ),
      ),
    );
  }
}

