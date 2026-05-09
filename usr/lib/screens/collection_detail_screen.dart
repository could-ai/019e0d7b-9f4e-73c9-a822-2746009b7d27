import 'package:flutter/material.dart';
import '../models.dart';

class CollectionDetailScreen extends StatelessWidget {
  const CollectionDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Collection collection = ModalRoute.of(context)!.settings.arguments as Collection;
    final items = MockData.items.where((item) => item.collectionId == collection.id).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('${collection.icon} ${collection.name}'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: items.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.inbox, size: 64, color: Colors.grey[400]),
                  const SizedBox(height: 16),
                  Text('Niciun obiect în această colecție.', style: TextStyle(color: Colors.grey[600], fontSize: 16)),
                ],
              ),
            )
          : ListView.separated(
              padding: const EdgeInsets.all(16.0),
              itemCount: items.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                final item = items[index];
                return ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      item.imageUrl,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => 
                        Container(width: 50, height: 50, color: Colors.grey[300], child: const Icon(Icons.image)),
                    ),
                  ),
                  title: Text(item.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text(item.subtitle),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Detalii pentru: ${item.title}')),
                    );
                  },
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Adaugă obiect nou')),
          );
        },
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
    );
  }
}
