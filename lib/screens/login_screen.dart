import 'package:flutter/material.dart';
import 'sign_in_screen.dart'; // Import the SignInScreen
import 'event_details_screen.dart'; // Import the EventDetailsScreen

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>(); // For form validation

  // Dummy authentication (Replace with actual authentication logic later)
  bool _validateLogin(String username, String password) {
    // Simple validation for non-empty fields
    return username == 'admin' && password == 'password';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Screen',
        style: TextStyle(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        
        ),
        backgroundColor: Color.fromARGB(255, 122, 17, 17),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
         decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 122, 17, 17), // Dark Red
              Color.fromARGB(255, 172, 49, 49), // Light Red
            ],
          ),
        ),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: _usernameController,
                decoration: 
                InputDecoration(labelText: 'Username',
                filled: true,
                fillColor: Color.fromARGB(255, 255, 255, 255),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  
                )),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your username';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(labelText: 'Password',
                filled: true,
                fillColor: Color.fromARGB(255, 255, 255, 255),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                )),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    // Validate username and password
                    if (_validateLogin(
                        _usernameController.text, _passwordController.text)) {
                      // If login is successful, navigate to the EventDetailsScreen
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EventDetailsScreen()),
                      );
                    } else {
                      // Show error if login fails
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Invalid username or password')),
                      );
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(150, 50),
                ),
                child: Text('Log In',),
              ),
              SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  // Navigate to the SignInScreen for new users
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignInScreen()),
                  );
                },
                child: Text('New user? Sign Up',
                style: TextStyle(
                  color: Colors.white
                ),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
