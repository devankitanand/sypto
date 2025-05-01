import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final Map<String, dynamic> movie;
  final VoidCallback onTap;

  const MovieCard({required this.movie, required this.onTap, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: ListTile(
        leading: movie['Poster'] != 'N/A'
            ? SizedBox(
                width: 50,
                height: 50,
                child: Image.network(
                  movie['Poster'],
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(Icons.broken_image, size: 50);
                  },
                ),
              )
            : Icon(Icons.movie, size: 50),
        title: Text(movie['Title']),
        subtitle: Text('Released: ${movie['Year']}'),
        onTap: onTap,
      ),
    );
  }
}
