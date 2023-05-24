import 'package:flutter/material.dart';

///Tile containing the image of the post and username information. Contained in Feed Widget
class ImageTile extends StatelessWidget {
  final String name;
  final String username;
  final String location;
  final List<String> images;
  final String profilePic;
  final String restaurantName;
  final List<String> tags;
  final String restuarantImage;

  ImageTile(
      {required this.name,
      required this.location,
      required this.images,
      required this.username,
      required this.profilePic,
      required this.tags,
      required this.restuarantImage,
      required this.restaurantName});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          //Swipable images
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: images.map((image) {
                return Container(
                  width: 450,
                  height: 550,
                  child: Image.network(
                    image,
                    fit: BoxFit.cover,
                  ),
                );
              }).toList(),
            ),
          ),

          // Bottom left location
          Positioned(
            left: 10.0,
            bottom: 12.0,
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 4.0,
                        offset: Offset(0, 2),
                      ),
                    ],
                    shape: BoxShape.circle,
                  ),
                  child: CircleAvatar(
                    radius: 16,
                    backgroundImage: NetworkImage(restuarantImage),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(1),
                        blurRadius: 50.0,
                        offset: const Offset(0, 3),
                      ),
                    ],
                    shape: BoxShape.rectangle,
                  ),
                  child: Column(
                    children: [
                      Text(
                        restaurantName,
                        style: TextStyle(
                          color: Colors.grey[300],
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        location,
                        style: TextStyle(
                          color: Colors.grey[300],
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8.0),

          // Bottom right star icon
          Positioned(
            right: 20.0,
            bottom: 12.0,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 4.0,
                    offset: Offset(0, 2),
                  ),
                ],
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.star,
                color: Colors.white,
                size: 44,
              ),
            ),
          ),
          // Top name and picture
          Positioned(
            top: 12.0,
            left: 15.0,
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 10.0,
                        offset: Offset(0, 2),
                      ),
                    ],
                    shape: BoxShape.circle,
                  ),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(profilePic),
                  ),
                ),
                const SizedBox(width: 8.0),
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(1),
                        blurRadius: 55.0,
                        offset: const Offset(0, 2),
                      ),
                    ],
                    shape: BoxShape.rectangle,
                  ),
                  child: Column(
                    children: [
                      Text(
                        username,
                        style: TextStyle(
                          color: Colors.grey[300],
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        name,
                        style: TextStyle(
                          color: Colors.grey[300],
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
