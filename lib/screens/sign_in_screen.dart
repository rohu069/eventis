import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _studentIdController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>(); // For form validation

  // Form validation
  bool _validateSignUp(String name, String studentId, String phone, String email) {
    // Check if fields are non-empty (You can add more checks here)
    if (name.isEmpty || studentId.isEmpty || phone.isEmpty || email.isEmpty) {
      return false;
    }
    // Add specific validation for email and phone
    if (!RegExp(r"^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email)) {
      return false;
    }
    if (!RegExp(r"^\d{10}$").hasMatch(phone)) { // Validate phone number length
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In',
        style: TextStyle(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        ),
        backgroundColor:  Color.fromARGB(255, 122, 17, 17),
      ),
      body: Container(
        // Add gradient background
        
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
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
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name',
                filled: true,
                fillColor: Color.fromARGB(255, 255, 255, 255),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _studentIdController,
                decoration: InputDecoration(labelText: 'Student ID',
                  filled: true,
                fillColor: Color.fromARGB(255, 255, 255, 255),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your student ID';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(labelText: 'Phone Number',
                  filled: true,
                fillColor: Color.fromARGB(255, 255, 255, 255),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                ),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  } else if (!RegExp(r"^\d{10}$").hasMatch(value)) {
                    return 'Please enter a valid phone number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email',
                  filled: true,
                fillColor: Color.fromARGB(255, 255, 255, 255),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  } else if (!RegExp(r"^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    // If form is valid, submit the form
                    if (_validateSignUp(
                        _nameController.text,
                        _studentIdController.text,
                        _phoneController.text,
                        _emailController.text)) {
                      // Successful sign-up (You can add further logic like saving to a database)
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Sign up successful')),
                      );
                    } else {
                      // Show error if validation fails
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Invalid input. Please check your details')),
                      );
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(150, 50)
                ),
                child: Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
