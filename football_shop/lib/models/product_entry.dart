import 'dart:convert';

ProductEntry productEntryFromJson(String str) =>
    ProductEntry.fromJson(json.decode(str));

String productEntryToJson(ProductEntry data) => json.encode(data.toJson());

List<ProductEntry> productEntryListFromJson(String str) =>
    List<ProductEntry>.from(
        json.decode(str).map((x) => ProductEntry.fromJson(x)));

String productEntryListToJson(List<ProductEntry> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductEntry {
  final int id;
  final String name;
  final int price;
  final String description;
  final String thumbnail;
  final String category;
  final bool isFeatured;
  final String? owner;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  ProductEntry({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.thumbnail,
    required this.category,
    required this.isFeatured,
    this.owner,
    this.createdAt,
    this.updatedAt,
  });

  factory ProductEntry.fromJson(Map<String, dynamic> json) {
    // Handle Django serializer format
    if (json['model'] == 'main.product') {
      return ProductEntry(
        id: json['pk'],
        name: json['fields']['name'] ?? '',
        price: json['fields']['price'] ?? 0,
        description: json['fields']['description'] ?? '',
        thumbnail: json['fields']['thumbnail'] ?? '',
        category: json['fields']['category'] ?? '',
        isFeatured: json['fields']['is_featured'] ?? false,
        owner: json['fields']['user'],
        createdAt: json['fields']['created_at'] != null
            ? DateTime.parse(json['fields']['created_at'])
            : null,
        updatedAt: json['fields']['updated_at'] != null
            ? DateTime.parse(json['fields']['updated_at'])
            : null,
      );
    }
    // Handle direct object format
    return ProductEntry(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      price: json['price'] ?? 0,
      description: json['description'] ?? '',
      thumbnail: json['thumbnail'] ?? '',
      category: json['category'] ?? '',
      isFeatured: json['is_featured'] ?? false,
      owner: json['owner'],
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "description": description,
        "thumbnail": thumbnail,
        "category": category,
        "is_featured": isFeatured,
        "owner": owner,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
