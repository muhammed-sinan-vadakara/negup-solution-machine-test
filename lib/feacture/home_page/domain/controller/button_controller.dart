import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:test_app/feacture/home_page/data/model/button_model.dart';
import 'package:test_app/feacture/home_page/presentation/provider/provider.dart';
import 'package:test_app/main.dart';

Future<bool> isLocationEnabled() async {
  return await Geolocator.isLocationServiceEnabled();
}

Future<bool> requestLocationPermission() async {
  var permission = await Geolocator.checkPermission();
  String messageToShow;
  bool isPermissionGranted = true;

  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      messageToShow = 'Location permission denied , Please Enable the location';
      isPermissionGranted = false;
    } else {
      messageToShow = 'Location permission granted , Thank you';
    }
  } else {
    messageToShow =
        'Location permission already granted,You can continue the work';
  }

  if (permission == LocationPermission.deniedForever) {
    messageToShow = 'Location denied forever';
    isPermissionGranted = false;
  }

  MyApp.scaffoldMessangerKey.currentState!.showSnackBar(
    SnackBar(
      content: Text(messageToShow),
    ),
  );

  return isPermissionGranted;
}

List<ButtonModel> buttonList = [
  ButtonModel(
    buttonName: 'Request Location Permission',
    buttonColor: const Color(0xFF2f80ed),
    onTap: (ref, context) async {
      if (await isLocationEnabled()) {
        if (await requestLocationPermission()) {
          print('Location permission granted');
        } else {
          print('Location permission denied');
        }
      } else {
        print('Location not enabled');
      }
    },
  ),
  ButtonModel(
    buttonName: 'Request Notification Permission',
    buttonColor: const Color(0xFFf2c94c),
    onTap: (ref, context) {
      print("Hello");
      AwesomeNotifications().requestPermissionToSendNotifications();
    },
  ),
  ButtonModel(
    buttonName: 'Start Location Update',
    buttonColor: const Color(0xFF27ae60),
    onTap: (ref, context) async {
      if (await requestLocationPermission()) {
        showDialog(
          context: context,
          builder: ((context) {
            return AlertDialog(
              title: const Text('Alert'),
              content: const Text('Are you sure'),
              actions: [
                TextButton(
                    onPressed: (() {
                      Navigator.pop(context);
                    }),
                    child: const Text('No')),
                TextButton(
                  onPressed: () {
                    ref.read(homeProvider.notifier).startLocationPolling();
                    AwesomeNotifications().createNotification(
                      content: NotificationContent(
                        id: 10,
                        channelKey: 'location-update',
                        actionType: ActionType.Default,
                        title: 'Location update started',
                      ),
                    );
                    Navigator.pop(context);
                  },
                  child: const Text('Yes'),
                )
              ],
            );
          }),
        );
      } else {
        showDialog(
          context: context,
          builder: ((context) {
            return const AlertDialog(
              title: Text('Alert'),
              content: Text('Place Enable Location permission'),
            );
          }),
        );
      }
    },
  ),
  ButtonModel(
    buttonName: 'Stop Location Update',
    buttonColor: const Color(0xFFeb5757),
    onTap: (ref, context) {
      ref.read(homeProvider.notifier).stopLocationPolling();
      AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: 11,
          channelKey: 'location-update',
          actionType: ActionType.Default,
          title: 'Location update stoped',
        ),
      );
    },
  ),
];
