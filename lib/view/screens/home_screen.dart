import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ElevatedButton(onPressed: () {}, child: Text("real project")),
          ElevatedButton(onPressed: () {}, child: Text("learn project"))
        ],
      ),
    );
  }
}
