import 'package:flutter/material.dart';
import 'package:salambeto/real/real_screen.dart';
import 'package:get/get.dart';
import 'package:telephony/telephony.dart';
import 'package:flutter/services.dart';
import 'package:pushy_flutter/pushy_flutter.dart';

import '../../main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Pushy.listen();
    Pushy.setNotificationListener(backgroundNotificationListener);
    final Telephony telephony = Get.put(Telephony.instance);
    //TODO  May need change
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Get.to(RealScreen());
                },
                child: Text("real project")),
            ElevatedButton(
                onPressed: () async {
                  //TODO may need change rem async
                  pushyRegister();
                },
                child: Text("learn project"))
          ],
        ),
      ),
    );
  }

  Future pushyRegister() async {
    try {
      // Register the user for push notifications
      String deviceToken = await Pushy.register();

      // Print token to console/logcat
      print('Device token: $deviceToken');

      // Display an alert with the device token
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
                title: Text('Pushy'),
                content: Text('Pushy device token: $deviceToken'),
                actions: [
                  TextButton(
                    child: Text('OK'),
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true).pop('dialog');
                    },
                  ),
                ]);
          });

      // Optionally send the token to your backend server via an HTTP GET request
      // ...
    } on PlatformException catch (error) {
      // Display an alert with the error message
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
                title: Text('Error'),
                content: Text(error.message!),
                actions: [
                  TextButton(
                      child: Text('OK'),
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true)
                            .pop('dialog');
                      })
                ]);
          });
    }
  }
}
