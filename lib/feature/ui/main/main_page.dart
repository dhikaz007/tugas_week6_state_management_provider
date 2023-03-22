import 'package:flutter/material.dart';

import '../menu/menu_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Main Menu')),
      // Halaman awal yang ditampilkan
      body: const SafeArea(child: MenuPage()),
    );
  }
}
