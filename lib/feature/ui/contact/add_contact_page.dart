import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../data/model/contact_data.dart';
import '../../provider/contact.dart';
import '../../widget/input_contact_widget.dart';

class AddContactPage extends StatelessWidget {
  const AddContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Parameter untuk textformfield
    late String? firstName;
    late String? lastName;
    late String? phoneNumber;
    return GestureDetector(
      // Agar focus textfield hilang ketika tap pada layar selain textfield
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        appBar: AppBar(title: const Text('Create New Contact')),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              // Widget input custom dari class InputWidget
              InputContactWidget(
                keyboardType: TextInputType.text,
                prefixIcon: Icons.person_rounded,
                label: 'First Name',
                hintText: 'Enter your first name',
                onChanged: (value) => firstName = value,
              ),
              const SizedBox(height: 8.0),
              InputContactWidget(
                keyboardType: TextInputType.text,
                prefixIcon: Icons.person_rounded,
                label: 'Last Name',
                hintText: 'Enter your last name',
                onChanged: (value) => lastName = value,
              ),
              const SizedBox(height: 8.0),
              InputContactWidget(
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                prefixIcon: Icons.phone_rounded,
                label: 'Phone Number',
                hintText: 'Enter your phone number',
                onChanged: (value) => phoneNumber = value,
              ),
              const SizedBox(height: 8.0),
              // Tombol save yang di bungkus Widget Consumer agar dapat memanggil fungsi Add pada provider Contact
              Consumer<Contact>(
                builder: (context, value, child) => ElevatedButton(
                  onPressed: () {
                    value.add(
                      ContactData(
                        firstName: firstName ?? '',
                        lastName: lastName ?? '',
                        phoneNumber: '+62-$phoneNumber',
                      ),
                    );
                    Navigator.of(context).pop();
                  },
                  child: const Text('SAVE'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
