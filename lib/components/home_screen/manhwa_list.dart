import 'package:flutter/material.dart';

import 'manhwa_card.dart';

class ManhwaList extends StatelessWidget {
  final List<Map<String, dynamic>> manhwaImageList;
  final List<Map<String, dynamic>> manhwaNameList;

  const ManhwaList({
    super.key,
    required this.manhwaImageList,
    required this.manhwaNameList,
  });

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      height: screenSize.height,
      width: screenSize.width - 10,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Wrap(
          alignment: WrapAlignment.center,
          children: [
            Container(
              width: screenSize.width - 10,
              height: 35,
              padding: EdgeInsets.only(left: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                "${manhwaNameList.length} Manhwas",
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
            for (int i = 0; i < manhwaNameList.length; i++)
              ManhwaCard(
                manhwaImg: manhwaImageList[i]['attributes']['data-src'],
                manhwaTitle: manhwaNameList[i]['attributes']['title'],
                manhwaUrl: manhwaNameList[i]['attributes']['href'],
              ),
          ],
        ),
      ),
    );
  }
}
