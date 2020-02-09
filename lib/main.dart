import 'package:flutter/material.dart';
import 'package:hello_flutter/screens/infiniteList.dart';
import 'package:hello_flutter/screens/favoriteList.dart';
import 'package:hello_flutter/models/DataStruct.dart';
import 'package:english_words/english_words.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

var dataStruct = DataStruct<WordPair>(
  (int count) => generateWordPairs().take(count)
)
  ..add(generateWordPairs().take(10));

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => dataStruct
        ),
      ],
      child: MaterialApp(
        title: 'JohnHiFlutter',
        routes: {
          '/': (context) => InfiniteListScreen(),
          '/favorites': (context) => FavoriteListScreen()
        },
      )
    );
  }
}
