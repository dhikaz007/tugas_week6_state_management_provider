import 'dart:math';

import 'package:flutter/material.dart';

import '../../data/model/contact_data.dart';

// Data kontak awal yang ditampilkan
final List<ContactData> _initialData = [
  ContactData(
      firstName: 'Caleb',
      lastName: 'Rivera',
      phoneNumber: '+62-${Random().nextInt(100000)}'),
  ContactData(
      firstName: 'Isabella',
      lastName: 'White',
      phoneNumber: '+62-${Random().nextInt(100000)}'),
  ContactData(
      firstName: 'Jackson',
      lastName: 'Palel',
      phoneNumber: '+62-${Random().nextInt(100000)}'),
  ContactData(
      firstName: 'Mia',
      lastName: 'Lee',
      phoneNumber: '+62-${Random().nextInt(100000)}'),
  ContactData(
      firstName: 'Owen',
      lastName: 'Wright',
      phoneNumber: '+62-${Random().nextInt(100000)}'),
  ContactData(
      firstName: 'Benjamin',
      lastName: 'Chen',
      phoneNumber: '+62-${Random().nextInt(100000)}'),
];

// Provider kontak
class Contact with ChangeNotifier {
  // Parameter List kontak
  final List<ContactData> _listContact = _initialData;

  // Varibel untuk memanggil list kontak
  List<ContactData> get listContact => _listContact;

  // Fungsi menambahkan kontak baru pada list kontak
  add(ContactData cData) {
    _listContact.add(cData);
    notifyListeners();
  }

  // Fungsi mengurangi kontak pada list kontak
  remove(ContactData cData) {
    _listContact.remove(cData);
    notifyListeners();
  }
}
