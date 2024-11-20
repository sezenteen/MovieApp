import 'package:flutter/material.dart';
import 'package:movie_app/model/movie/index.dart';
import 'package:movie_app/screens/movie_detail.dart';

class MovieSpecialCard extends StatelessWidget {
  final MovieModel data;

  const MovieSpecialCard(this.data, {super.key});

  void _onCardTap(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => MovieDetailPage(data)));
  }

  @override
  // Build арга нь MovieSpecialCard-ийн харагдах байдлыг бий болгох үүрэгтэй.
  Widget build(BuildContext context) {

    // double width = MediaQuery.of(context).size.width * 0.5:
    // Картын өргөнийг дэлгэцийн өргөний хагасаар тооцож, картыг дэлгэцийн хэмжээтэй пропорциональ тохируулна.
    double width = MediaQuery.of(context).size.width * 0.5;
    
    return InkWell(
      onTap: () => _onCardTap(context),
      child: Container(
      // MovieSpecialCard-ын үндсэн бүтэц нь киноны дүрсийг дэвсгэр болгож, түүн дээр тоглуулах дүрсийг харуулсан Контейнер юм.
      height: width * 1.5,
      width: width,
      margin: EdgeInsets.only(right: 10), // margin: EdgeInsets.only(баруун талд: 10):
      // Энэ картыг дараалан харуулах үед бусад картаас тусгаарлахын тулд баруун талд 10 пикселийн зай нэмнэ.
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(image: NetworkImage(data.imgUrl), fit: BoxFit.fill),
      ),
      child: Icon(
        Icons.play_circle,
        color: Colors.grey.withOpacity(0.6),
        size: 60,
      ),
    ),
    );
  }
}