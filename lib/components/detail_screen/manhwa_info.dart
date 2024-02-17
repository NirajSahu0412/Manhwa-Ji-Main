import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manhwa_ji/widgets/info_button.dart';
import 'package:manhwa_ji/widgets/vertical_divider.dart';

class MangaInfo extends StatelessWidget {
  final String manhwaImage, manhwaStatus, manhwaAuthor;

  const MangaInfo({
    super.key,
    required this.manhwaImage,
    required this.manhwaStatus,
    required this.manhwaAuthor,
  });

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: SizedBox(
          height: screenSize.height / 2.5,
          width: screenSize.width - 10,
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: screenSize.height / 5,
                        child: Image.network(
                          manhwaImage,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Center(
                        child: Text(
                          "By $manhwaAuthor  -  $manhwaStatus",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: screenSize.height / 10,
                width: screenSize.width - 10,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InfoButton(
                      icon: CupertinoIcons.play_fill,
                      title: "Read",
                    ),
                    CustomVerticalDivider(),
                    InfoButton(
                      icon: CupertinoIcons.list_bullet,
                      title: "Chapter",
                    ),
                    CustomVerticalDivider(),
                    InfoButton(
                      icon: CupertinoIcons.heart,
                      title: "Favourite",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
