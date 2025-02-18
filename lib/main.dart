
import 'package:flutter/material.dart';
import 'package:movie2url/views/barang.dart';
import 'package:movie2url/views/dashboard.dart';
import 'package:movie2url/views/login_view.dart';
import 'package:movie2url/views/pesanan.dart';
import 'package:movie2url/views/register_user_view.dart';


void main() {
  runApp(MaterialApp(
    initialRoute: '/login',
    routes: {
      '/': (context) => RegisterUserView(),
      '/login':(context) => LoginView(),
      '/dashboard':(context) =>DashboardView(),
      '/barang':(context) =>MovieView(),
      '/pesanan':(context) =>PesanView(),
    },
  ));
}
