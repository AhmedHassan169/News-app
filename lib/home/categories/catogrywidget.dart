import 'package:flutter/material.dart';
import 'package:news_app/home/categories/catogory.dart';

class CatogryWidget extends StatelessWidget {
  Catogory catog;
  // هعمل متغير عشان اعرف اتحكم فى كل عنصر فى graid veiw
  int index;
  CatogryWidget(this.catog, this.index);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: catog.color,
          borderRadius:  BorderRadius.only(
            topRight: const Radius.circular(24),
            topLeft: const Radius.circular(24),
            bottomLeft: Radius.circular(index%2==0?24:0),
            bottomRight: Radius.circular(index%2==0?0:24),
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/${catog.img}.png',
            height: 120,
            fit: BoxFit.fitHeight,
          ),
          Text(
            catog.tittle,
            style: const TextStyle(fontSize: 22, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
