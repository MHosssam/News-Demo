import 'package:flutter/material.dart';
import 'package:thenews/api/post_api.dart';
import 'package:thenews/models/post.dart';
import 'package:thenews/utitites/data_utilites.dart';
import 'package:thenews/screens/single_post.dart';
import 'package:thenews/models/photo_title.dart';

class New extends StatefulWidget {
  @override
  _NewState createState() => _NewState();
}

class _NewState extends State<New> {
  PostsApi postsApi = PostsApi();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _drawHadder(),
          _drawTopStories(),
          _drawRecentUpdate(),
        ],
      ),
    );
  }

  Widget _drawHadder() {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: ExactAssetImage('assets/images/bg3.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'A5bark',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                'Know What Happen All Day ',
                style: TextStyle(fontSize: 20, color: Colors.white),
              )
            ],
          ),
        ),
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.2,
      );
  }

  Widget _drawTopStories() {
    return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 16),
              child: _drawTitle('Top Stories'),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Card(
                child: Column(
                  children: <Widget>[
                    _drawSingleRow(
                        'assets/images/n1.jpg',
                        'Alexei Navalny: Trump is refusing to condemn Russia in the event of "poisoning" a prominent Russian dissident',
                        'hossam'),
                    _drawDivider(),
                    _drawSingleRow('assets/images/n2.jpg',
                        'The Public Prosecutor refers the "lady of the court" to criminal trial ',
                        'mohamed'),
                    _drawDivider(),
                    _drawSingleRow('assets/images/n4.jpg',
                        'Jorge Messi is in a state of anger after the decision to keep his son in Barcelona',
                        'smsm'),
                  ],
                ),
              ),
            ),
          ],
        ),
    );
  }

  Widget _drawRecentUpdate() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: _drawTitle('Recent Update'),
          ),
          _drawRecentUpdateCard(
              Colors.deepOrangeAccent,
              'Weasel the jeeper goodness inconsiderately spelled so ubiquitous',
              'Sports',
              '1min',
              'assets/images/ahly.jpg'),
          _drawRecentUpdateCard(Colors.green, 'Amr Diab sings new songs',
              'Arts', '29sec', 'assets/images/Amr.jpg'),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }

  Widget _drawDivider() {
    return Container(
      width: double.infinity,
      height: 1,
      color: Colors.grey.shade300,
    );
  }

  Widget _drawSingleRow(String image, String title, String name) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return SinglePost(SendData( title ,image));
        }));
      },
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(
              child: Image(
                image: ExactAssetImage(image),
                fit: BoxFit.cover,
              ),
              width: 124,
              height: 124,
            ),
            SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    maxLines: 2,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(name),
                      Row(
                        children: <Widget>[
                          Icon(Icons.timer),
                          Text('25sec'),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _drawTitle(String title) {
    return Text(
      title,
      textAlign: TextAlign.left,
      style: TextStyle(
        fontSize: 20,
        color: Colors.grey.shade700,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _drawRecentUpdateCard(Color color, String description, String type, String time, String photo) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return SinglePost(SendData( description ,photo));
        }));
      },
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: ExactAssetImage(photo), fit: BoxFit.cover),
              ),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.3,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 8, top: 16),
              child: Container(
                padding: EdgeInsets.only(left: 24, right: 24),
                decoration: BoxDecoration(
                    color: color, borderRadius: BorderRadius.circular(3)),
                child: Text(
                  type,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 16,right: 8,
              ),
              child: Container(
                child: Text(
                  description,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 8, bottom: 10),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.timer,
                    color: Colors.grey,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 6),
                    child: Text(
                      time,
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
