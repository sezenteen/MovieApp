import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movie_app/model/movie/index.dart';
import 'package:movie_app/widgets/movie_card.dart';
import 'package:movie_app/widgets/movie_special_card.dart';
// Kinonii jagsaalt haruulah screen

class MoviesPage extends StatefulWidget {
  const MoviesPage({super.key});

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  // List<MovieModel> _data = [];
  // List<MovieModel> get _specialData =>
  //     _data.length > 3 ? _data.sublist(0, 3) : _data;

  Future<List<MovieModel>> _getData() async {
    String res =
        await DefaultAssetBundle.of(context).loadString("assets/movies.json");
    // JSON Decode ni String g json helberluu shiljvvldeg
    return MovieModel.fromList(jsonDecode(res));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getData(),
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
          final _specialData = snapshot.data!.length > 3
              ? snapshot.data!.sublist(0, 3)
              : snapshot.data!;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Special"),
  
                SingleChildScrollView(
                  child: Row(
                    children: List.generate(
                      _specialData.length,
                      ((index) => MovieSpecialCard(_specialData[index])),
                    ),
                  ),
                ),
              Text("Movies"),
              Wrap(
                children: List.generate(snapshot.data!.length, (index) => MovieCard(snapshot.data![index])),
              ),
            ],
          );
        } else {
          return Center(
            child: SizedBox(
              width: 30,
              height: 30,
              child: CircularProgressIndicator(),
            ),
          );
        }
      }),
    );
  }
}
