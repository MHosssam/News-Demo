import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 16 , right: 16 , bottom: 270),
            child: Text(
              'We are a working team to help you know the news in all its fields and sections, moment by moment',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: ExactAssetImage('assets/images/cover.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}
