import 'package:flutter/material.dart';

import '../models/main_card.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_ui_samples/fitness_magazine/views/articlePage.dart';

class SubCard extends StatelessWidget {
  final MainCardData mainCardData;
  final String tag;
  const SubCard({super.key, required this.mainCardData,required this.tag});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArticlePage(mainCardData: mainCardData,tag: tag,),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Card(
          color: mainCardData.color,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Hero(
                tag: tag,
                child: SizedBox(
                  width: 150,
                  child: CachedNetworkImage(
                    height: 140,
                    imageUrl: mainCardData.imageUrl,
                    fit:BoxFit.fill ,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: Text(
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          mainCardData.description,
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontFamily: 'Somar',
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Spacer(),
                          Icon(Icons.share, color: Colors.white),
                          SizedBox(width: 6,),
                          Icon(Icons.favorite_border_outlined, color: Colors.white),
                          SizedBox(width: 6,),
                          Icon(Icons.remove_red_eye_outlined, color: Colors.white),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
