import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_page_constants.g.dart';

class HomePageConstants {
  final String txttitle = "TEST APP";
  final String txtSubHeading = "Login to your account";
  final String txtLoginBtn = "LOGIN";
  final String txtUserName = "User Name";
  final String txtPassword = "Password";
}

@riverpod
HomePageConstants homePageConstants(HomePageConstantsRef ref) {
  return HomePageConstants();
}
