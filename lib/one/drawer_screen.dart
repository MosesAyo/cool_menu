import 'package:flutter/material.dart';
import '../menu_item.dart' as MenuItem;

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueAccent,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(children: [
        const SizedBox(height: 50),
        Row(children: const [
          CircleAvatar(),
          SizedBox(width: 16),
          Expanded(
              child: Text('Coding Tricks',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold)))
        ]),
        const SizedBox(height: 30),
        const MenuItem.MenuItem(title: 'Home', icon: Icons.home),
        const MenuItem.MenuItem(title: 'My Account', icon: Icons.person),
        const MenuItem.MenuItem(title: 'My Orders', icon: Icons.history),
        const MenuItem.MenuItem(title: 'Wishlist', icon: Icons.list),
        const MenuItem.MenuItem(
          title: 'Settings',
          icon: Icons.settings,
        ),
        const MenuItem.MenuItem(title: 'Logout', icon: Icons.exit_to_app)
      ]),
    );
  }
}
