import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider_simple_list_app/model/movie_model.dart';

final List<Movie> intiialData = List.generate(
  50,
  (index) {
    return Movie(
        title: 'Movie $index',
        duration: '${Random().nextInt(100) + 60} minutes');
  },
);

class MovieProvider with ChangeNotifier {
  final List<Movie> _movies = intiialData;
  List<Movie> get movies => _movies;

  final List<Movie> _myList = [];
  List<Movie> get myList => _myList;
  void addToList(Movie movie) {
    _myList.add(movie);
    notifyListeners();
  }

  void removeFromList(Movie movie) {
    _myList.remove(movie);
    notifyListeners();
  }
}
