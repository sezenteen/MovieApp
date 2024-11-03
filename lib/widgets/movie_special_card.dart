import 'package:flutter/material.dart';
import 'package:movie_app/model/movie/index.dart';

class MovieSpecialCard extends StatelessWidget {
  final MovieModel data;

  const MovieSpecialCard(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(data.imgUrl))),
      child: Icon(Icons.play_circle),
    );
  }
}
