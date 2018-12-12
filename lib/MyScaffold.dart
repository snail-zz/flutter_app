import 'package:flutter/material.dart';
import 'package:flutter_app/MyAppBar.dart';

class MyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Material(
      child: new Column(
        children: <Widget>[
          new MyAppBar(
            title: new Text(
              'Example title',
              style: Theme.of(context).primaryTextTheme.title,
            ),
          ),
          new Expanded(
              child: new Center(
            child: new Text("Hello world"),
          ))
        ],
      ),
    );
  }
}
