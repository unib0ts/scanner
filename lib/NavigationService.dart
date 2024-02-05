import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static bool isSoundAlarm = true;
  static int count = 0;
  static int value = 0;
  static String IS_adUnitId = "";
  static String topUnitId = "";
  static String sizes = "", bannerPosition = "";
  static DatabaseReference databaseReference = FirebaseDatabase.instance.ref();

  static int getCount() {
    NavigationService.databaseReference
        .child('interstitial_ad_count')
        .onValue
        .listen((event) {
      final count = event.snapshot.value.toString();
      value = int.parse(count);
    });
    return value;
  }

  static String getInterstitialAdUnitId() {
    NavigationService.databaseReference
        .child('interstitial_ad_unit_id')
        .onValue
        .listen((event) {
      final adUnitId = event.snapshot.value.toString();
      IS_adUnitId = adUnitId;
    });
    return IS_adUnitId;
  }

  static AdSize selectSize(String size) {
    switch (size) {
      case "banner":
        return AdSize.banner;
      case "largeBanner":
        return AdSize.largeBanner;
      case "mediumRectangle":
        return AdSize.mediumRectangle;
      case "fullBanner":
        return AdSize.fullBanner;
      case "leaderboard":
        return AdSize.leaderboard;
      default:
        AdSize.banner;
    }
    return AdSize.banner;
  }

}

