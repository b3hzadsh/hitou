import 'package:flutter/material.dart';

class LearnScreen extends StatelessWidget {
  const LearnScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(onPressed: () {}, child: Text("sms without per")),
            ElevatedButton(onPressed: () {}, child: Text("call log ")),
            ElevatedButton(onPressed: () {}, child: Text("contact"))
          ],
        ),
      ),
    );
  }
}
