import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../models/main_card.dart';
import '../pages/detailed_card_page.dart';
import '../utils/color_map.dart';

class MainCard extends StatelessWidget {
  final MainCardData mainCardData;
  final String tag;

  const MainCard({super.key, required this.mainCardData, required this.tag});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (context) => ArticlePage(mainCardData: mainCardData, tag: tag),
          ),
        );
      },
      child: SizedBox(
        width: 310,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Hero(
                  tag: tag,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: SizedBox(
                      height: 220,
                      child: CachedNetworkImage(
                        width: 310,
                        imageUrl: mainCardData.imageUrl,
                        fit: BoxFit.fill,
                        placeholder:
                            (context, url) => Image.asset(
                              'assets/fitness_magazine_assets/images/placeholder.png',
                            ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 20,
                  left: 20,
                  child: Icon(
                    Icons.favorite_border_outlined,
                    color: Colors.white,
                    size: 32,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              color: getCategoryColor(mainCardData.category),
              width: 100,
              alignment: Alignment.center,
              child: Text(
                mainCardData.category,
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontFamily: 'Somar',
                ),
              ),
            ),
            const SizedBox(height: 10),

            Text(
              mainCardData.title,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                fontFamily: 'Somar',
              ),
            ),
            const SizedBox(height: 5),

            Text(
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              mainCardData.content,
              style: TextStyle(fontSize: 22, fontFamily: 'Somar'),
            ),
          ],
        ),
      ),
    );
  }
}
