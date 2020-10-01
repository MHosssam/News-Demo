import 'package:flutter/material.dart';
import 'package:thenews/screens/pages/about.dart';
import 'package:thenews/screens/pages/contact.dart';
import 'package:thenews/screens/pages/help.dart';
import 'package:thenews/screens/pages/setting.dart';
import 'package:thenews/ui/navigation_drawer.dart';

import 'home.dart';
import 'home_tabs/fav.dart';
import 'home_tabs/popular.dart';

class HeadLine extends StatefulWidget {
  @override
  _HeadLineState createState() => _HeadLineState();
}

enum PopOutMenu { Help, About, Contacts, Settings }


class _HeadLineState extends State<HeadLine>
    with SingleTickerProviderStateMixin {

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 3, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("What is The News"),
        centerTitle: false,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          _PopOut(context),
        ],
        bottom: TabBar(
          indicatorColor: Colors.white,
          tabs: [
            Tab(
              text: " New ",
            ),
            Tab(
              text: " Popular ",
            ),
            Tab(
              text: " Favorites ",
            ),
          ],
          controller: _tabController,
        ),
      ),
      drawer: NavigationDrawer(),
      body: Center(
        child: TabBarView(
          children: [
            Fav(),
            Popular(),
            Fav(),
          ],
          controller: _tabController,
        ),
      ),
    );
  }

  Widget _PopOut(BuildContext context) {
    return PopupMenuButton<PopOutMenu>(
      itemBuilder: (context) {
        return [
          PopupMenuItem<PopOutMenu>(
            value: PopOutMenu.About,
            child: Text('About Us'),
          ),
          PopupMenuItem<PopOutMenu>(
            value: PopOutMenu.Contacts,
            child: Text('Contact'),
          ),
          PopupMenuItem<PopOutMenu>(
            value: PopOutMenu.Help,
            child: Text('Help !!'),
          ),
          PopupMenuItem<PopOutMenu>(
            value: PopOutMenu.Settings,
            child: Text('Settings'),
          ),
        ];
      },
      onSelected: (PopOutMenu menu) {
        switch( menu ){
          case PopOutMenu.About :
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return AboutUs();
            }));
            break;
          case PopOutMenu.Settings:
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Setting();
            }));
            break;
          case PopOutMenu.Contacts :
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Contact();
            }));
            break;
          case PopOutMenu.Help :
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Help();
            }));
            break;
        }
      },
    );
  }

}
