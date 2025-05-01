import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String _apiKey = 'b536f383';
  static const String _baseUrl = 'http://www.omdbapi.com/';

  static Future<List<dynamic>> searchMovies(String query, int page) async {
    try {
      final url = '$_baseUrl?s=$query&page=$page&apikey=$_apiKey';
      final response = await http.get(Uri.parse(url));
      final data = jsonDecode(response.body);
      if (data['Response'] == 'True') {
        return data['Search'];
      } else {
        return [];
      }
    } catch (e) {
      throw Exception('Failed to search movies: $e');
    }
  }

  Future<List<Map<String, dynamic>>> fetchTrendingMovies() async {
    // Simulate fetching data from an API
    await Future.delayed(Duration(seconds: 2));
    return [
      {'id': 1, 'title': 'Movie 1', 'rating': 8.5},
      {'id': 2, 'title': 'Movie 2', 'rating': 7.8},
    ];
  }

  static Future<List<dynamic>> fetchMovies(String query, {int page = 1}) async {
    try {
      final response = await http
          .get(Uri.parse('$_baseUrl?s=$query&page=$page&apikey=$_apiKey'));
      final data = json.decode(response.body);

      if (data['Response'] == 'True') {
        return data['Search'];
      } else {
        return [];
      }
    } catch (e) {
      throw Exception('Failed to fetch movies: $e');
    }
  }

  static Future<Map<String, dynamic>?> fetchMovieDetails(String imdbID) async {
    try {
      final url = '$_baseUrl?i=$imdbID&plot=full&apikey=$_apiKey';
      final response = await http.get(Uri.parse(url));
      final data = jsonDecode(response.body);
      return data['Response'] == 'True' ? data : null;
    } catch (e) {
      throw Exception('Failed to fetch movie details: $e');
    }
  }
}
