import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:login/login.dart';

class profile extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<profile> {
  File? _image;
  String _username = '';

  Future<void> _getImageFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('تم رفع الصورة بنجاح')),
        );
      } else {
        print('لم يتم اختيار صورة.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('profile page'),
      ),
      body: Stack(
        children: [
          // Full screen background container
          Container(
            width: screenSize.width, // Full screen width
            height: screenSize.height, // Full screen height
            decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                image: AssetImage('assets/login.png'),
                fit: BoxFit.cover, // Makes the image cover the entire screen
              ),
            ),
          ),
          // User profile avatar and details
          Positioned(
            left: screenSize.width / 2 - 70, // Center horizontally
            top: 100,
            child: GestureDetector(
              onTap: _getImageFromGallery,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    radius: 70,
                    backgroundImage: _image != null ? FileImage(_image!) : null,
                    backgroundColor: Colors.grey,
                    child: _image == null
                        ? Icon(
                      Icons.person,
                      size: 90,
                      color: Colors.white,
                    )
                        : null,
                  ),
                  Positioned(
                    left: 110,
                    top: 100,
                    child: Icon(
                      Icons.add_circle,
                      color: Colors.indigo,
                      size: 24,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: screenSize.width / 2 - 100, // Adjust position based on screen width
            top: 230,
            child: Container(
              width: 200,
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    _username = value;
                  });
                },
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
                decoration: InputDecoration(
                  labelText: 'user name',
                  labelStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Positioned(
            left: screenSize.width / 2 - 125, // Center based on screen width
            top: 300,
            child: Column(
              children: [
                Container(
                  width: 250,
                  height: 70,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.favorite),
                        color: Colors.red,
                      ),
                      Text(
                        'favourite page',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'Tajawal',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20), // Add space between "المفضلة" and the next container
                Container(
                  width: 250,
                  height: 70,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => login(),
                            ),
                          );
                        },
                        icon: Icon(Icons.logout),
                        color: Colors.grey,
                      ),
                      SizedBox(width: 5),
                      Text(
                        'logout',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'Tajawal',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20), // Add space between "تسجيل الخروج" and the next container
                Container(
                  width: 250,
                  height: 80,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.settings_suggest_outlined),
                        color: Colors.white,
                      ),
                      SizedBox(width: 5),
                      Expanded(
                        child: Stack(
                          children: [
                            TextField(
                              textAlign: TextAlign.start,
                              decoration: InputDecoration(
                                hintText: 'your inquiries and suggestions',
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 18,
                                  fontFamily: 'Tajawal',
                                  fontWeight: FontWeight.w400,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                            Positioned(
                              right: 90,
                              top: 70,
                              bottom: 0,
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.send),
                                color: Color(0xFF156260),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: screenSize.width / 2 - 70, // Adjust to center the text
            top: 30,
            child: Text(
              'user profile',
              style: TextStyle(
                color: Colors.white,
                fontSize: 27,
                fontFamily: 'Tajawal',
                fontWeight: FontWeight.w600,
                height: 0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
