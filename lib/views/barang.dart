import 'package:flutter/material.dart';
import 'package:movie2url/widgets/bottom_nav.dart';


class MovieView extends StatefulWidget {
  const MovieView({super.key});


  @override
  State<MovieView> createState() => _MovieViewState();
}


class _MovieViewState extends State<MovieView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Barang"),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Text("barang"),
      bottomNavigationBar: BottomNav(1),
    );
  }
}
