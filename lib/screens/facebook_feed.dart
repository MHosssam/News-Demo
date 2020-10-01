import 'package:flutter/material.dart';
import 'package:thenews/ui/navigation_drawer.dart';

class FacebookFeed extends StatefulWidget {
  @override
  _FacebookFeedState createState() => _FacebookFeedState();
}

class _FacebookFeedState extends State<FacebookFeed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Facebook Feeds'),
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
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Card(
              elevation: 5,
              shadowColor: Colors.deepPurple,
              child: Column(
                children: <Widget>[
                  _drawTwitterHeader(),
                  _drawTwitterBody(),
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
      padding: const EdgeInsets.only(left: 16.0, right: 16,),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            children: <Widget>[
              Text(
                'description description description description description description '
                    'description description description',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8),
            child: Text(
              '#description #description',
              style: TextStyle(
                color: Colors.deepOrange,
                fontSize: 18,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: ExactAssetImage('assets/images/bg.jpg'),
                  fit: BoxFit.cover),
            ),
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.25,
          ),
        ],
      ),
    );
  }

  Widget _drawTwitterFooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                '20',
              ),
            ),
            FlatButton(
              onPressed: () {},
              child: Text('Comments'),
            ),
          ],
        ),
        Row(
          children: [
            FlatButton(
              onPressed: () {},
              child: Text('Share'),
            ),
            FlatButton(
              onPressed: () {},
              child: Text('Like'),
            ),
          ],
        ),
      ],
    );
  }
}
