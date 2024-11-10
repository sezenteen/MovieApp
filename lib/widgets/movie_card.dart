import 'package:flutter/material.dart';
import 'package:movie_app/model/movie/index.dart';

class MovieCard extends StatelessWidget {
  final MovieModel data;

  const MovieCard(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.3;
    return Column(
      children: [
        Container(
          height: 200,
          width: 100,
          decoration: BoxDecoration(
            image: DecorationImage(image: NetworkImage(data.imgUrl))),
      )
    ]);
  }
}
