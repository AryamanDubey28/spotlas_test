import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:spotlas_test/widgets/feed_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //data from endpoint
  final List<Map<String, Object>> tileData = [
    {
      'name': 'Zoe Connick',
      'username': 'zoe',
      'restaurantName': 'Gold',
      'profilePic':
          'https://d38tlmxhfjgwd9.cloudfront.net/resize/204/user_avatar/markers/pink/50a0f0de-2291-4e02-ad63-8d9f52b027c6/restaurant.png',
      'location': 'Notting Hill',
      'images': [
        "https://d3qsefuprrv1m2.cloudfront.net/resize/687/rec/56ce9e1d-04d5-47da-8f87-cba0bea17d81.png",
      ],
      'restuarantImg':
          'https://d38tlmxhfjgwd9.cloudfront.net/resize/687/place_logo/60fb981e-282b-4008-9e4d-ddc888c21973.png',
      'comment': '@patrickdier'
    },
    {
      'name': 'Zoe Connick',
      'username': 'zoe',
      'restaurantName': 'Eggslut',
      'profilePic':
          "https://d38tlmxhfjgwd9.cloudfront.net/resize/204/user_avatar/markers/pink/50a0f0de-2291-4e02-ad63-8d9f52b027c6/coffee.png",
      'location': 'Notting Hill',
      'images': [
        "https://d3qsefuprrv1m2.cloudfront.net/resize/687/rec/765710b6-0c3b-4321-ba34-f52b7119a41f.png",
        "https://d3qsefuprrv1m2.cloudfront.net/resize/687/rec/f0505261-fc7f-4541-8c75-c7d6feb95283.png",
        "https://d3qsefuprrv1m2.cloudfront.net/resize/687/rec/d12f53c9-c64e-4ef6-9e55-ccaf44ad063b.png"
      ],
      'restuarantImg':
          "https://d38tlmxhfjgwd9.cloudfront.net/resize/687/place_logo/28a96a6f-09b1-48c9-ab01-4dd1040b44f5.png",
      'comment': '@patrick'
    },
    {
      'name': 'Zoe Connick',
      'username': 'zoe',
      'restaurantName': 'Gold',
      'profilePic':
          'https://d38tlmxhfjgwd9.cloudfront.net/resize/204/user_avatar/markers/pink/50a0f0de-2291-4e02-ad63-8d9f52b027c6/restaurant.png',
      'location': 'Notting Hill',
      'images': [
        'https://d3qsefuprrv1m2.cloudfront.net/resize/687/rec/b9ea55b9-7851-4a59-8f65-21db53f10d38.png',
      ],
      'restuarantImg':
          'https://d38tlmxhfjgwd9.cloudfront.net/resize/687/place_logo/60fb981e-282b-4008-9e4d-ddc888c21973.png',
      'comment': '@Gold'
    },
    {
      'name': 'Sophie de Vries',
      'username': 'sophiedevries',
      'restaurantName': 'Cookiele Antwerp',
      'profilePic':
          'https://d38tlmxhfjgwd9.cloudfront.net/resize/204/user_avatar/markers/pink/8a75166b-8e4d-4d59-b56a-130b3e5b288b/bread.png',
      'location': 'Antwerpen',
      'images': [
        'https://d38tlmxhfjgwd9.cloudfront.net/resize/687/rec/46f7a5c9-0e12-4c83-a60d-412704a32eb6.png',
      ],
      'restuarantImg':
          'https://d3qsefuprrv1m2.cloudfront.net/resize/original/types/logos/day/33.png',
      'comment': 'Best american cookies in town '
    },
    {
      'name': 'Sophie de Vries',
      'username': 'sophiedevries',
      'restaurantName': 'Nora\'s Kitchen',
      'profilePic':
          'https://d38tlmxhfjgwd9.cloudfront.net/resize/204/user_avatar/markers/pink/8a75166b-8e4d-4d59-b56a-130b3e5b288b/restaurant.png',
      'location': 'Antwerpen',
      'images': [
        'https://d38tlmxhfjgwd9.cloudfront.net/resize/687/rec/a3c56c01-0d34-48f9-aa7e-ce2276b4a43b.png',
      ],
      'restuarantImg':
          'https://d3qsefuprrv1m2.cloudfront.net/resize/original/types/logos/day/406.png',
      'comment':
          'Super nice small place to lunch. Small menu with Lebanese food. I had the chicken Muzakhan: it was delicious and a very large portion! '
    },
    {
      'name': 'Sophie de Vries',
      'username': 'sophiedevries',
      'restaurantName': 'Charlie\'s B\\u0026B',
      'profilePic':
          "https://d38tlmxhfjgwd9.cloudfront.net/resize/204/user_avatar/markers/pink/8a75166b-8e4d-4d59-b56a-130b3e5b288b/hotel.png",
      'location': 'Antwerpen',
      'images': [
        'https://d38tlmxhfjgwd9.cloudfront.net/resize/687/rec/8d1c0b23-5642-4808-8cdf-458d0ef28d52.png',
        'https://d38tlmxhfjgwd9.cloudfront.net/resize/687/rec/ef5f9854-c16a-4525-b78c-62bc4594a6b5.png',
        'https://d38tlmxhfjgwd9.cloudfront.net/resize/687/rec/b700c310-3a56-4a96-a38c-5452e65bf615.png',
      ],
      'restuarantImg':
          'https://d3qsefuprrv1m2.cloudfront.net/resize/original/types/logos/day/240.png',
      'comment':
          'Not cheap but super good quality breakfast!!! Coffee is super nice and great service. '
    },
  ];

  @override
  Widget build(BuildContext context) {
    tileData.shuffle(); //show in a random order
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Feed",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: tileData.length,
          itemBuilder: (context, index) {
            final tile = tileData[index];
            return FeedWidget(
              name: tile['name'] as String,
              location: tile['location'] as String,
              username: tile['username'] as String,
              images: tile['images'] as List<String>,
              comment: tile['comment'] as String,
              profilePic: tile['profilePic'] as String,
              restuarantName: tile['restaurantName'] as String,
              restuarantImage: tile['restuarantImg'] as String,
              tags: const [
                'Outdoors',
                'Cheap',
                'Fancy',
                'Music',
                'Good Service',
                'Atmosphere'
              ],
            );
          }),
    );
  }
}
