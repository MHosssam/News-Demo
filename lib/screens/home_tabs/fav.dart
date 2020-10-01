import 'dart:math';

import 'package:flutter/material.dart';

class Fav extends StatefulWidget {
  @override
  _NewState createState() => _NewState();
}

class _NewState extends State<Fav> {
  List<Color> colorsList = [
    Colors.red,
    Colors.green,
    Colors.yellow,
    Colors.indigo,
    Colors.purple,
    Colors.orange,
    Colors.teal,
  ];

  List<int> LikeList=[1 , 6 , 9];

  Random random = Random();

  Color _randomColor() {
    return colorsList[random.nextInt(colorsList.length)];
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, position) {
        return Card(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                _titleRow(position),
                SizedBox(height: 16,),
                _contentRow(),
              ],
            ),
          ),
        );
      },
      itemCount: 20,
    );
  }

  Widget _titleRow(int position) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: ExactAssetImage('assets/images/bg2.jpeg'),
                    fit: BoxFit.cover),
                shape: BoxShape.circle,
              ),
              width: 50,
              height: 50,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    'Mohamed Hossam',
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '15 min .',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      Text(
                        'LifeStyle',
                        style: TextStyle(fontSize: 16, color: _randomColor()),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        IconButton(
          icon: Icon(
            Icons.favorite,
            color:(LikeList.contains(position))? Colors.red : Colors.grey,
          ),
          onPressed: () {
            if (LikeList.contains(position)){
              LikeList.remove(position);
            }else {
              LikeList.add(position);
            }
            setState(() {

            });
          },
        )
      ],
    );
  }

  Widget _contentRow() {
    return Row(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: ExactAssetImage('assets/images/bg.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          width: 150,
          height: 150,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Main Title',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    'Description Description Description Description Description Description ',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                    maxLines: 3,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
