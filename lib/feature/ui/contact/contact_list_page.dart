import 'package:flutter/material.dart';
import '../../../data/model/contact_data.dart';
import '../../widget/page_route_builder_widget.dart';
import 'add_contact_page.dart';

class ContactListPage extends StatefulWidget {
  const ContactListPage({super.key});

  @override
  State<ContactListPage> createState() => _ContactListPageState();
}

class _ContactListPageState extends State<ContactListPage> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Contact List',
        ),
        actions: [
          // Tombol untuk menambah isi pada kontak
          TextButton(
            onPressed: () => _addNewContact(context),
            style: TextButton.styleFrom(
              foregroundColor: Theme.of(context).colorScheme.onPrimary,
            ),
            child: const Icon(
              Icons.add_rounded,
            ),
          )
        ],
      ),
      // Animasi ketika menambah dan mengurangi kontak list
      body: AnimatedList(
        padding: EdgeInsets.zero,
        key: _listKey,
        initialItemCount: cList.length,
        itemBuilder: (context, index, animation) => _listContacts(
            cItem: cList[index],
            animation: animation,
            onPressed: () => _removeContact(index)),
      ),
    );
  }

  Widget _listContacts(
      {required ContactData cItem,
      required Animation<double> animation,
      VoidCallback? onPressed}) {
    /// List kontak yang ditampilkan menggunakan widget ListTile
    return SlideTransition(
      key: ValueKey(cItem),
      position: Tween<Offset>(begin: const Offset(-1, 0), end: Offset.zero)
          .animate(CurvedAnimation(parent: animation, curve: Curves.ease)),
      child: ListTile(
        leading: CircleAvatar(child: Text(cItem.name[0])),
        title: Text('${cItem.name} ${cItem.lastName}'),
        subtitle: Text(cItem.numberPhone),
        trailing:
            IconButton(icon: const Icon(Icons.delete), onPressed: onPressed),
        shape: const UnderlineInputBorder(),
      ),
    );
  }

  _addNewContact(BuildContext context) {
    final route = PageRouteBuilderPage(
        page: AddContactPage(addList: cList, listKey: _listKey),
        routeName: 'Add new contact');
    Navigator.push(context, route).then((value) => cList = value);
  }

  _removeContact(int index) {
    final removeItem = cList[index];
    cList.removeAt(index);
    _listKey.currentState?.removeItem(
        index,
        (context, animation) => _listContacts(
              cItem: removeItem,
              animation: animation,
              onPressed: () {},
            ),
        duration: const Duration(seconds: 2));
  }
}
