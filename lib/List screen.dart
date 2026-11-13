import 'package:flutter/material.dart';
import 'App drawer.dart';

/// Uses CustomScrollView + SliverAppBar (bonus) with a scrollable list
/// of 12 cities.
class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  static const List<String> cities = [
    'Islamabad',
    'Lahore',
    'Karachi',
    'Peshawar',
    'Quetta',
    'Multan',
    'Faisalabad',
    'Rawalpindi',
    'Sialkot',
    'Hyderabad',
    'Gujranwala',
    'Abbottabad',
  ];

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Scaffold(
      drawer: const AppDrawer(current: 'List'),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 160,
            pinned: true,
            backgroundColor: scheme.primary,
            foregroundColor: Colors.white,
            flexibleSpace: const FlexibleSpaceBar(
              title: Text('Cities of Pakistan'),
            ),
          ),
          // Sliver version of a ListView (ListView.builder equivalent).
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                return ListTile(
                  leading: CircleAvatar(child: Text('${index + 1}')),
                  title: Text(cities[index]),
                  subtitle: const Text('Pakistan'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('You tapped ${cities[index]}')),
                    );
                  },
                );
              },
              childCount: cities.length,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(Icons.arrow_back),
        label: const Text('Back'),
      ),
    );
  }
}