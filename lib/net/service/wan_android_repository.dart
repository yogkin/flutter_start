

import 'package:flutter_start/model/article.dart';
import 'package:flutter_start/model/banner.dart';
import 'package:flutter_start/net/wan_android_api.dart';

class WanAndroidRepository {
  // 轮播
  static Future fetchBanners() async {
    var response = await http.get('banner/json');
    return response.data
        .map<Banner>((item) => Banner.fromJsonMap(item))
        .toList();
  }

  // 置顶文章
  static Future fetchTopArticles() async {
    var response = await http.get('article/top/json');
    return response.data.map<Article>((item) => Article.fromMap(item)).toList();
  }
}
