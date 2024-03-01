import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/core/constants/home_page_constants.dart';
import 'package:test_app/feacture/splash_screen/presentation/page/splash_screen.dart';

void main() {
  AwesomeNotifications().initialize(
    null,
    [
      NotificationChannel(
        channelKey: 'location-update',
        channelName: "Location Update",
        channelDescription: "Notifications of Loacation update status",
      ),
    ],
  );
  runApp(const ProviderScope(child: MyApp()));
}

// //This project is follow by clean Architecture .
// //there was many folder and files are present in clean architecture but this project no need that blank folders that i will removed
// //Riverpod code generator is used .


// //before run the application please follow the things
// //    1) Go to the terminal of the application by Vs Code.
// //    2) PLease copy paste the code = flutter pub run build_runner build

class MyApp extends ConsumerWidget {
  static final scaffoldMessangerKey = GlobalKey<ScaffoldMessengerState>();
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final constants = ref.watch(homePageConstantsProvider);
    return MaterialApp(
        title: constants.txttitle,
        scaffoldMessengerKey: scaffoldMessangerKey,
        debugShowCheckedModeBanner: false,
        home: const SplashScreen());
  }
}
