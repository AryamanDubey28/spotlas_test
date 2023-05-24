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
      'name': 'John Doe',
      'username': 'johnd',
      'restaurantName': 'NYEats',
      'profilePic':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJSsU9W2yb-VAt0-bS-z-nbMKzCsKba-dQLg&usqp=CAU',
      'location': 'New York',
      'images': [
        'https://hips.hearstapps.com/hmg-prod/images/blooming-quesadilla-ring-1674080631.jpeg',
        'https://www.champneys.com/getmedia/38acf4d3-f72a-4d18-a2fe-10d28b6088a3/food7_500x500.jpg?width=500&height=500&ext=.jpg',
        'https://www.champneys.com/getmedia/38acf4d3-f72a-4d18-a2fe-10d28b6088a3/food7_500x500.jpg?width=500&height=500&ext=.jpg'
      ],
      'restuarantImg':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQY0USP3LcbNBgjPJDj_9EOLtHCW4Wp3aITA&usqp=CAU',
      'comment':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed pulvinar eleifend mauris, at congue mauris congue at. Vivamus a sapien dolor. Nunc euismod, sapien vitae euismod vestibulum, urna lacus dapibus elit, eget pulvinar justo purus in neque. Quisque venenatis sollicitudin ex ut interdum. Ut et est nec velit iaculis egestas. Mauris vel lobortis ligula. Integer eleifend risus a nibh sollicitudin pulvinar. Cras et risus nisl. Integer faucibus nunc at mi congue, ac congue lorem dictum. Nullam auctor lacinia nisl, in finibus sem consectetur non.'
    },
    {
      'name': 'Jane Smith',
      'username': 'janessssss',
      'restaurantName': 'LDNEats',
      'profilePic':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRQX3kMtN1EQvyBXT9sC4w90DjLRt5rxJjWaA&usqp=CAU',
      'location': 'London',
      'images': [
        'https://cdn.britannica.com/36/123536-050-95CB0C6E/Variety-fruits-vegetables.jpg',
        'https://www.champneys.com/getmedia/38acf4d3-f72a-4d18-a2fe-10d28b6088a3/food7_500x500.jpg?width=500&height=500&ext=.jpg',
        'https://www.champneys.com/getmedia/38acf4d3-f72a-4d18-a2fe-10d28b6088a3/food7_500x500.jpg?width=500&height=500&ext=.jpg'
      ],
      'restuarantImg':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQY0USP3LcbNBgjPJDj_9EOLtHCW4Wp3aITA&usqp=CAU',
      'comment': 'Tasty food'
    },
    {
      'name': 'Mike John',
      'username': 'mikeyj',
      'restaurantName': 'ParisEats',
      'profilePic':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSBsCEuH0O_1uO8bLJwYAqFo-T-OAcGcTAzHw&usqp=CAU',
      'location': 'Paris',
      'images': [
        'https://www.champneys.com/getmedia/38acf4d3-f72a-4d18-a2fe-10d28b6088a3/food7_500x500.jpg?width=500&height=500&ext=.jpg',
        'https://www.champneys.com/getmedia/38acf4d3-f72a-4d18-a2fe-10d28b6088a3/food7_500x500.jpg?width=500&height=500&ext=.jpg',
        'https://www.champneys.com/getmedia/38acf4d3-f72a-4d18-a2fe-10d28b6088a3/food7_500x500.jpg?width=500&height=500&ext=.jpg'
      ],
      'restuarantImg':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQY0USP3LcbNBgjPJDj_9EOLtHCW4Wp3aITA&usqp=CAU',
      'comment': 'Good food and atmosphere'
    },
  ];
  //final List<Map<String, String>> tileData = processData();

  @override
  Widget build(BuildContext context) {
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

Map<String, String> convertObjectToMap(Object? object) {
  final jsonString = jsonEncode(object);
  final jsonMap = jsonDecode(jsonString);
  final stringMap = jsonMap.cast<String, String>();
  return stringMap;
}

List<Map<String, String>> processData() {
  List<Map<String, String>> postData = [];
  data.forEach((element) {
    Map<String, String?> post = {};
    Map<String, String> author_map = convertObjectToMap(element['author']);
    post['name'] = author_map['full_name'];
    print("full name = ${author_map['full_name']}");
    post['username'] = author_map['username'];
    print("username = ${author_map['username']}");
    post['profilePic'] = Uri.encodeFull(element['url'] as String);
    print("profile pic url = ${post['profilePic']}");
    print(
        "going to convert ${element['media']}, type = ${element['media'].runtimeType}");
    Map<String, String> media_map = convertObjectToMap(element['media']);
    post['image'] = media_map['url'];
    print("image = ${media_map['url']}");
    Map<String, String> caption_map = convertObjectToMap(element['caption']);
    post['comment'] = caption_map['text'];
    print("caption = ${caption_map['text']}");
    Map<String, Object> spot_map = convertObjectToMap(element['spot']);
    post['restaurantName'] = spot_map['name'] as String;
    print("restuarant name = ${spot_map['name'] as String}");
    Map<String, String> logo_map = convertObjectToMap(spot_map['logo']);
    post['restuarantImage'] = Uri.encodeFull(logo_map['url']!);
    print("restuarant image = ${post['restuarantImage']}");
    Map<String, String> location_map = convertObjectToMap(spot_map['location']);
    post['location'] = location_map['display'];
  });
  return postData;
}

List<Map<String, Object?>> data = [
  {
    "id": "82338f37-dfe0-418d-9acb-97a20f74cac6",
    "caption": {
      "text": "@patrickdier",
      "tags": [
        {
          "id": "c8e8664c-dda5-489d-8141-f0f7bc54d245",
          "display_text": "patrick",
          "tag_text": "@patrick",
          "url":
              "https://d38tlmxhfjgwd9.cloudfront.net/resize/687/user_avatar/c1851d3b-83d7-4c49-86b9-d20b447e662f.png",
          "type": "user"
        },
        {
          "id": "5e1410ce-af9b-4b2c-9eba-19afa5e27912",
          "display_text": "patrickdier",
          "tag_text": "@patrickdier",
          "url":
              "https://d38tlmxhfjgwd9.cloudfront.net/resize/687/user_avatar/50c86589-0966-4148-b11f-843570da259c.jpeg",
          "type": "user"
        }
      ]
    },
    "media": [
      {
        "url":
            "https://d3qsefuprrv1m2.cloudfront.net/resize/687/rec/56ce9e1d-04d5-47da-8f87-cba0bea17d81.png",
        "blur_hash": "epK0y*\$NVst7Se?^SzR+R%WVyXofozniwJ?HbHbaofR*-Wo2sCWoW=",
        "type": "image"
      }
    ],
    "created_at": "2022-10-19T08:22:44.121212Z",
    "author": {
      "id": "50a0f0de-2291-4e02-ad63-8d9f52b027c6",
      "username": "zoe",
      "photo_url":
          "https://d38tlmxhfjgwd9.cloudfront.net/resize/687/user_avatar/5231bc02-f843-4518-8c3a-8fc3ccc68513.jpeg",
      "full_name": "Zoe Connick",
      "is_private": false,
      "is_verified": false,
      "follow_status": "accepted"
    },
    "spot": {
      "id": "904dfc11-90af-4c49-b624-c229e05dc80f",
      "name": "Gold",
      "types": [
        {
          "id": 406,
          "name": "Restaurant",
          "url":
              "https://d3qsefuprrv1m2.cloudfront.net/resize/original/types/icons/406.png"
        }
      ],
      "logo": {
        "url":
            "https://d38tlmxhfjgwd9.cloudfront.net/resize/687/place_logo/60fb981e-282b-4008-9e4d-ddc888c21973.png",
        "type": "image"
      },
      "location": {
        "latitude": 51.5129763,
        "longitude": -0.2026369,
        "display": "Notting Hill"
      },
      "is_saved": false
    },
    "relevant_comments": null,
    "number_of_comments": 0,
    "liked_by": null,
    "number_of_likes": 0,
    "tags": null,
    "url":
        "https://d38tlmxhfjgwd9.cloudfront.net/resize/204/user_avatar/markers/pink/50a0f0de-2291-4e02-ad63-8d9f52b027c6/restaurant.png"
  },
  {
    "id": "0e115294-909d-4b68-b0f8-329ad9f696ac",
    "caption": {
      "text": "@patrick",
      "tags": [
        {
          "id": "c8e8664c-dda5-489d-8141-f0f7bc54d245",
          "display_text": "patrick",
          "tag_text": "@patrick",
          "url":
              "https://d38tlmxhfjgwd9.cloudfront.net/resize/687/user_avatar/c1851d3b-83d7-4c49-86b9-d20b447e662f.png",
          "type": "user"
        }
      ]
    },
    "media": [
      {
        "url":
            "https://d3qsefuprrv1m2.cloudfront.net/resize/687/rec/765710b6-0c3b-4321-ba34-f52b7119a41f.png",
        "blur_hash": "epK0y*\$NVst7Se?^SzR+R%WVyXofozniwJ?HbHbaofR*-Wo2sCWoW=",
        "type": "image"
      },
      {
        "url":
            "https://d3qsefuprrv1m2.cloudfront.net/resize/687/rec/f0505261-fc7f-4541-8c75-c7d6feb95283.png",
        "blur_hash": "eVGkwWpdWX\$RpJJh#px]g2Vs4mInRPRjMx+|OUR5bbo#%MjbX8oeX8",
        "type": "image"
      },
      {
        "url":
            "https://d3qsefuprrv1m2.cloudfront.net/resize/687/rec/d12f53c9-c64e-4ef6-9e55-ccaf44ad063b.png",
        "blur_hash": "e368BP_3bb?b~q^+oL9FbH%M%MayIUj[xuR*fkt6s.oeNGogxuoJWB",
        "type": "image"
      }
    ],
    "created_at": "2022-10-19T08:20:17.081659Z",
    "author": {
      "id": "50a0f0de-2291-4e02-ad63-8d9f52b027c6",
      "username": "zoe",
      "photo_url":
          "https://d38tlmxhfjgwd9.cloudfront.net/resize/687/user_avatar/5231bc02-f843-4518-8c3a-8fc3ccc68513.jpeg",
      "full_name": "Zoe Connick",
      "is_private": false,
      "is_verified": false,
      "follow_status": "accepted"
    },
    "spot": {
      "id": "f134b1da-8905-4787-95ac-ee3092097319",
      "name": "Eggslut",
      "types": [
        {
          "id": 89,
          "name": "Cafe",
          "url":
              "https://d3qsefuprrv1m2.cloudfront.net/resize/original/types/icons/89.png"
        }
      ],
      "logo": {
        "url":
            "https://d38tlmxhfjgwd9.cloudfront.net/resize/687/place_logo/28a96a6f-09b1-48c9-ab01-4dd1040b44f5.png",
        "type": "image"
      },
      "location": {
        "latitude": 51.5153324,
        "longitude": -0.2048544,
        "display": "Notting Hill"
      },
      "is_saved": false
    },
    "relevant_comments": null,
    "number_of_comments": 0,
    "liked_by": null,
    "number_of_likes": 0,
    "tags": null,
    "url":
        "https://d38tlmxhfjgwd9.cloudfront.net/resize/204/user_avatar/markers/pink/50a0f0de-2291-4e02-ad63-8d9f52b027c6/coffee.png"
  },
  {
    "id": "21475178-ab8e-4e11-8a6a-cc0b91bf17b8",
    "caption": {
      "text": "@Gold",
      "tags": [
        {
          "id": "904dfc11-90af-4c49-b624-c229e05dc80f",
          "display_text": "Gold",
          "tag_text": "@Gold",
          "url":
              "https://d38tlmxhfjgwd9.cloudfront.net/resize/687/place_logo/60fb981e-282b-4008-9e4d-ddc888c21973.png",
          "type": "spot"
        }
      ]
    },
    "media": [
      {
        "url":
            "https://d3qsefuprrv1m2.cloudfront.net/resize/687/rec/b9ea55b9-7851-4a59-8f65-21db53f10d38.png",
        "blur_hash": "eGCigh8_0\$t7-oR%oznht7Nb4:x]Vrxus;-:NGIps:%1%2M|s:xZR+",
        "type": "image"
      }
    ],
    "created_at": "2022-10-19T08:14:56.996671Z",
    "author": {
      "id": "50a0f0de-2291-4e02-ad63-8d9f52b027c6",
      "username": "zoe",
      "photo_url":
          "https://d38tlmxhfjgwd9.cloudfront.net/resize/687/user_avatar/5231bc02-f843-4518-8c3a-8fc3ccc68513.jpeg",
      "full_name": "Zoe Connick",
      "is_private": false,
      "is_verified": false,
      "follow_status": "accepted"
    },
    "spot": {
      "id": "904dfc11-90af-4c49-b624-c229e05dc80f",
      "name": "Gold",
      "types": [
        {
          "id": 406,
          "name": "Restaurant",
          "url":
              "https://d3qsefuprrv1m2.cloudfront.net/resize/original/types/icons/406.png"
        }
      ],
      "logo": {
        "url":
            "https://d38tlmxhfjgwd9.cloudfront.net/resize/687/place_logo/60fb981e-282b-4008-9e4d-ddc888c21973.png",
        "type": "image"
      },
      "location": {
        "latitude": 51.5129763,
        "longitude": -0.2026369,
        "display": "Notting Hill"
      },
      "is_saved": false
    },
    "relevant_comments": null,
    "number_of_comments": 0,
    "liked_by": null,
    "number_of_likes": 0,
    "tags": null,
    "url":
        "https://d38tlmxhfjgwd9.cloudfront.net/resize/204/user_avatar/markers/pink/50a0f0de-2291-4e02-ad63-8d9f52b027c6/restaurant.png"
  },
  {
    "id": "a50ef7b2-7fd8-48f3-8a95-79538a93061f",
    "caption": {"text": "Best american cookies in town "},
    "media": [
      {
        "url":
            "https://d38tlmxhfjgwd9.cloudfront.net/resize/687/rec/46f7a5c9-0e12-4c83-a60d-412704a32eb6.png",
        "blur_hash": "e7S6Plt7?bRj-;RjWBofofj[~qRjD%t7D%%Mt7RjRjayM{t7ofWBt7",
        "type": "image"
      }
    ],
    "created_at": "2022-09-30T13:32:13.799705Z",
    "author": {
      "id": "8a75166b-8e4d-4d59-b56a-130b3e5b288b",
      "username": "sophiedevries",
      "photo_url":
          "https://d38tlmxhfjgwd9.cloudfront.net/resize/687/user_avatar/068bfb0f-761a-4c82-93b3-3c37b979328a.jpeg",
      "full_name": "Sophie de Vries",
      "is_private": false,
      "is_verified": false,
      "follow_status": "accepted"
    },
    "spot": {
      "id": "59278db1-29f9-4619-990f-f2a4432a6d53",
      "name": "Cookiele Antwerp",
      "types": [
        {
          "id": 33,
          "name": "Bakery",
          "url":
              "https://d3qsefuprrv1m2.cloudfront.net/resize/original/types/icons/33.png"
        }
      ],
      "logo": {
        "url":
            "https://d3qsefuprrv1m2.cloudfront.net/resize/original/types/logos/day/33.png",
        "blur_hash": "ecO:@Sof00j[D%offQayfQay00ay9FWBofj[fQWBfQfQD%ayofay%M",
        "type": "image"
      },
      "location": {
        "latitude": 51.2128798,
        "longitude": 4.3941994,
        "display": "Antwerpen"
      },
      "is_saved": false
    },
    "relevant_comments": null,
    "number_of_comments": 0,
    "liked_by": [
      {
        "id": "5d7b7722-a1af-4ef2-8bf2-2463a018563f",
        "username": "eliseronsse",
        "photo_url":
            "https://d38tlmxhfjgwd9.cloudfront.net/resize/687/user_avatar/290db392-e961-46c1-8e06-8359d711adf4.jpeg",
        "full_name": "Elise Ronsse",
        "is_private": false,
        "is_verified": false
      },
      {
        "id": "9e92503b-eb06-4297-bc58-096f0d1d305b",
        "username": "harry_h22",
        "photo_url":
            "https://d38tlmxhfjgwd9.cloudfront.net/resize/687/user_avatar/7f731359-e5e3-4d71-a7ba-2f5a74fc076c.jpeg",
        "full_name": "Harry Hunt",
        "is_private": false,
        "is_verified": false
      }
    ],
    "number_of_likes": 2,
    "tags": null,
    "url":
        "https://d38tlmxhfjgwd9.cloudfront.net/resize/204/user_avatar/markers/pink/8a75166b-8e4d-4d59-b56a-130b3e5b288b/bread.png"
  },
  {
    "id": "66f33e83-0247-456b-bd66-195f198dab1a",
    "caption": {
      "text":
          "Super nice small place to lunch. Small menu with Lebanese food. I had the chicken Muzakhan: it was delicious and a very large portion! "
    },
    "media": [
      {
        "url":
            "https://d38tlmxhfjgwd9.cloudfront.net/resize/687/rec/a3c56c01-0d34-48f9-aa7e-ce2276b4a43b.png",
        "blur_hash": "e7S6Plt7?bRj-;RjWBofofj[~qRjD%t7D%%Mt7RjRjayM{t7ofWBt7",
        "type": "image"
      }
    ],
    "created_at": "2022-09-27T16:36:35.114925Z",
    "author": {
      "id": "8a75166b-8e4d-4d59-b56a-130b3e5b288b",
      "username": "sophiedevries",
      "photo_url":
          "https://d38tlmxhfjgwd9.cloudfront.net/resize/687/user_avatar/068bfb0f-761a-4c82-93b3-3c37b979328a.jpeg",
      "full_name": "Sophie de Vries",
      "is_private": false,
      "is_verified": false,
      "follow_status": "accepted"
    },
    "spot": {
      "id": "efef4ab8-23b1-4533-ae2c-dd59cbd07d5b",
      "name": "Nora's Kitchen",
      "types": [
        {
          "id": 406,
          "name": "Restaurant",
          "url":
              "https://d3qsefuprrv1m2.cloudfront.net/resize/original/types/icons/406.png"
        }
      ],
      "logo": {
        "url":
            "https://d3qsefuprrv1m2.cloudfront.net/resize/original/types/logos/day/406.png",
        "blur_hash": "ecO:@Sof00j[D%offQayfQay00ay9FWBofj[fQWBfQfQD%ayofay%M",
        "type": "image"
      },
      "location": {
        "latitude": 51.2172846,
        "longitude": 4.4000959,
        "display": "Antwerpen"
      },
      "is_saved": false
    },
    "relevant_comments": null,
    "number_of_comments": 0,
    "liked_by": [
      {
        "id": "f27bc89c-8f33-4ca7-82a5-4b8cf6d4b144",
        "username": "duarteat",
        "photo_url":
            "https://d38tlmxhfjgwd9.cloudfront.net/resize/687/user_avatar/ff9529ab-ebae-4788-9a18-0e19cb0a2af6.jpeg",
        "full_name": "Duarte Assis Teixeira",
        "is_private": false,
        "is_verified": false
      },
      {
        "id": "1fcae546-b622-4400-8d82-2604943ff847",
        "username": "pedrorfialho",
        "photo_url":
            "https://d38tlmxhfjgwd9.cloudfront.net/resize/687/user_avatar/046bef2a-cf88-4cb7-81c7-b0a2e04754a9.jpeg",
        "full_name": "Pedro Fialho",
        "is_private": false,
        "is_verified": false
      },
      {
        "id": "0c7951f0-4a71-4915-9fc1-4ec86bda0d61",
        "username": "josephine",
        "photo_url":
            "https://d38tlmxhfjgwd9.cloudfront.net/resize/687/user_avatar/b640fa0c-b3b4-4744-9925-269da2308270.jpeg",
        "full_name": "Josephine Kim",
        "is_private": false,
        "is_verified": false
      }
    ],
    "number_of_likes": 3,
    "tags": null,
    "url":
        "https://d38tlmxhfjgwd9.cloudfront.net/resize/204/user_avatar/markers/pink/8a75166b-8e4d-4d59-b56a-130b3e5b288b/restaurant.png"
  },
  {
    "id": "d8b39366-7cfb-4883-8842-664ee9005db3",
    "caption": {
      "text":
          "Not cheap but super good quality breakfast!!! Coffee is super nice and great service. "
    },
    "media": [
      {
        "url":
            "https://d38tlmxhfjgwd9.cloudfront.net/resize/687/rec/8d1c0b23-5642-4808-8cdf-458d0ef28d52.png",
        "blur_hash": "e7S6Plt7?bRj-;RjWBofofj[~qRjD%t7D%%Mt7RjRjayM{t7ofWBt7",
        "type": "image"
      },
      {
        "url":
            "https://d38tlmxhfjgwd9.cloudfront.net/resize/687/rec/ef5f9854-c16a-4525-b78c-62bc4594a6b5.png",
        "blur_hash": "e7S6Plt7?bRj-;RjWBofofj[~qRjD%t7D%%Mt7RjRjayM{t7ofWBt7",
        "type": "image"
      },
      {
        "url":
            "https://d38tlmxhfjgwd9.cloudfront.net/resize/687/rec/b700c310-3a56-4a96-a38c-5452e65bf615.png",
        "blur_hash": "e7S6Plt7?bRj-;RjWBofofj[~qRjD%t7D%%Mt7RjRjayM{t7ofWBt7",
        "type": "image"
      }
    ],
    "created_at": "2022-09-27T16:33:28.947828Z",
    "author": {
      "id": "8a75166b-8e4d-4d59-b56a-130b3e5b288b",
      "username": "sophiedevries",
      "photo_url":
          "https://d38tlmxhfjgwd9.cloudfront.net/resize/687/user_avatar/068bfb0f-761a-4c82-93b3-3c37b979328a.jpeg",
      "full_name": "Sophie de Vries",
      "is_private": false,
      "is_verified": false,
      "follow_status": "accepted"
    },
    "spot": {
      "id": "49f1e45e-5973-495f-9ee5-9ca26c9ec88d",
      "name": "Charlie's B\u0026B",
      "types": [
        {
          "id": 240,
          "name": "Hotel",
          "url":
              "https://d3qsefuprrv1m2.cloudfront.net/resize/original/types/icons/240.png"
        }
      ],
      "logo": {
        "url":
            "https://d3qsefuprrv1m2.cloudfront.net/resize/original/types/logos/day/240.png",
        "blur_hash": "ecO:@Sof00j[D%offQayfQay00ay9FWBofj[fQWBfQfQD%ayofay%M",
        "type": "image"
      },
      "location": {
        "latitude": 51.21079599999999,
        "longitude": 4.395290999999999,
        "display": "Antwerpen"
      },
      "is_saved": false
    },
    "relevant_comments": null,
    "number_of_comments": 0,
    "liked_by": [
      {
        "id": "42905bc7-a4e0-4175-9926-d7277e283846",
        "username": "misskhall",
        "photo_url":
            "https://d38tlmxhfjgwd9.cloudfront.net/resize/687/user_avatar/5797c583-580b-4caa-bdd5-848d6992e28d.jpeg",
        "full_name": "Kathryn Hall",
        "is_private": false,
        "is_verified": false
      },
      {
        "id": "1fcae546-b622-4400-8d82-2604943ff847",
        "username": "pedrorfialho",
        "photo_url":
            "https://d38tlmxhfjgwd9.cloudfront.net/resize/687/user_avatar/046bef2a-cf88-4cb7-81c7-b0a2e04754a9.jpeg",
        "full_name": "Pedro Fialho",
        "is_private": false,
        "is_verified": false
      },
      {
        "id": "0c7951f0-4a71-4915-9fc1-4ec86bda0d61",
        "username": "josephine",
        "photo_url":
            "https://d38tlmxhfjgwd9.cloudfront.net/resize/687/user_avatar/b640fa0c-b3b4-4744-9925-269da2308270.jpeg",
        "full_name": "Josephine Kim",
        "is_private": false,
        "is_verified": false
      }
    ],
    "number_of_likes": 3,
    "tags": null,
    "url":
        "https://d38tlmxhfjgwd9.cloudfront.net/resize/204/user_avatar/markers/pink/8a75166b-8e4d-4d59-b56a-130b3e5b288b/hotel.png"
  }
];
