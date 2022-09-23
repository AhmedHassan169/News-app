import 'package:flutter/material.dart';
import 'package:news_app/api/api_manger.dart';
import 'package:news_app/api/model/SourcesResponse.dart';
import 'package:news_app/home/categories/catogory.dart';
import 'package:news_app/home/news/sources_tab.dart';

class NewsFragment extends StatelessWidget {
  Catogory catogory ;
  NewsFragment(this.catogory);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          /// احسن حاجه عشان استخدم داتا جيالى من فانكشن future ان استخدم فى عرضها FutureBuilder
          FutureBuilder<SourcesResponse>(
              //future : الفانكشن الفيوشتر اللى عندى
              future: ApiManger.getNewsSource(catogory.id),
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
                // غير كده يعني فى داتا وراجعه
                var sources = data?.sources;
                return Sourcestap(sources!);
              })
        ],
      ),
    );
  }
}
