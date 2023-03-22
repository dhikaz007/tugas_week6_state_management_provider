import 'package:flutter/material.dart';

import '../../../data/model/list_icon_data.dart';
import '../../widget/page_route_builder_widget.dart';
import '../contact/contact_list_page.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Isi dari halaman awal berupa icon menu
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemCount: iconsList.length,
      itemBuilder: (context, index) => _choiceMenu(
        context,
        index,
      ),
    );
  }

  _choiceMenu(context, index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          child: Card(
            elevation: 5.0,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Icon(
                iconsList[index].icon,
                color: Colors.amberAccent,
                size: 50,
              ),
            ),
          ),
          onTap: () => menuNavigate(context, index),
        ),
        const SizedBox(height: 8.0),
        Container(
          alignment: Alignment.bottomCenter,
          child: Text(
            iconsList[index].namaIcon,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

/// Navigasi ke halama kontak list
_goToContactListPage(context) {
  final route = PageRouteBuilderPage(
      page: const ContactListPage(), routeName: 'Contact List Page');
  Navigator.of(context).push(route);
}
