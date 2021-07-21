import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telephony/telephony.dart';

import 'view/screens/home_screen.dart';

Future<void> main() async {
  final Telephony telephony = Get.put(Telephony.instance);

  await telephony.requestPhoneAndSmsPermissions; //TODO  My need change
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomeScreen(),
    );
  }
}
