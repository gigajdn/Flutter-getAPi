class Mobil {
  final int id;
  final String brand;
  final String model;
  final String color;

  Mobil({
    required this.id,
    required this.brand,
    required this.model,
    required this.color,
  });

  factory Mobil.fromJson(Map<String, dynamic> json) {
    return Mobil(
      id: json['id'],
      brand: json['brand'],
      model: json['model'],
      color: json['color'],
    );
  }
}
