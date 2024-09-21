import 'package:flutter/material.dart';
import 'profilepage.dart';

class Signup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Theme(
        data: ThemeData(
          inputDecorationTheme: InputDecorationTheme(
            labelStyle: TextStyle(color: Colors.white),
            filled: true,
            fillColor: Colors.transparent, // Transparent background for TextFields
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: Colors.white),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
            ),
          ),
        ),

        child: Container(
          width: double.infinity, // Make the container take the full width
          height: double.infinity, // Make the container take the full height
          decoration: BoxDecoration(
            color: Colors.blueGrey[50], // Background color
            image: DecorationImage(
              image: AssetImage('assets/login.png'),
              fit: BoxFit.cover, // Cover the entire container
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'First Name',
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Second Name',
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password Verification',
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 32),
                  SizedBox(height: 20),

                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => profile()), // Navigate to Signup
                      );
                    },
                    child: Text("Login", style: TextStyle(color: Colors.blue.shade600)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
