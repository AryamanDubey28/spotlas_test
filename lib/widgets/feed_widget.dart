import 'package:flutter/material.dart';
import 'package:spotlas_test/widgets/comment_widget.dart';
import 'package:spotlas_test/widgets/image_widget.dart';

///Represents one complete post of image, username, location, comments and tags
class FeedWidget extends StatefulWidget {
  final String name;
  final String location;
  final List<String> images;
  final String username;
  final String comment;
  final String profilePic;
  final String restuarantName;
  final String restuarantImage;
  final List<String> tags;

  const FeedWidget(
      {super.key,
      required this.name,
      required this.location,
      required this.images,
      required this.comment,
      required this.username,
      required this.restuarantName,
      required this.restuarantImage,
      required this.tags,
      required this.profilePic});

  @override
  State<FeedWidget> createState() => _FeedWidgetState();
}

class _FeedWidgetState extends State<FeedWidget> {
  bool expanded = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          // Custom tile in the middle
          ImageTile(
            name: widget.name,
            location: widget.location,
            images: widget.images,
            profilePic: widget.profilePic,
            username: widget.username,
            restaurantName: widget.restuarantName,
            restuarantImage: widget.restuarantImage,
            tags: widget.tags,
          ),
          const SizedBox(height: 8.0),
          // Icon row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              ImageIcon(
                AssetImage('images/book.png'),
                size: 24,
              ),
              ImageIcon(
                AssetImage('images/comment.png'),
                size: 24,
              ),
              ImageIcon(
                AssetImage('images/heart.png'),
                size: 24,
              ),
              ImageIcon(
                AssetImage('images/paper_plane.png'),
                size: 24,
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          // Name and comment
          Row(
            children: [
              CircleAvatar(
                radius: 16,
                backgroundImage: NetworkImage(widget.profilePic),
              ),
              const SizedBox(width: 8.0),
              Text(
                widget.username,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 8.0),
              Expanded(child: DescriptionTextWidget(text: widget.comment))
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          // Tags
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: widget.tags
                  .map(
                    (tag) => Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Container(
                        margin: const EdgeInsets.only(right: 8.0),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 4.0),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          //borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Text(
                          tag,
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
