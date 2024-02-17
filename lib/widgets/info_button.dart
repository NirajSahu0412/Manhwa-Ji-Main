import 'package:flutter/material.dart';

class InfoButton extends StatelessWidget {
  final IconData icon;
  final String title;

  const InfoButton({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: 38,
          
        ),
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
