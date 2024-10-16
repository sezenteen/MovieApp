import 'package:flutter/material.dart';
// Kinonii jagsaalt haruulah screen

class MoviesPage extends StatefulWidget {
  const MoviesPage({super.key});

  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Киноны жагсаалт"),
    );
  }
}
