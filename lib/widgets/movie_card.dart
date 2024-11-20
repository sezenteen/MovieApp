import 'package:flutter/material.dart';
import 'package:movie_app/model/movie/index.dart';
import 'package:movie_app/screens/movie_detail.dart';

class MovieCard extends StatelessWidget {
  // StatelessWidget бөгөөд энэ нь өөрчлөгдөх боломжгүй бөгөөд зөвхөн түүнд өгсөн өгөгдлийг харуулдаг.
  final MovieModel
      data; // Киноны талаарх мэдээллийг агуулсан MovieModel объектыг хадгалах эцсийн талбар (imgUrl болон гарчиг гэх мэт)
  // MovieCard үүсгэх үед өгөгдлийг параметр болгон дамжуулдаг.

  const MovieCard(this.data,
      {super.key}); // MovieCard нь MovieModel-ийг параметр болгон авч өгөгдөлд хуваарилдаг.
  // Super.key аргументыг өгсөн бол виджетийн түлхүүрийг эхлүүлэхэд ашигладаг.

  void _onCardTap(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => MovieDetailPage(data)));
  }

  @override
  Widget build(BuildContext context) {
    // Build нь виджетийн харааны бүтцийг бий болгох үүрэгтэй.
    final width = MediaQuery.of(context).size.width / 3 -
        20; // MediaQuery.of(context).size.width / 3 - 20: Дэлгэцийн хэмжээнээс хамаарч картын өргөнийг тооцоолно.
    // Энэ нь картын өргөнийг динамикаар тохируулж, гурван картыг дэлгэцэн дээр байрлуулах боломжийг олгоно.
    return InkWell(
        // ymar 1 child element deer darah bolomjtoi bolgodog widget
        onTap: () => _onCardTap(context),
        child: Column(
          children: [
            Container(
              height: width * 1.5,
              width: width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                    image: NetworkImage(data.imgUrl),
                    fit: BoxFit
                        .fill), //NetworkImage(data.imgUrl) нь data.imgUrl-аас өгсөн URL-аас зургийг ачаална.
                // BoxFit.fill) нь Хэмжээг нь гажуудуулахгүйгээр дүрс нь савыг бүхэлд нь дүүргэхийг баталгаажуулна.
              ),
            ),
            SizedBox(height: 5),
            SizedBox(
              width: width,
              child: Text(
                data.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.7),
                ),
              ),
            ),
          ],
        ));
  }
}
