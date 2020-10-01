import 'package:flutter/material.dart';

class ListOfNews{

  String _image;
  String _outhor;
  String _title;


  ListOfNews(this._image, this._outhor, this._title);

  String get title => _title;

  String get outhor => _outhor;

  String get image => _image;
}