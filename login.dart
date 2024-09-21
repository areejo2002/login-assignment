import 'package:flutter/material.dart';
import 'signup.dart';
import'profilepage.dart';

class login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

      ),
      home: const MyHomePage(title: 'Login Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _passwordVisible = false;

  final String emailPattern =
      r'^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$';
  final String passwordPattern =
      r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$';

  bool isEmailValid = false;
  bool isPasswordValid = false;

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  OutlineInputBorder _getBorder(bool isValid) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: isValid ? Colors.green : Colors.grey,
      ),
    );
  }

  InputDecoration _getInputDecoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      labelStyle: TextStyle(color: Colors.white), // Text label color white
      border: _getBorder(isEmailValid),
      enabledBorder: _getBorder(isEmailValid),
      focusedBorder: _getBorder(isEmailValid),
      prefixIcon: Icon(icon, color: Colors.white), // Icon color white
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title, style: TextStyle(color: Colors.white)), // AppBar title color white
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.blueGrey[50],
          image: DecorationImage(
            image: AssetImage("assets/login.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          children: [
            Form(
              key: formKey,
              child: Padding(
                padding: EdgeInsets.all(30),
                child: Column(
                  children: [
                    TextFormField(
                      controller: emailController,
                      decoration: _getInputDecoration("Email", Icons.email),
                      style: TextStyle(color: Colors.white), // Input text color white
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          setState(() {
                            isEmailValid = false;
                          });
                          return 'Please enter your email';
                        } else if (!RegExp(emailPattern).hasMatch(value)) {
                          setState(() {
                            isEmailValid = false;
                          });
                          return 'Enter a valid email';
                        } else {
                          setState(() {
                            isEmailValid = true;
                          });
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: passwordController,
                      obscureText: !_passwordVisible,
                      decoration:
                      _getInputDecoration("Password", Icons.lock).copyWith(
                        suffixIcon: IconButton(
                          icon: Icon(
                            _passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.white, // Icon button color white
                          ),
                          onPressed: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                        ),
                      ),
                      style: TextStyle(color: Colors.white), // Input text color white
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          setState(() {
                            isPasswordValid = false;
                          });
                          return 'Please enter your password';
                        } else if (!RegExp(passwordPattern).hasMatch(value)) {
                          setState(() {
                            isPasswordValid = false;
                          });
                          return 'Password must be 8+ characters, include 1 letter and 1 number';
                        } else {
                          setState(() {
                            isPasswordValid = true;
                          });
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),

                    ElevatedButton(
                      onPressed: () {

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => profile()), // Navigate to Signup
                        );
                        // Login logic here
                      },
                      child: Text("Login", style: TextStyle(color: Colors.blue.shade600)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Signup()), // Navigate to Signup
                        );
                      },
                      child: Text("Sign Up", style: TextStyle(color: Colors.blue.shade600)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


