import 'package:flutter/material.dart';

class ManhwaCard extends StatelessWidget {
  final String manhwaImg, manhwaTitle, manhwaUrl;

  const ManhwaCard({
    super.key,
    required this.manhwaImg,
    required this.manhwaTitle,
    required this.manhwaUrl,
  });

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return InkWell(
      onTap: (){
        print(manhwaImg);
        print(manhwaTitle);
        print(manhwaUrl);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: screenSize.height / 4,
            width: screenSize.width / 4,
            child: Column(
              children: [
                Expanded(
                  flex: 75,
                  child: Container(
                    child: Image.network(
                      manhwaImg,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  flex: 25,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      manhwaTitle,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
