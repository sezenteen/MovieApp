import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movie_app/model/movie/index.dart';
import 'package:movie_app/widgets/movie_card.dart';
import 'package:movie_app/widgets/movie_special_card.dart';

// StatefulWidget нь киноны өгөгдлийг асинхрон байдлаар татах, харуулахад шаардлагатай төлөвийн өөрчлөлтийг хянах боломжтой болгодог.
class MoviesPage extends StatefulWidget {
  const MoviesPage({super.key});

  @override
  State<MoviesPage> createState() => _MoviesPageState();
  // createState() нь виджетийн төлөвийг эхлүүлж, _MoviesPageState-ийн жишээг буцаана.
  // _MoviesPageState ангилал нь MoviesPage-ийн үндсэн логик болон UI-г агуулдаг.
}

class _MoviesPageState extends State<MoviesPage> {
  // _getData - аар JSON өгөгдлийг локал файл дуудаж ажиллуулдаг  асинхрон функц.
  Future<List<MovieModel>> _getData() async {

    // JSON контентыг мөр болгон татахын тулд DefaultAssetBundle.of(context).loadString(...) ашигладаг.
    String res = await DefaultAssetBundle.of(context).loadString("assets/movies.json");

    // JSON мөрийг jsonDecode(res) ашиглан тайлах ба MovieModel.fromList нь код тайлсан JSON-г MovieModel объектуудын жагсаалт болгон хувиргадаг.
    return MovieModel.fromList(jsonDecode(res));

    // MovieModel Future<List<MovieModel>>-ийг буцааж, дараа нь кодын FutureBuilder-тэй асинхрон өгөгдөл татах боломжийг олгоно.
  }

  @override
  // build нь киноны хуудасны бүтцийг бүхэлд нь багтаасан виджетийн UI-г үзүүлэхээр дуудагддаг.
  Widget build(BuildContext context) {
    // _getData()-аас өгөгдлийн асинхрон ачааллыг зохицуулахын тулд FutureBuilder ашигладаг.
    return FutureBuilder(
      // _getData()-аас өгөгдлийн асинхрон ачааллыг зохицуулахын тулд FutureBuilder ашигладаг.
      // FutureBuilder нь ирээдүй (_getData() арга) болон бүтээгч функцийг ашигладаг бөгөөд энэ нь ирээдүйн төлөв байдалд
      // (ачаалагдсан, ачаалагдсан эсвэл алдаа гарсан эсэх) үндэслэн UI-г дахин бүтээдэг.
      future: _getData(),
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
          // Snapshot state check Өгөгдөл бэлэн болсон үед (snapshot.hasData): UI нь киноны өгөгдөл дээр тулгуурлан бүтээгдэнэ.
          final _specialData = snapshot.data!.length > 3 ? snapshot.data!.sublist(0, 3) : snapshot.data!;
          // _specialData: 3-аас дээш кино байгаа бол шилдэг 3 киног сонгох хувьсагч; үгүй бол бүх киног ашигладаг.
          return SingleChildScrollView( // (SingleChildScrollView) нь _specialData доторх кино бүрийн MovieSpecialCard виджетүүдийг хэвтээ чиглэлд харуулдаг.
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    "Шилдэг",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                SingleChildScrollView(
                  padding: EdgeInsets.only(left: 10),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      _specialData.length,
                      ((index) => MovieSpecialCard(_specialData[index])),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    "Бүх кинонууд",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Wrap( // Wrap виджет нь snapshot.data!-д байгаа кино тус бүрийy MovieCard виджетийг ашиглан бүх киног сүлжээ байрлалаар харуулдаг.
                    spacing: 20,
                    runSpacing: 10,
                    children: List.generate(
                      snapshot.data!.length,
                      (index) => MovieCard(snapshot.data![index]),
                    ),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          );
        } else {
          return Center(
            child: SizedBox(
              height: 30,
              width: 30,
              //Өгөгдөл ачаалж байх үед (жишээ нь, Future дуусахаас өмнө):  Ачаалахыг харуулахын тулд төвлөрсөн CircularProgressIndicator-ийг харуулна.
              child: CircularProgressIndicator(),
            ),
          );
        }
      }),
    );
  }
}