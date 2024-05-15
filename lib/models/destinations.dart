import 'dart:convert';

Destinations DestinationsFromJson(String str) => Destinations.fromJson(json.decode(str));

String DestinationsToJson(Destinations data) => json.encode(data.toJson());

class Destinations {
  final List<Datum> data;

  Destinations({
    required this.data,
  });

  factory Destinations.fromJson(Map<String, dynamic> json) => Destinations(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  final String image;
  final bool open;
  final String name;
  final String location;
  final String openTime;
  final String description;
  final double rate;
  final String category;
  final List<String> review;
  final List<String> feature;

  Datum({
    required this.image,
    required this.open,
    required this.name,
    required this.location,
    required this.openTime,
    required this.description,
    required this.rate,
    required this.category,
    required this.review,
    required this.feature,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        image: json["image"],
        open: json["open"],
        name: json["name"],
        location: json["location"],
        openTime: json["open_time"],
        description: json["description"],
        rate: json["rate"]?.toDouble(),
        category: json["category"],
        review: List<String>.from(json["review"].map((x) => x)),
        feature: List<String>.from(json["feature"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "open": open,
        "name": name,
        "location": location,
        "open_time": openTime,
        "description": description,
        "rate": rate,
        "category": category,
        "review": List<dynamic>.from(review.map((x) => x)),
        "feature": List<dynamic>.from(feature.map((x) => x)),
      };
}
