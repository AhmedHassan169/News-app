import 'package:flutter/material.dart';
import 'package:news_app/api/model/SourcesResponse.dart';
import 'package:news_app/home/news/news_list.dart';
import 'package:news_app/home/news/tap.dart';


class Sourcestap extends StatefulWidget {
  List<Source> sources;
  Sourcestap(this.sources);

  @override
  State<Sourcestap> createState() => _SourcestapState();
}

class _SourcestapState extends State<Sourcestap> {
  int selectedtap = 0;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DefaultTabController(
          length: widget.sources.length,
          child: Column(
            children: [
              TabBar(
                  //هعمل فانكشن عشان اشوف اذا كانت هى selected or unselected
                  onTap: (index) {
                    selectedtap = index;
                    setState(() {});
                  },

                  // عشان اشيل الخط اللى تحت كل تاب
                  indicatorColor: Colors.transparent,
                  isScrollable: true,

                  ///لو عندى list[نوع] وعايز احولها لاى نوع تانى بعمل فانكشن map
                  //هحول List[sources] to List[tap]
                  tabs: widget.sources.map((sources) {
                    // cheek if index of source == selected tap
                    var isSelected =
                        widget.sources.indexOf(sources) == selectedtap;
                    return Tap(sources, isSelected);
                  }).toList()),
              // بعدين هروح اجيب الداتا بتاع كل خبر واقف عليه فى التاب
              // sources[selectedtap] : اللى انا محددها
              NewsList(widget.sources[selectedtap]),


            ],
          )),
    );
  }
}
