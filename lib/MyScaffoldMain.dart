import 'package:flutter/material.dart';
import 'package:flutter_app/FirstPage.dart';

class MyScaffoldMain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _MyScaffoldMain();
  }
}

class _MyScaffoldMain extends State<MyScaffoldMain>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = new TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          "测试",
          textAlign: TextAlign.center,
        ),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.grade), onPressed: null),
          new IconButton(icon: new Icon(Icons.share), onPressed: null)
        ],
      ),
      body: new TabBarView(
        controller: tabController,
        children: <Widget>[new FirstPage(), new FirstPage(), new FirstPage()],
      ),
      bottomNavigationBar: new Material(
        color: Colors.orangeAccent,
        child: new TabBar(controller: tabController, tabs: <Tab>[
          new Tab(
            text: '列表',
            icon: new Icon(Icons.home),
          ),
          new Tab(
            text: '通知',
            icon: new Icon(Icons.message),
          ),
          new Tab(text: '我的', icon: new Icon(Icons.cloud)),
        ]),
      ),
    );
    ;
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
}
