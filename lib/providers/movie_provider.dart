import 'package:flutter/material.dart';
import '../models/movie.dart';
import '../services/api_service.dart';

class MovieProvider extends ChangeNotifier {
  List<Movie> movies = [];
  bool isLoading = false;

  Future<void> loadMovies() async {
    isLoading = true;
    notifyListeners();
    final fetchedMovies = await ApiService().fetchTrendingMovies();
    movies =
        fetchedMovies.map((movieData) => Movie.fromJson(movieData)).toList();
    isLoading = false;
    notifyListeners();
  }
}
