import 'package:flutter/material.dart';
import 'package:news_app/home/categories/catogrywidget.dart';

class CatogoryFragment extends StatelessWidget {
  @override
  var catogoris = Catogory.getallCatogory();
  Function onCatogryClickCallBack;
  CatogoryFragment(this.onCatogryClickCallBack);
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20, // النسيه بين عرض العناصر وبعضها
          mainAxisSpacing: 20, // النسبه بين طول العناصر وبعضها
        ),
        itemBuilder: (_, index) {
          return InkWell(
              onTap: () {
                onCatogryClickCallBack(catogoris[index]);
              }, child: CatogryWidget(catogoris[index], index));
        },
        itemCount: catogoris.length,
      ),
    );
  }
}

class Catogory {
  String id;
  String tittle;
  Color color;
  String img;
  Catogory(this.id, this.tittle, this.color, this.img);

  static List<Catogory> getallCatogory() {
    return [
      Catogory('sports', 'Sports', Color(0xFFC91C22), 'ball'),
      Catogory('general', 'General', Color(0xFF003E90), 'environment'),
      Catogory('health', 'Health', Color(0xFFED1E79), 'health'),
      Catogory('business', 'Business', Color(0xFFCF7E48), 'bussines'),
      Catogory('technology', 'Technology', Color(0xFF4882CF), 'Politics'),
      Catogory('science', 'Science', Color(0xFFF2D352), 'science'),

      // Catog(id, tittle, color, img)
    ];
  }
}
