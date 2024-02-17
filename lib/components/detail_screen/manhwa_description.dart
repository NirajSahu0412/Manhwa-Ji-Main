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
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: SizedBox(
          width: screenSize.width - 10,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  "Description",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  widget.manhwaDescription,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Genres",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
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
