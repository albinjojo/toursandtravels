import 'package:flutter/material.dart';
import 'models/tent_model.dart';
import 'pages/tent_details_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isExploreTentsSelected = true;

  // Creates a list of 5 trending tents with sample data
  final List<TentModel> trendingTents = List.generate(
    5, // Generate 5 items
    (index) => TentModel(
      // For each index, create a new TentModel
      id: 'trend_$index', // Unique ID like 'trend_0', 'trend_1', etc.
      name:
          'Camping Site ${index + 1}', // Names like 'Camping Site 1', 'Camping Site 2'
      price: (50 + index * 10) * 80, // Price increases with each item
      imageUrl:
          'https://picsum.photos/160/100?random=$index', // Random image for each
      rating: 4.0 + (index % 5) * 0.2, // Rating between 4.0 and 4.8
      location: 'Location ${index + 1}',
      description: 'Experience the beauty of nature...',
      amenities: [
        // List of amenities available
        'Wi-Fi',
        'Parking',
        'Campfire',
        'BBQ',
        'Shower',
      ],
    ),
  );

  // Similar list for discounted tents
  final List<TentModel> discountedTents = List.generate(
    5,
    (index) => TentModel(
      id: 'disc_$index',
      name: 'Discount Site ${index + 1}',
      price: (40 + index * 8) * 80,
      imageUrl: 'https://picsum.photos/160/100?random=${index + 10}',
      rating: 4.0 + (index % 5) * 0.2,
      location: 'Location ${index + 1}',
      description: 'Get amazing discounts on this beautiful camping site. '
          'Perfect for budget travelers who don\'t want to compromise on quality. '
          'Limited time offer!',
      amenities: [
        'Wi-Fi',
        'Parking',
        'Campfire',
        'Kitchen',
        'Bathroom',
      ],
      discount: 20 + index * 5, // Discount percentage increases with each item
    ),
  );

  void _toggleSelection(bool isExplore) {
    setState(() {
      isExploreTentsSelected = isExplore;
    });
  }

  // This function handles navigation to the details page
  void _navigateToTentDetails(BuildContext context, TentModel tent) {
    Navigator.push(
      // Push new page onto navigation stack
      context,
      MaterialPageRoute(
        builder: (context) =>
            TentDetailsPage(tent: tent), // Create details page with tent data
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top bar with menu and chat
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.menu, color: Colors.black),
                    Icon(Icons.chat_bubble_outline, color: Colors.black),
                  ],
                ),
              ),

              // Search bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(17),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 8),
                      Icon(Icons.search, color: Colors.grey, size: 20),
                      Expanded(
                        child: TextField(
                          cursorWidth: 1,
                          cursorColor: Colors.black,
                          cursorHeight: 16,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.16,
                          ),
                          decoration: InputDecoration(
                            isDense: true,
                            hintText: 'Enter a place',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.16,
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 12),
                          ),
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: Text(
                          'Search',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Title
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Explore Tent\nLocations Near You.',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                  ),
                ),
              ),

              // Toggle buttons
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () => _toggleSelection(true),
                          child: Container(
                            height: 52,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: isExploreTentsSelected
                                  ? Colors.black
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: Text(
                              'Explore tents',
                              style: TextStyle(
                                color: isExploreTentsSelected
                                    ? Colors.white
                                    : Colors.grey[600],
                                fontSize: 16,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => _toggleSelection(false),
                          child: Container(
                            height: 52,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: !isExploreTentsSelected
                                  ? Colors.black
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: Text(
                              'List your own',
                              style: TextStyle(
                                color: !isExploreTentsSelected
                                    ? Colors.white
                                    : Color(0xFF776A6A),
                                fontSize: 16,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Trending nearby section
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Trending nearby',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              // Horizontal scrolling trending items
              SizedBox(
                height: 200,
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final tent = trendingTents[index];
                    return GestureDetector(
                      onTap: () => _navigateToTentDetails(context, tent),
                      child: Container(
                        width: 160,
                        margin: EdgeInsets.only(right: 16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 10,
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(16)),
                              child: Image.network(
                                tent.imageUrl,
                                height: 100,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    tent.name,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    '₹${tent.price.toStringAsFixed(0)}/night',
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: trendingTents.length,
                ),
              ),

              // On discount section
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'On discount',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              // Horizontal scrolling discount items
              Container(
                height: 200,
                margin: EdgeInsets.only(bottom: 24),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  itemBuilder: (context, index) {
                    final tent = discountedTents[index];
                    return GestureDetector(
                      onTap: () => _navigateToTentDetails(context, tent),
                      child: Container(
                        width: 160,
                        margin: EdgeInsets.only(right: 16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 10,
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                        child: Stack(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(16)),
                                  child: Image.network(
                                    tent.imageUrl,
                                    height: 100,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        tent.name,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        '₹${tent.price.toStringAsFixed(0)}/night',
                                        style: TextStyle(
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Positioned(
                              top: 8,
                              right: 8,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  '${tent.discount?.toStringAsFixed(0)}% OFF',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: discountedTents.length,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.map_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ''),
        ],
      ),
    );
  }
}
