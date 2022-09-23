import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/api/model/NewsResponse.dart';
import 'package:news_app/my_date_utils.dart';

class NewsWidget extends StatelessWidget {
  News news;
  NewsWidget(this.news);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // هستخدم باكدج اسمها cached Network IMage
          // : دى بتخليني فى علامه لود لحد ما الصوره تظهر , وبتحتفظ بالصوره مبتخلهاش تحمل كل شويه ,
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: CachedNetworkImage(
              height: 230,
              width: double.infinity,
              fit: BoxFit.cover,
              imageUrl: news.urlToImage ?? '',
              placeholder: (context, url) => Center(
                  child: CircularProgressIndicator()), //وقت ما الصوره بتحمل
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),

          Text(
            news.author ?? '',
            style: TextStyle(fontSize: 12, color: Color(0xFF79828B)),
          ),
          Text(
            news.title ?? '',
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Color(0xFF42505C)),
          ),
          Text(
            textAlign: TextAlign.end,
            /// الباكدج اللى بتقولك التاريخ دا من كام ساعه ذى بوست الفيس بوك كده ؟؟
            MyDateUtils.formatNewsDate(news.publishedAt ?? ''),
            style: TextStyle(fontSize: 12, color: Color(0xFF79828B)),
          ),
        ],
      ),
    );
  }
}
