import 'package:flutter/material.dart';

class CastCard extends StatelessWidget {
  final String name;
  final String? profilePath;

  const CastCard({
    required this.name,
    required this.profilePath,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      margin: EdgeInsets.symmetric(horizontal: 6),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: profilePath != null
                ? Image.network(
                    'https://image.tmdb.org/t/p/w200$profilePath',
                    height: 80,
                    width: 80,
                    fit: BoxFit.cover,
                  )
                : Container(
                    height: 80,
                    width: 80,
                    color: Colors.grey[800],
                    child: Icon(Icons.person, size: 40, color: Colors.white),
                  ),
          ),
          SizedBox(height: 8),
          Text(
            name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
