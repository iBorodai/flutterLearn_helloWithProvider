import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

typedef Iterable<WordPair> ListOfPairsGen(int count);

class DataStruct<T> extends ChangeNotifier {
  final _data = <T>[];
  final _saved = Set<T>();
  
  final ListOfPairsGen getNextBlock;

  DataStruct(this.getNextBlock);

  get length {
    return _data.length;
  }

  get items {
    return _data;
  }

  get saved {
    return _saved.toList();
  }

  getByIndex(index) {
    final step = 10;
    if(index >= this.length) {
      final addCount = ( (index + 1 - this.length) / step ).ceil() * step;
      this.add(getNextBlock(addCount));
    }
    return _data[index];
  }

  isSaved(item) {
    return _saved.contains(item);
  }

  add(items) {
    _data.addAll(items);
    notifyListeners();
  }

  save(item) {
    _saved.add(item);
    notifyListeners();
  }

  unsave(item) {
    _saved.remove(item);
    notifyListeners();
  }
}
