import 'package:flutter/material.dart';

class MyRouteMain extends StatefulWidget {
  MyRouteMain({Key key, this.title}) : super(key: key);
  final String title;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _myRouteMainState();
  }
}

class _myRouteMainState extends State<MyRouteMain> {
  _openNewPage() {
    setState(() {
      Navigator.of(context).push(new MaterialPageRoute<Null>(
        builder: (BuildContext context) {
          return new Scaffold(
            appBar: new AppBar(
              title: new Text("新的页面"),
            ),
            body: new Center(
              child: new Text("新页面"),
            ),
            floatingActionButton: new FloatingActionButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: new Icon(Icons.reply),
            ),
          );
        },
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Text('点击打开新页面'),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _openNewPage(),
        child: new Icon(Icons.open_in_new),
      ),
    );
  }
}
