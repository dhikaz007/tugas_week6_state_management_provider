// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../data/model/contact_data.dart';
import '../../widget/input_contact_widget.dart';

class AddContactPage extends StatelessWidget {
  late List<ContactData> addList;
  late GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();
  AddContactPage({super.key, required this.addList, required this.listKey});

  /// Parameter untuk menampung hasil input dari user
  String? _firstName;
  String? _lastName;
  String? _phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create New Contact')),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(children: [
            // Form Nama awal
            InputContactWidget(
                keyboardType: TextInputType.text,
                prefixIcon: Icons.person_rounded,
                label: 'First Name',
                hintText: 'Enter your first name',
                onChanged: (value) => _firstName = value),
            const SizedBox(height: 8.0),
            // Form Nama Akhir
            InputContactWidget(
                keyboardType: TextInputType.text,
                prefixIcon: Icons.person_rounded,
                label: 'Last Name',
                hintText: 'Enter your last name',
                onChanged: (value) => _lastName = value),
            const SizedBox(height: 8.0),
            // Form Nomor Telepon
            InputContactWidget(
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                prefixIcon: Icons.phone_rounded,
                label: 'Phone Number',
                hintText: 'Enter your phone number',
                onChanged: (value) => _phoneNumber = value),
            const SizedBox(height: 8.0),
            // Tombol untuk menyimpan kontak
            ElevatedButton(
                onPressed: () => _updateContact(context),
                child: const Text('SAVE')),
          ])),
    );
  }

  // Menambah kontak baru pada halaman list kontak
  _updateContact(BuildContext context) {
    var newIndex = addList.length;
    var newItem = ContactData(
        name: _firstName ?? '',
        lastName: _lastName ?? '',
        numberPhone: _phoneNumber ?? '');
    cList.insert(newIndex, newItem);
    listKey.currentState
        ?.insertItem(newIndex, duration: const Duration(seconds: 5));
    Navigator.pop(context, addList);
  }
}
