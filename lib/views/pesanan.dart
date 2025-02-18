import 'package:flutter/material.dart';
import 'package:movie2url/widgets/bottom_nav.dart';


class PesanView extends StatefulWidget {
  const PesanView({super.key});


  @override
  State<PesanView> createState() => _PesanViewState();
}


class _PesanViewState extends State<PesanView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pesanan"),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Text("Pesanan"),
      bottomNavigationBar: BottomNav(1),
    );
  }
}
