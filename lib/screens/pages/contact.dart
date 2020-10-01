import 'package:flutter/material.dart';

class Contact extends StatefulWidget {
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 250),
            child: Text(
              'You can contact us by phone 01004690385 ',
              style: TextStyle(
                fontSize: 30,
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
