class TentModel {
  // These are the properties that each tent must have
  final String id; // Unique identifier for each tent
  final String name; // Name of the tent/camping site
  final double price; // Price per night
  final String imageUrl; // URL of the tent's image
  final double rating; // Rating out of 5
  final String location; // Location of the tent
  final String description; // Detailed description
  final List<String> amenities; // List of available amenities
  final double?
      discount; // Optional discount percentage (can be null if no discount)

  // Constructor - requires all fields except discount
  TentModel({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.rating,
    required this.location,
    required this.description,
    required this.amenities,
    this.discount, // Optional parameter
  });
}
