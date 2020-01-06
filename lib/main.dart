import 'package:burc_rehberi/burc_detay.dart';
import 'package:burc_rehberi/burc_listesi.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Burç Rehberi',
      initialRoute: "/burcListesi",
      routes: {
        "/": (context) => BurcListesi(),
        "/burcListesi": (context) => BurcListesi(),
      },
      onGenerateRoute: (RouteSettings settings) {
        List<String> pathAdresleri = settings.name.split("/");

        if (pathAdresleri[1] == "burcDetay") {
          return MaterialPageRoute(
              builder: (context) => BurcDetay(int.parse(pathAdresleri[2])));
        }
        return null;
      },
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
    );
  }
}
