import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final Function(String) onSearch;

  const SearchBar({required this.onSearch, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search movies...',
          suffixIcon: Icon(Icons.search),
          border: OutlineInputBorder(),
        ),
        onSubmitted: onSearch,
      ),
    );
  }
}
