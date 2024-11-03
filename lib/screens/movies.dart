import 'package:flutter/material.dart';
import 'package:movie_app/model/movie/index.dart';
import 'package:movie_app/widgets/movie_special_card.dart';
// Kinonii jagsaalt haruulah screen

class MoviesPage extends StatefulWidget {
  const MoviesPage({super.key});

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  List<MovieModel> _data = [];
  List<MovieModel> get _specialData =>
      _data.length > 3 ? _data.sublist(0, 3) : _data;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Special"),
              SizedBox(
                height: 200,
                child: SingleChildScrollView(
                  child: Row(
                    children: List.generate(
                      _specialData.length,
                      ((index) => MovieSpecialCard(_specialData[index])),
                    ),
                  ),
                ),
              ),
              Text("Movies"),
              Wrap(
                children: [],
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
