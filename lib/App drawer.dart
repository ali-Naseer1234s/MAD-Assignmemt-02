import 'package:flutter/material.dart';
import 'Home screen.dart';
import 'List screen.dart';
import 'About screen.dart';

/// Drawer menu shared by all three screens.
/// [current] is the name of the screen that is showing the drawer.
class AppDrawer extends StatelessWidget {
  final String current;
  const AppDrawer({super.key, required this.current});

  void _go(BuildContext context, String name, Widget screen) {
    Navigator.pop(context); // close the drawer
    if (name == current) return;
    Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: scheme.primary),
            child: const Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            selected: current == 'Home',
            onTap: () => _go(context, 'Home', const HomeScreen()),
          ),
          ListTile(
            leading: const Icon(Icons.list),
            title: const Text('List'),
            selected: current == 'List',
            onTap: () => _go(context, 'List', const ListScreen()),
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('About'),
            selected: current == 'About',
            onTap: () => _go(context, 'About', const AboutScreen()),
          ),
        ],
      ),
    );
  }
}