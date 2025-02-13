class ProductModel {
  const ProductModel(
      {this.sku,
      this.price,
      this.title,
      this.quanity,
      this.image,
      this.rating,
      this.description});

  final String? sku;
  final double? price;
  final String? title;
  final int? quanity;
  final String? image;
  final int? rating;
  final String? description;

  /// Named constructor `copyWith` to create a modified copy of the instance.
  ProductModel copyWith(
      {String? sku,
      double? price,
      String? title,
      int? quanity,
      String? image,
      int? rating,
      String? description}) {
    return ProductModel(
      sku: sku ?? this.sku,
      price: price ?? this.price,
      title: title ?? this.title,
      quanity: quanity ?? this.quanity,
      image: image ?? this.image,
      rating: rating ?? this.rating,
      description: description ?? this.description,
    );
  }

  /// Convert JSON to CartModel object
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        sku: json['sku'] as String?,
        price: (json['price'] as num?)?.toDouble(),
        title: json['title'] as String?,
        quanity: json['quanity'] as int?,
        image: json['imageUrl'],
        rating: (json['rating'] as num?)?.toInt(),
        description: json['description'] as String?);
  }
}
