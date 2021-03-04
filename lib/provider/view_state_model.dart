import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_start/net/api.dart';
import 'package:flutter_start/net/wan_android_api.dart';

class ViewStateModel with ChangeNotifier {
  post(api, {params, withLoading = true}) async {
    if (withLoading) {
      EasyLoading.show();
    }
    Response response;
    try {
      response = await Http().post(api, data: params);
    } on DioError catch (e) {
      return resultError(e);
    } finally {
      if (withLoading) {
        EasyLoading.dismiss();
      }
    }
    return response.data;
  }

  ResponseData resultError(DioError e) {
    Response errorResponse;
    if (e.response != null) {
      errorResponse = e.response;
      errorResponse.statusMessage = e.message;
    } else {
      errorResponse =
          new Response(statusMessage: '发生未知错误，请稍后再试', statusCode: 666);
    }
    EasyLoading.showToast(errorResponse.statusMessage);
    return ResponseData(
        errorResponse.statusCode.toInt(), errorResponse.statusMessage, false);
  }
}
