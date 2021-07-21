import 'package:flutter_contact/contact.dart' show Item;

class ContactModel {
  final String? name;
  final List<Item> phoneNumber;

  ContactModel({
    required this.name,
    required this.phoneNumber,
  });
}
