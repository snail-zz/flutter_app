import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  final String id;

  Detail(this.id);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("详细信息"),
      ),
      body: new Container(
        child: new Text("详细信息" + id),
      ),
    );
  }
}
