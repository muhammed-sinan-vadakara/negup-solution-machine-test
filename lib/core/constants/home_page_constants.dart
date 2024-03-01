import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_page_constants.g.dart';

class HomePageConstants {
  final String txttitle = "TEST APP";
}

@riverpod
HomePageConstants homePageConstants(HomePageConstantsRef ref) {
  return HomePageConstants();
}
