import 'package:flutter/material.dart';
import '../models/PageModel.dart';
import 'home.dart';
import 'package:page_view_indicator/page_view_indicator.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  List<PageModel> model;

  ValueNotifier<int> _pageview = ValueNotifier(0);

  void _addPages() {
    model = List<PageModel>();
    model.add(PageModel(
      'Welcome',
      'assets/images/bg.jpg',
      Icons.account_balance,
    ));
    model.add(PageModel(
      'Map',
      'assets/images/bg2.jpeg',
      Icons.map,
    ));
    model.add(PageModel(
      'Reader',
      'assets/images/bg3.jpeg',
      Icons.chrome_reader_mode,
    ));
  }

  @override
  Widget build(BuildContext context) {
    _addPages();

    return Stack(
      children: <Widget>[
        Scaffold(
          body: PageView.builder(
            itemBuilder: (context, Index) {
              return Stack(
                children: <Widget>[
                  Container(
                    // image in background
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: ExactAssetImage(model[Index].image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Transform.translate(
                        child: Icon(
                          model[Index].icon,
                          size: 200,
                          color: Colors.deepPurple,
                        ),
                        offset: Offset(0, -50),
                      ),
                      Text(
                        model[Index].title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 40, top: 20, right: 40),
                        child: Text(
                          "hi this is th splash screen from first app in flutter",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.white70,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
            itemCount: model.length,
            onPageChanged: (indexPage) {
              _pageview.value = indexPage;
            },
          ),
        ),
        Transform.translate(
          offset: Offset(0, 190),
          child:Center(
            child: _pageIndicator(model.length),
          ),
        ),
        //button
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
            child: SizedBox(
              width: double.infinity,
              height: 55,
              child: RaisedButton(
                color: Colors.deepPurple,
                shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15.0)) ,
                child: Text(
                  'GET STARTED',
                  style: TextStyle(color: Colors.white, fontSize: 23),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context){
                        return HomeScreen();
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _pageIndicator(int index) {
    return PageViewIndicator(
      pageIndexNotifier: _pageview,
      length: index,
      normalBuilder: (animationController, index) => Circle(
        size: 12.0,
        color: Colors.grey,
      ),
      highlightedBuilder: (animationController, index) => ScaleTransition(
        scale: CurvedAnimation(
          parent: animationController,
          curve: Curves.ease,
        ),
        child: Circle(
          size: 16.0,
          color: Colors.deepPurple,
        ),
      ),
    );
  }
}
