import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:english_words/english_words.dart';
import 'package:hello_flutter/models/DataStruct.dart';

class InfiniteListScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Basic generated list'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.favorite), onPressed: () => _pushSaved(context))
        ],
      ),
      body: Center(
        child: _buildNamesList()
      )
    );
  }
}


Widget _buildNamesList() {
  return Consumer<DataStruct<WordPair>> (
    builder: (context, dataStruct, child) {
      return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return Divider();
          final index = i ~/ 2;
          final pair = dataStruct.getByIndex(index);
          final bool isSaved = dataStruct.isSaved(pair);
          return buildRow(
            pair, 
            isSaved,
            (item) => dataStruct.isSaved(item)
              ?dataStruct.unsave(item)
              :dataStruct.save(item)
          );
        }
      );
    }
  );
}

Widget buildRow(WordPair pair, bool isSaved, onTapHandler) {

  final _styleBiggerFont = const TextStyle(fontSize: 18.0);

  return ListTile(
    title: Text(
      pair.asPascalCase,
      style: _styleBiggerFont,
    ),
    trailing: Icon(
      isSaved ? Icons.favorite : Icons.favorite_border,
      color: isSaved ? Colors.red : null,
    ),
    onTap: () {
      onTapHandler(pair);
    },
  );
}

void _pushSaved(context){
  Navigator.of(context).pushNamed('/favorites');
}