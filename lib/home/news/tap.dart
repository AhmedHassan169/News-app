// source tap هعملها عشان استخدمها فى التحويل هحول List[sources] to List[tap] فى فانكشن

import 'package:flutter/material.dart';
import 'package:news_app/api/model/SourcesResponse.dart';

class  Tap extends StatelessWidget {
  Source sources;
  bool selected;
  Tap(this.sources,this.selected);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8,horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: selected? Theme.of(context).primaryColor : Colors.transparent,
        border: Border.all(color: Theme.of(context).primaryColor , width: 2)
      ),
      child: Text(sources.name??'' ,
        style: TextStyle(color: selected? Colors.white:  Theme.of(context).primaryColor,),),

    );
  }
}
