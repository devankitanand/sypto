import 'package:flutter/material.dart';
import '../services/api_service.dart';
import 'detail_screen.dart';
import '../widgets/search_bar.dart' as custom;
import '../widgets/movie_card.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String query = 'Batman';
  int page = 1;
  bool isLoading = false;
  List<dynamic> movies = [];
  ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    fetchMovies();
    _controller.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_controller.position.pixels >=
        _controller.position.maxScrollExtent - 200) {
      fetchMovies(loadMore: true);
    }
  }

  Future<void> fetchMovies({bool loadMore = false}) async {
    if (isLoading) return;
    setState(() => isLoading = true);

    try {
      final newMovies = await ApiService.fetchMovies(query, page: page);
      setState(() {
        if (loadMore) {
          movies.addAll(newMovies);
          page++;
        } else {
          movies = newMovies;
          page = 2;
        }
        isLoading = false;
      });
    } catch (e) {
      setState(() => isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to fetch movies: $e')),
      );
    }
  }

  void _onSearch(String input) {
    setState(() {
      query = input;
      page = 1;
    });
    fetchMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("OMDb Movies")),
      body: Column(
        children: [
          custom.SearchBar(onSearch: _onSearch),
          Expanded(
            child: ListView.builder(
              controller: _controller,
              itemCount: movies.length,
              itemBuilder: (context, index) {
                final movie = movies[index];
                return MovieCard(
                  movie: movie,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => DetailScreen(imdbID: movie['imdbID']),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
