import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/contact.dart';
import '../../widget/page_route_builder_widget.dart';
import 'add_contact_page.dart';

class ContactListPage extends StatelessWidget {
  const ContactListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contact List'), actions: [
        // Tombol untuk menambah isi pada kontak
        TextButton(
            onPressed: () => Navigator.of(context).push(PageRouteBuilderPage(
                page: const AddContactPage(), routeName: 'Add new contact')),
            style: TextButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.onPrimary),
            child: const Icon(Icons.add_rounded)),
      ]),
      // List kontak yang dibungkus widget Consumner agar dapat memanggil fungsi remove dari provider Contact
      body: Consumer<Contact>(
        builder: (context, value, child) => ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: value.listContact.length,
          itemBuilder: (context, index) => ListTile(
            leading: CircleAvatar(
                child: Text(value.listContact[index].firstName[0])),
            title: Text(
                '${value.listContact[index].firstName} ${value.listContact[index].lastName}'),
            subtitle: Text(value.listContact[index].phoneNumber),
            trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () => value.remove(value.listContact[index])),
            shape: const UnderlineInputBorder(),
          ),
        ),
      ),
    );
  }
}
