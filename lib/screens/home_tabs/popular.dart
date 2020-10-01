import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:thenews/models/list_of_news.dart';
import 'package:thenews/models/photo_title.dart';
import 'package:thenews/screens/single_post.dart';

class Popular extends StatefulWidget {
  @override
  _NewState createState() => _NewState();
}

class _NewState extends State<Popular> {
  List<ListOfNews> news;

  Void _newsList() {
    news = List<ListOfNews>();
    news.add(ListOfNews(
        'assets/images/ahly.jpg', 'hossam', 'El-ahly obtain new player '));
    news.add(ListOfNews('assets/images/Amr.jpg', 'smsm', 'New Album'));
    news.add(ListOfNews('assets/images/n1.jpg', 'medo',
        'Alexei Navalny: Trump is refusing to condemn Russia in the event of "poisoning"'));
    news.add(ListOfNews('assets/images/n2.jpg', 'ali',
        'The Public Prosecutor refers the "lady of the court" to criminal trial'));
    news.add(ListOfNews('assets/images/n3.jpg', 'mohamed',
        'In light of the floods, torrents and rains that continue to claim damage and lives in Sudan, a storm of solidarity erupted through the communication sites, calling for sending aid to the afflicted Sudanese.'));
    news.add(ListOfNews(
        'assets/images/bg.jpg', 'ashraf', 'Sissi made a new decision'));
    news.add(ListOfNews('assets/images/bg2.jpeg', 'hoss',
        'Increase the wages of ministers and the judiciary'));
    news.add(ListOfNews('assets/images/bg3.jpeg', 'mohamed',
        'Date of the Peoples Assembly elections'));
    news.add(ListOfNews('assets/images/bg.jpg', 'ahmed',
        'Decisions taken at a cabinet meeting'));
    news.add(ListOfNews('assets/images/bg3.jpeg', 'ramadan',
        'As a result of the coordination of universities 2020'));
  }

  @override
  Widget build(BuildContext context) {
    _newsList();
    return ListView.builder(
      itemBuilder: (context, position) {
        return Card(
          child: Column(
            children: <Widget>[
              _drawSingleRow(position),
              _drawDivider(),
            ],
          ),
        );
      },
      itemCount: news.length,
    );
  }

  Widget _drawDivider() {
    return Container(
      width: double.infinity,
      height: 1,
      color: Colors.grey.shade300,
    );
  }

  Widget _drawSingleRow(int position) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return SinglePost(SendData( news[position].title,news[position].image));
        }));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            SizedBox(
              child: Image(
                image: ExactAssetImage(news[position].image),
                fit: BoxFit.cover,
              ),
              width: 130,
              height: 130,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      news[position].title,
                      maxLines: 2,
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(news[position].outhor),
                          Row(
                            children: <Widget>[
                              Icon(Icons.timer),
                              Text('15 min'),
                            ],
                          ),
                        ],
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
