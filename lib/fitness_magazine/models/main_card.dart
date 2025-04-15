import 'dart:ui';

class MainCardData {
  String category;
  String title;
  String description;

  String imageAssetPath;
  Color color;

  MainCardData({
    required this.category,
    required this.title,
    required this.description,
    required this.imageAssetPath,
    required this.color,
  });
}
