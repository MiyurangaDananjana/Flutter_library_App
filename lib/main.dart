import 'package:flutter/material.dart';
// import 'src/screen/home_screen.dart';
import './src/services/ApiService.dart';
import './src/screen/home.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 250, 221, 221),
        ),
        backgroundColor: Color.fromARGB(255, 239, 250, 252),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/24307396_6920933.jpg', // Replace with your actual image path
                  width: 170, // Set the width of the image
                  height: 170, // Set the height of the image
                ),
                const SizedBox(height: 16.0),
                TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    labelText: 'Username',
                  ),
                ),
                const SizedBox(height: 16.0),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                  ),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () async {
                    String username = usernameController.text;
                    String password = passwordController.text;

                    if (username.isEmpty || password.isEmpty) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: Text('Login Failed'),
                          content: Text(
                              'Username or password cannot be empty. Please enter both.'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(); // Close the alert
                              },
                              child: Text('OK'),
                            ),
                          ],
                        ),
                      );
                      return; // Return from the onPressed callback to prevent further execution
                    }
                    print('Username: $username, Password: $password');

                    Map<String, dynamic> requestBody = {
                      'UserName': username,
                      'UserPassword': password,
                    };

                    bool isLoggedIn =
                        await ApiService.sendLoginRequest(requestBody);

                    if (isLoggedIn) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Home()),
                      );
                    } else {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: Text('Login Failed'),
                          content: Text(
                              'Invalid username or password. Please try again.'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(); // Close the alert
                              },
                              child: Text('OK'),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    minimumSize: Size(200, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
