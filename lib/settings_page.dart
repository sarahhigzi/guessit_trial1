import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatelessWidget {
  final String title;

  const SettingsPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) { // This defines the UI for the settings page
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Login Information',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            _LoginStatus(), // This displays the current login status and username
          ],
        ),
      ),
    );
  }
}



class _LoginStatus extends StatefulWidget {
  const _LoginStatus({Key? key}) : super(key: key);
  // The _LoginStatus widget is used to display the login status of the user,
  // including whether the user is logged in and the user's username.

  @override
  __LoginStatusState createState() => __LoginStatusState(); // Is responsible for loading and updating the login status and username from the shared preferences
}

class __LoginStatusState extends State<_LoginStatus> { // Is a state class for the _LoginStatus widget
  bool _isLoggedIn = false;  // It initializes the state of the widget by setting _isLoggedIn to false
  String _username = ''; // And _username to an empty string.

  @override
  void initState() { // It overrides the initState method
    super.initState();
    _loadLoginStatus(); // It loads the login status from shared preferences
    _loadUsername();// It loads the username from shared preferences
  }


  void _loadLoginStatus() async { // This method loads the login status
    final prefs = await SharedPreferences.getInstance(); // This loads the status from the shared preferences
    setState(() { // It updates the state of the widget using setState().
      _isLoggedIn = prefs.getBool('isLoggedIn') ?? false; // It retrieves a boolean value from the preferences using the key 'isLoggedIn'
    });
  }

  void _loadUsername() async { // This method  loads the saved  username
    final prefs = await SharedPreferences.getInstance(); // The app's shared preferences, where the username is saved
    final savedUsername = prefs.getString('username'); // This widget loads the saved username when the widget is first created.
    setState(() {
      _username = savedUsername ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    // The widget displays whether the user is logged in or not
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // This property is set to CrossAxisAlignment.start to left-align the text
      children: [
        Text('Logged in: ${_isLoggedIn ? 'Yes' : 'No'}'), // dependent on the _isLoggedIn boolean variable.
        // Text widget is only displayed if the user is logged in,
        if (_isLoggedIn) Text('Username: $_username'), // displays the username using the _username string variable.
      ],
    );
  }
}
