import 'package:flutter_contact/contacts.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:salambeto/model/contact.dart';
import 'package:call_log/call_log.dart';
// =================================== Send SMS
import 'package:telephony/telephony.dart';

Future<void> sendSms(String text, String num) async {
  final Telephony telephony = Get.find();
  await telephony.requestPhoneAndSmsPermissions;
  await telephony.sendSms(to: num, message: text);
}

// =================================== Read contacts
Future<List<ContactModel>> readContact() async {
  List<ContactModel> contacts = [];
  await Contacts.streamContacts(
          // bufferSize: 20 by default

          )
      .forEach(
    (contact) {
      contacts.add(
        ContactModel(
          name: contact.displayName,
          phoneNumber: contact.phones,
        ),
      );
    },
  );
  return contacts;
}
// =================================== Read call log

Future<Iterable<CallLogEntry>> callLog() async {
  // GET WHOLE CALL LOG
  // Iterable<CallLogEntry> entries = await CallLog.get();
  // QUERY CALL LOG (ALL PARAMS ARE OPTIONAL)
  var now = DateTime.now();
  Iterable<CallLogEntry> entries = await CallLog.get();
  int from = now.subtract(Duration(days: 5)).millisecondsSinceEpoch;
  int to = now.subtract(Duration(days: 1)).millisecondsSinceEpoch;
  // Iterable<CallLogEntry> entries = await CallLog.query(
  //   dateFrom: from,
  //   dateTo: to,

  // );
  return entries;
}

// =================================== permission handler
Future<void> permission() async {
  // if (await Permission.contacts.request().isGranted) {
  // Either the permission was already granted before or the user just granted it.
  // }

// You can request multiple permissions at once.
  Map<Permission, PermissionStatus> statuses = await [
    Permission.contacts,
    Permission.phone,
    Permission.sms,
  ].request();

  statuses.forEach(
    (key, value) {
      if (value == PermissionStatus.granted) {
        print("$key : ok");
      } else
        while (value == PermissionStatus.denied) {
          key.request();
        }
      if (value == PermissionStatus.permanentlyDenied)
        Future.error("$key :  permanentlyDenied");
    },
  );
  // print(statuses[Permission.location]);
}
