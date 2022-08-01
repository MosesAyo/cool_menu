import 'package:flutter/material.dart';
import './menu_item.dart' as MenuItem;

class DrawerScreen extends StatefulWidget {
  final AnimationController? controller;

  const DrawerScreen({Key? key, this.controller}) : super(key: key);

  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  Animation<double>? _scaleAnimation;
  Animation<Offset>? _slideAnimation;

  @override
  Widget build(BuildContext context) {
    if (_scaleAnimation == null) {
      _scaleAnimation =
          Tween<double>(begin: 0.6, end: 1).animate(widget.controller!);
    }
    if (_slideAnimation == null) {
      _slideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))
          .animate(widget.controller!);
    }
    return SlideTransition(
      position: _slideAnimation!,
      child: ScaleTransition(
        scale: _scaleAnimation!,
        child: Container(
          color: Colors.blueAccent,
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(children: [
            const SizedBox(height: 50),
            Row(children: const [
              CircleAvatar(),
              SizedBox(width: 16),
              Expanded(
                  child: Text('Cool Menu',
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
        ),
      ),
    );
  }
}
