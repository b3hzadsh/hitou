import 'package:call_log/call_log.dart';
import 'package:flutter/material.dart';
import 'package:salambeto/controller/func.dart';
import 'package:salambeto/controller/stream_controller.dart';

class RealScreen extends StatefulWidget {
  RealScreen({Key? key}) : super(key: key);

  @override
  _RealScreenState createState() => _RealScreenState();
}

class _RealScreenState extends State<RealScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                flex: 2,
                child: Container(
                  child: StreamBuilder(
                    stream: textController.stream,
                    initialData: " ",
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        return Container(
                          child: Text(snapshot.data),
                        );
                      } else
                        return Text("");
                    },
                  ),
                  //child: Text(ContainerText),
                ),
              ),
              Flexible(
                flex: 1,
                child: ElevatedButton(
                    onPressed: () {
                      // sendSms("salam", "+989908050094");
                      permission();
                      // ContainerText = "Sms sent";
                      textController.chnage("Sms sent");
                    },
                    child: Text("sms without per")),
              ),
              Flexible(
                flex: 1,
                child: ElevatedButton(
                  onPressed: () async {
                    var contact = await readContact();
                    textController.chnage(contact[0].name! + "\n");
                    // ContainerText = contact[0].name! + "\n"; //+ contact[0].!
                  },
                  child: Text("contact"),
                ),
              ),
              FutureBuilder<Iterable<CallLogEntry>>(
                  future: callLog(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done &&
                        snapshot.hasData) {
                      Iterable<CallLogEntry> entries = snapshot.data!;
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(),
                          ),
                          width: double.infinity,
                          height: 300,
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                child: Card(
                                  child: ListTile(
                                    // title: Text(entries.first.number!),
                                    title:
                                        Text(entries.elementAt(index).number!),
                                  ),
                                ),
                              );
                            },
                            itemCount: entries.length,
                          ),
                        ),
                      );
                    } else {
                      return Center(
                          // child: CircularProgressIndicator(),
                          );
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
