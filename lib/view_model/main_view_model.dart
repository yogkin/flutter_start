import 'package:flutter_start/model/banner.dart';
import 'package:flutter_start/net/service/wan_android_repository.dart';
import 'package:flutter_start/net/wan_android_api.dart';
import 'package:flutter_start/provider/view_state_model.dart';

class MainViewModel extends ViewStateModel {
  List<Banner> bannerList = [];

  String getBannerList() => bannerList.map((e) => e.title).join(',');

  getBannerInfo() async {
    var result = await post('banner/json');
    bannerList =
        result.map<Banner>((item) => Banner.fromJsonMap(item)).toList();
    notifyListeners();
  }
}
