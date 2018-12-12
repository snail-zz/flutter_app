import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final wordPair = new WordPair.random();
    return new MaterialApp(
      title: '你好',
      theme: new ThemeData(
        primaryColor: Colors.amber
      ),
      home: new Scaffold(
       /* appBar: new AppBar(
          title: new Text('欢迎来到Flutter'),
        ),*/
        body: new Center(
          //child: new Text('Hello World'),
          child: new RandomWords(),
        ),
      ),
    );
  }
}

class RandomWordState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  //收藏缓存
  final _saved = new Set<WordPair>();

  Widget _buildSuggestions() {
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return new Divider();

          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);

    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    /*final wordPair = new WordPair.random();
    return new Text(wordPair.asPascalCase);*/

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Startup Name Genrenator'),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved)
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      final titles = _saved.map((pair) {
        return new ListTile(
          title: new Text(pair.asPascalCase, style: _biggerFont),
        );
      });
      final divied =
          ListTile.divideTiles(tiles: titles, context: context).toList();

      return new Scaffold(
        appBar: new AppBar(
          title: new Text('Saved Suggestions'),
        ),
        body: new ListView(children: divied),
      );
    }));
  }
}

class RandomWords extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new RandomWordState();
  }
}
