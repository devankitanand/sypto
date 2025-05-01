import 'package:flutter/material.dart';
import '../services/api_service.dart';

class DetailScreen extends StatefulWidget {
  final String imdbID;

  DetailScreen({required this.imdbID});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  Map<String, dynamic>? movie;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchMovieDetails();
  }

  Future<void> fetchMovieDetails() async {
    try {
      final data = await ApiService.fetchMovieDetails(widget.imdbID);
      setState(() {
        movie = data;
        isLoading = false;
      });
    } catch (e) {
      setState(() => isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to fetch movie details: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading || movie == null) {
      return Scaffold(
          appBar: AppBar(), body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: AppBar(title: Text(movie!['Title'] ?? '')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (movie!['Poster'] != 'N/A')
              Center(
                child: Image.network(
                  movie!['Poster'],
                  height: 250,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset('assets/images/placeholder.png',
                        height: 250);
                  },
                ),
              ),
            SizedBox(height: 16),
            Text('Year: ${movie!['Year']}'),
            Text('Rated: ${movie!['Rated']}'),
            Text('Released: ${movie!['Released']}'),
            Text('Runtime: ${movie!['Runtime']}'),
            Text('Genre: ${movie!['Genre']}'),
            SizedBox(height: 10),
            Text('Plot:', style: TextStyle(fontWeight: FontWeight.bold)),
            Text(movie!['Plot'] ?? 'No plot available'),
          ],
        ),
      ),
    );
  }
}
