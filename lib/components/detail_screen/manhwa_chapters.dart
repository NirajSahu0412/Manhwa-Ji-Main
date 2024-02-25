import 'package:flutter/material.dart';
import 'package:manhwa_ji/constants/colors.dart';
import 'package:manhwa_ji/screens/content_screen.dart';

class ManhwaChapters extends StatelessWidget {
  final List<Map<String, dynamic>> manhwaChapterList;
  final List<Map<String, dynamic>> manhwaChapterTimeList;

  const ManhwaChapters({
    super.key,
    required this.manhwaChapterList,
    required this.manhwaChapterTimeList,
  });

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SizedBox(
      width: screenSize.width - 10,
      child: ListView.builder(
        reverse: true,
        itemCount: manhwaChapterList.length,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return SizedBox(
            height: screenSize.height / 10,
            width: screenSize.width - 10,
            child: Material(
              child: InkWell(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      manhwaChapterList[index]['title'],
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      manhwaChapterTimeList[index]['title'].toString(),
                      style: TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                        color: AppColors.lightGrey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
