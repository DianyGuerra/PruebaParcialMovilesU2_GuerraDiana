import '../../domain/entities/cat.dart';

class CatModel extends Cat {
  CatModel({
    required super.id,
    required super.imageUrl,
    required super.width,
    required super.height,
  });

  // Convertir de JSON a objeto
  factory CatModel.fromJson(Map<String, dynamic> json) {
    return CatModel(
      id: json["id"],
      imageUrl: json["url"],
      width: json["width"],
      height: json["height"],
    );
  }
}
