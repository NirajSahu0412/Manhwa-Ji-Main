import 'package:flutter/material.dart';

class ManhwaDescription extends StatefulWidget {
  final String manhwaDescription, manhwaGenres;

  const ManhwaDescription({
    super.key,
    required this.manhwaDescription,
    required this.manhwaGenres,
  });

  @override
  State<ManhwaDescription> createState() => _ManhwaDescriptionState();
}

class _ManhwaDescriptionState extends State<ManhwaDescription> {
  bool readMore = false;
  void toggleRead() {
    setState(() {
      readMore = !readMore;
    });
  }

  Widget overMultiLine() {
    return (widget.manhwaDescription).split('').length > 30
        ? GestureDetector(
            onTap: toggleRead,
            child: Text(
              readMore ? "Read less" : "Read more",
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
          )
        : Container();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: SizedBox(
          width: screenSize.width - 10,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Divider(),
                Text(
                  "Description",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Divider(),
                Text(
                  widget.manhwaDescription,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.justify,
                  maxLines: readMore ? 2000 : 3,
                  overflow: TextOverflow.ellipsis,
                ),
                overMultiLine(),
                SizedBox(
                  height: 15,
                ),
                Divider(),
                Text(
                  "Genres",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Divider(),
                Text(
                  widget.manhwaGenres,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
