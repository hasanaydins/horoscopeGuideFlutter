import 'package:palette_generator/palette_generator.dart';

import 'package:burc_rehberi/burc_listesi.dart';
import 'package:burc_rehberi/models/burc.dart';
import 'package:flutter/material.dart';

class BurcDetay extends StatefulWidget {
  int gelenIndex;

  BurcDetay(this.gelenIndex);

  @override
  _BurcDetayState createState() => _BurcDetayState();
}

class _BurcDetayState extends State<BurcDetay> {
  Burc secilenBurc;
  Color baskinRenk;
  PaletteGenerator paletteGenerator;

  @override
  void initState() {
    super.initState();
    secilenBurc = BurcListesi.tumBurclar[widget.gelenIndex];

    baskinRengiBul();
  }

  void baskinRengiBul() {
    Future<PaletteGenerator> fpaletteGenerator =
        PaletteGenerator.fromImageProvider(
            AssetImage("images/" + secilenBurc.burcbuyukResmi));

    fpaletteGenerator.then((value) {
      paletteGenerator = value;

      setState(() {
        baskinRenk = paletteGenerator.dominantColor.color;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        primary: true,
        slivers: <Widget>[
          SliverAppBar(
            actions: <Widget>[],
            floating: false,
            pinned: true,
            backgroundColor: baskinRenk != 0 ? baskinRenk : Colors.purple,
            snap: false,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Container(
                child: Text(
                  secilenBurc.burcAdi + " Burcu ve Özellikleri",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    shadows: [
                      Shadow(
                        blurRadius: 20.0,
                        color: Colors.black,
                        offset: Offset(0, 5.0),
                      ),
                    ],
                  ),
                ),
                height: 30,
                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                decoration: BoxDecoration(
                  borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
                ),
                padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
              ),
              background: Image.asset(
                "images/" + secilenBurc.burcbuyukResmi,
                fit: BoxFit.fill,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: RichText(
                  text: TextSpan(
                    // set the default style for the children TextSpans
                    style: Theme.of(context)
                        .textTheme
                        .overline
                        .copyWith(fontSize: 16),
                    children: [
                      TextSpan(text: secilenBurc.burcAciklamasi),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
