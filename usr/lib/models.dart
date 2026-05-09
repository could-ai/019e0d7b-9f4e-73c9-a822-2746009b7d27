class Collection {
  final String id;
  final String name;
  final String icon;
  final String description;
  int itemCount;

  Collection({
    required this.id,
    required this.name,
    required this.icon,
    required this.description,
    this.itemCount = 0,
  });
}

class CollectionItem {
  final String id;
  final String collectionId;
  final String title;
  final String subtitle;
  final String imageUrl;
  final DateTime dateAdded;

  CollectionItem({
    required this.id,
    required this.collectionId,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.dateAdded,
  });
}

// Date simulate pentru aplicație
class MockData {
  static final List<Collection> collections = [
    Collection(id: '1', name: 'Cărți', icon: '📚', description: 'Biblioteca mea de SF și Fantasy', itemCount: 124),
    Collection(id: '2', name: 'Filme', icon: '🎬', description: 'Filme pe Blu-ray', itemCount: 45),
    Collection(id: '3', name: 'Machete Auto', icon: '🚗', description: 'Colecția de mașini 1:18', itemCount: 12),
    Collection(id: '4', name: 'Ceasuri', icon: '⌚', description: 'Ceasuri mecanice', itemCount: 5),
  ];

  static final List<CollectionItem> items = [
    CollectionItem(
      id: '101',
      collectionId: '1',
      title: 'Dune',
      subtitle: 'Frank Herbert',
      imageUrl: 'https://picsum.photos/seed/dune/200/300',
      dateAdded: DateTime.now().subtract(const Duration(days: 10)),
    ),
    CollectionItem(
      id: '102',
      collectionId: '1',
      title: 'Fundația',
      subtitle: 'Isaac Asimov',
      imageUrl: 'https://picsum.photos/seed/asimov/200/300',
      dateAdded: DateTime.now().subtract(const Duration(days: 20)),
    ),
  ];
}
