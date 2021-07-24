import 'package:flutter_contact/contact.dart' show Item;

class ContactModel {
  const ContactModel({
    required this.name,
    required this.phoneNumber,
  });

  final String? name;
  final List<Item> phoneNumber;
}
