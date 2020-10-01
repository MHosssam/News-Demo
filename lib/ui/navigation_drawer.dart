import 'package:flutter/material.dart';
import 'package:thenews/models/nav_menu.dart';
import 'package:thenews/screens/headline_news.dart';
import 'package:thenews/screens/home.dart';
import 'package:thenews/screens/twitter_feeds.dart';
import 'package:thenews/screens/instgram_feed.dart';
import 'package:thenews/screens/facebook_feed.dart';

class NavigationDrawer extends StatefulWidget {
  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {

  List <NavMenuItem> navigationMenuItem =[
    NavMenuItem('Explore', () => HomeScreen()),
    NavMenuItem('HeadLine News', () => HeadLine()),
    NavMenuItem('Twitter Feed', () => TwitterFeed()),
    NavMenuItem('Instagram Feed', () => InstagramFeed()),
    NavMenuItem('Facebook Feed', () => FacebookFeed()),
  ];


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.only(left: 10 , top: 150),
        child: ListView.builder(
          itemBuilder: (context, position) {
            return Padding(
              padding: const EdgeInsets.only(top: 8 ),
              child: ListTile(
                title: Text(
                  navigationMenuItem [position].title,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey.shade600,
                  ),
                ),
                trailing: Icon(Icons.chevron_right),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                   return navigationMenuItem[position].destination() ;
                  }));
                },
              ),
            );
          },
          itemCount: navigationMenuItem.length,
        ),
      ),
    );
  }
}
