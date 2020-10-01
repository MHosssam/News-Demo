import 'package:flutter/material.dart';
import 'package:thenews/ui/navigation_drawer.dart';

class InstagramFeed extends StatefulWidget {
  @override
  _InstagramFeedState createState() => _InstagramFeedState();
}

class _InstagramFeedState extends State<InstagramFeed> {

  int counter = 15 ;

  void incrementCounter(){
    counter += 1;
  }
  void decrementCounter(){
    counter -= 1;
  }

  List <int> id =[0 , 2 , 7 , 12 ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Instagram Feeds'),
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
                  _drawInstagramHeader(position),
                  _drawInstagramBody(),
                  _drawInstagramFooter(),
                ],
              ),
            ),
          );
        },
        itemCount: 15,
      ),
    );
  }

  Widget _drawInstagramHeader(int position) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: [
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
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  if(id.contains(position)){
                    id.remove(position);
                    decrementCounter();
                  }else{
                    id.add(position);
                    incrementCounter();
                  }
                  setState(() {

                  });
                },
                icon: Icon(
                  Icons.favorite,
                  size: 35,
                  color: (id.contains(position)) ? Colors.red : Colors.grey.shade400,
                ),
              ),
              Text(
                '$counter',
                style: TextStyle(
                  color: Colors.grey.shade600,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _drawInstagramBody() {
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

  Widget _drawInstagramFooter() {
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
              child: Text('Open'),
            ),
          ],
        ),
      ],
    );
  }
}
