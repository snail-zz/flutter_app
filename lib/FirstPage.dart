import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/Detail.dart';

class FirstPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _FirstPage();
  }
}

class _FirstPage extends State<FirstPage> {
  var data = [];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new ListView.builder(itemBuilder: (BuildContext context, int index) {
      return new Card(
        elevation: 10.0,
        child: new ListTile(
          subtitle: new Container(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Text(
                      "标题",
                      style: new TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16.0),
                    )
                  ],
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new Text("时间:"),
                        new Text("2018-12-23 23:23:11"),
                      ],
                    )
                  ],
                ),
                new Row(
                  children: <Widget>[
                    new Container(
                      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 2.0),
                      child: new Text('内容'),
                    )
                  ],
                )
              ],
            ),
          ),
          trailing: new Icon(
            Icons.keyboard_arrow_right,
            color: Colors.grey,
          ),
          onTap: () => _onTap('11'),
        ),
      );
    });
  }

  void _onTap(String id) {
    Navigator.of(context)
        .push(new PageRouteBuilder(pageBuilder: (BuildContext context, _,__) {
      return new Detail(id);
    }));
  }

  getDate() async {
    var url = '';
    var httpClient = new HttpClient();
    var result;
    var requst = await httpClient.getUrl(Uri.parse(url));
    var response = await requst.close();

    if (response.statusCode == HttpStatus.ok) {
      var json = await response.transform(utf8.decoder).join();
      result = jsonDecode(json);
    }

    setState(() {
      data = result;
    });
  }
}
