// بتاع الاخبار اللى تحت كل تاب
import 'package:flutter/material.dart';
import 'package:news_app/api/api_manger.dart';
import 'package:news_app/api/model/NewsResponse.dart';
import 'package:news_app/api/model/SourcesResponse.dart';
import 'package:news_app/home/news/newsWidghit.dart';

class NewsList extends StatelessWidget {
  //هاخد اوبجكت من السورس
  Source source;
  NewsList(this.source);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          FutureBuilder<NewsResponse>(
              future: ApiManger.getNewsBySourceId(source.id ?? ''),
              builder: (buildContext, snapShot) {
                // هشوف الاول لو فى مشكله
                if (snapShot.hasError) {
                  return Center(child: Text(snapShot.error.toString()));
                }
                // لو لسه الداتا مجتش وبتعمل lodaing
                else if (snapShot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                // غير كده يعني جايلى داتا
                var data = snapShot.data;
                // بس ممكن الداتا تكون جايبا ايرور يعنى >>
                // لو الدتا اللى جايه من السيرفر او الكلاس بتاع status = error SourcesResponse
                if ('error' == data?.status) {
                  return Center(child: Text('${data?.message}'));
                }
                return Expanded(
                  child: ListView.builder(
                    itemBuilder: (_, index) {
                      return NewsWidget((data?.newsList![index])!);
                    },
                    itemCount: data?.newsList?.length ?? 0,
                  ),
                );
              }),
        ],
      ),
    );
  }
}
