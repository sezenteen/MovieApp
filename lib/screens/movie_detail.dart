import 'package:flutter/material.dart';
import 'package:movie_app/widgets/movie_special_card.dart';

// Custom scroll view ni utasnii native ruu handdag

class MovieDetailPage extends StatelessWidget {
  final MovieModel data;

  const MovieDetailPage(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Scrolliin appbar s davuu taltai
          SliverAppBar(
            title: Text(data.title),
          ),
          // 
          SliverList(delegate: SliverChildListDelegate(
            [],
          ))
        ],
      ),
    );
  }
}
