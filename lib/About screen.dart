import 'package:flutter/material.dart';
import 'App drawer.dart';

/// About screen with a GridView showing 6 items (image + caption).
class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  static const List<({String image, String caption})> items = [
    (image: 'res/images/Faisal Mosque.jpg', caption: 'Faisal Mosque'),
    (image: 'res/images/Margalla Hills.jpg', caption: 'Margalla Hills'),
    (image: 'res/images/Lahore Fort.jpg', caption: 'Lahore Fort'),
    (image: 'res/images/Clifton Beach.jpg', caption: 'Clifton Beach'),
    (image: 'res/images/K2 Mountain.jpg', caption: 'K2 Mountain'),
    (image: 'res/images/Minar-e-Pakistan.jpg', caption: 'Minar-e-Pakistan'),
  ];

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
        backgroundColor: scheme.primary,
        foregroundColor: Colors.white,
      ),
      drawer: const AppDrawer(current: 'About'),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Famous places in Pakistan',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            // LayoutBuilder: 3 columns x 2 rows always fit the free height.
            child: LayoutBuilder(
              builder: (context, constraints) {
                const padding = 12.0;
                const spacing = 12.0;
                const columns = 3;
                const rows = 2;

                final cellWidth =
                    (constraints.maxWidth - padding * 2 - spacing * (columns - 1)) /
                        columns;
                final cellHeight =
                    (constraints.maxHeight - padding * 2 - spacing * (rows - 1)) /
                        rows;

                return GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(padding),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: columns,
                    crossAxisSpacing: spacing,
                    mainAxisSpacing: spacing,
                    childAspectRatio: cellWidth / cellHeight,
                  ),
                  itemCount: items.length, // 6 items
                  itemBuilder: (context, i) {
                    final item = items[i];
                    return Card(
                      elevation: 3,
                      clipBehavior: Clip.antiAlias,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: Image.asset(
                              item.image,
                              fit: BoxFit.cover,
                              errorBuilder: (_, __, ___) => const Center(
                                child: Icon(Icons.image_not_supported, size: 48),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              item.caption,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: OutlinedButton.icon(
              icon: const Icon(Icons.arrow_back),
              label: const Text('Back'),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ],
      ),
    );
  }
}