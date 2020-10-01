import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:thenews/ui/navigation_drawer.dart';

class TwitterFeed extends StatefulWidget {
  @override
  _TwitterFeedState createState() => _TwitterFeedState();
}

class _TwitterFeedState extends State<TwitterFeed> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Twitter Feeds'),
        centerTitle: false,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {})
        ],
      ),
      drawer: NavigationDrawer(),
      body: ListView.builder(
        padding: EdgeInsets.all(8),
        itemBuilder: (context, position) {
          return Padding(
            padding: const EdgeInsets.only(bottom:16.0),
            child: Card(
              elevation: 5,
              shadowColor: Colors.deepPurple,
              child: Column(
                children: <Widget>[
                  _drawTwitterHeader(),
                  _drawTwitterBody(),
                  _drawDivider(),
                  _drawTwitterFooter(),
                ],
              ),
            ),
          );
        },
        itemCount: 15,
      ),
    );
  }

  Widget _drawTwitterHeader() {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: ExactAssetImage('assets/images/bg2.jpeg'),
                  fit: BoxFit.cover),
              shape: BoxShape.circle,
            ),
            width: 50,
            height: 50,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                Text(
                  'Mohamed Hossam ',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
                Text(
                  '@ElyomElsab3',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'sat,Aug 29,2020 . 7:20',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _drawTwitterBody() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: Text(
        'description description description description description description '
            'description description description description',
        style: TextStyle(
          fontSize: 18,
        ),
        maxLines: 3,
      ),
    );
  }

  Widget _drawDivider() {
    return Container(
      width: double.infinity,
      height: 1,
      color: Colors.grey.shade300,
      margin: EdgeInsets.only(top: 16),
    );
  }

  Widget _drawTwitterFooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only( left:16.0 ,right: 16),
              child: Icon(Icons.repeat),
            ),
            Text('20' ,style: TextStyle(color: Colors.grey),),
          ],
        ),

        Row(
          children: [
            FlatButton(
              onPressed: () {},
              child: Text('Share'),
              color: Colors.white,
            ),
            FlatButton(
              onPressed: () {},
              child: Text('Open'),
              color: Colors.white,
            ),
          ],
        ),

      ],
    );
  }
}
