import 'package:burc_rehberi/models/burc.dart';
import 'package:burc_rehberi/utils/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BurcListesi extends StatelessWidget {
  static List<Burc> tumBurclar;

  @override
  Widget build(BuildContext context) {
    tumBurclar = veriKaynaginiHazirla();

    return Scaffold(
      appBar: AppBar(
        title: Text("Burçlar"),
      ),
      body: listeWidgetOlustur(),
    );
  }

  List<Burc> veriKaynaginiHazirla() {
    List<Burc> burclar = [];

    for (int i = 0; i < 12; i++) {
      String kucukresim = Strings.BURC_ADLARI[i].toLowerCase() + "${i + 1}.png";
      debugPrint(
          kucukresim); // "koc1.png" -- Koc geliyor normalde imagese esitlemek icin kucuk yapalım "koc" ve 1 ekleyelım
      String buyukresim =
          Strings.BURC_ADLARI[i].toLowerCase() + "_buyuk${i + 1}.png";

      Burc olusturBurc = Burc(Strings.BURC_ADLARI[i], Strings.BURC_TARIHLERI[i],
          Strings.BURC_GENEL_OZELLIKLERI[i], kucukresim, buyukresim);
      burclar.add(olusturBurc);
    }

    return burclar;
  }

  Widget listeWidgetOlustur() {
    return GridView.builder(
      itemCount: 12,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1,
      ),
      itemBuilder: (BuildContext context, int index) {
        return tekSatirBurc(context, index);
      },
    );
  }

  Widget tekSatirBurc(BuildContext context, int index) {
    Burc oanEklenecekBurc = tumBurclar[index];

    return GestureDetector(
      child: Container(
        width: 100,
        height: 100,
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
          boxShadow: [
            new BoxShadow(
              color: Colors.grey.shade400,
              offset: new Offset(0.0, 3.3),
              blurRadius: 9.0,
            )
          ],
//color: Colors.red[100 * (index % 9) + 100],
          gradient: LinearGradient(
            colors: [
              Colors.white,
              Colors.grey.shade400,
            ],
            begin: Alignment.centerRight,
            end: Alignment.bottomCenter,
          ),
          image: DecorationImage(
            image: AssetImage("images/" + oanEklenecekBurc.burcKucukResmi),
            fit: BoxFit.cover,
          ),

          borderRadius: new BorderRadius.all(new Radius.circular(20.0)),
        ),
        padding: EdgeInsets.all(0),
        alignment: Alignment.bottomRight,
        child: Container(
          width: 80,
          height: 25,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black38, Colors.black45, Colors.black45],
              begin: Alignment.centerRight,
              end: Alignment.bottomCenter,
            ),
            borderRadius: new BorderRadius.all(
              new Radius.circular(10.0),
            ),
          ),
          child: Align(
            child: Text(
              oanEklenecekBurc.burcAdi,
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
      onTap: () => Navigator.pushNamed(context, "/burcDetay/$index"),
    );
  }
}
