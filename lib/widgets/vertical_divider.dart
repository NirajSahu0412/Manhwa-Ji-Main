import 'package:flutter/material.dart';

class CustomVerticalDivider extends StatelessWidget {
  const CustomVerticalDivider({super.key});


  @override
  Widget build(BuildContext context) {
    return const VerticalDivider(
      endIndent: 20,
      thickness: 1,
    );
  }
}
