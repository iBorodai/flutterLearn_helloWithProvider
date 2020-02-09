import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hello_flutter/models/DataStruct.dart';
import 'package:english_words/english_words.dart';
import 'package:hello_flutter/screens/infiniteList.dart';

class FavoriteListScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites list')
      ),
      body: Center(
        child: _buildNamesList()
      )
    );
  }

  Widget _buildNamesList() {
    return Consumer<DataStruct<WordPair>> (
      builder: (context, dataStruct, child) {
        final saved = dataStruct.saved;

        return ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: saved.length * 2,
          itemBuilder: (context, i) {
            if (i.isOdd) return Divider();
            final index = i ~/ 2;
            final pair = saved[index];

            return buildRow(
              pair, 
              true,
              (item) => dataStruct.unsave(item)
            );
          }
        );
      }
    );
  }
  
}