// Membuat Class List Icon
import 'package:flutter/material.dart';

import '../../feature/ui/contact/contact_list_page.dart';
import '../../feature/ui/splash/splash_page.dart';
import '../../feature/widget/page_route_builder_widget.dart';

class ListIcon {
  // Inisialisasi parameter untuk icon
  final String namaIcon;
  final IconData icon;
  final Widget? widget;

  const ListIcon({required this.namaIcon, required this.icon, this.widget});
}

// List Icon yang akan di tampilkan
const List<ListIcon> iconsList = [
  ListIcon(namaIcon: 'Telepon', icon: Icons.phone),
  ListIcon(namaIcon: 'Pesan', icon: Icons.message),
  ListIcon(namaIcon: 'Pengaturan', icon: Icons.settings),
  ListIcon(namaIcon: 'Peramban Web', icon: Icons.open_in_browser),
  ListIcon(namaIcon: 'Kalender', icon: Icons.calendar_today),
  ListIcon(namaIcon: 'Pemutar Musik', icon: Icons.library_music),
  ListIcon(namaIcon: 'Pemutar Video', icon: Icons.video_library),
  ListIcon(namaIcon: 'Kontak', icon: Icons.contacts, widget: ContactListPage()),
  ListIcon(namaIcon: 'Galeri Foto', icon: Icons.photo_library),
  ListIcon(namaIcon: 'Kamera', icon: Icons.camera),
];

// Navigasi menu bar
menuNavigate(BuildContext context, int index) {
  if (iconsList[index].widget == null) {
    Navigator.of(context).pushReplacement(PageRouteBuilderPage(
        page: const SplashPage(), routeName: 'Splash Page'));
  } else {
    goTo(context, iconsList[index].widget ?? const SplashPage());
  }
}

goTo(BuildContext context, Widget widget) {
  final route = PageRouteBuilderPage(page: widget, routeName: '');
  Navigator.of(context).push(route);
}
