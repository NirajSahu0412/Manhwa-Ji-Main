import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:manhwa_ji/screens/detail_screen.dart';
import 'package:manhwa_ji/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Manhwa Ji',
      debugShowCheckedModeBanner: false,
      theme: FlexThemeData.light(
        scheme: FlexScheme.sanJuanBlue,
        useMaterial3: true,
      ),
      darkTheme: FlexThemeData.dark(
        scheme: FlexScheme.sanJuanBlue,
        useMaterial3: true,
      ),
      themeMode: ThemeMode.system,
      // home: const HomeScreen(),
      home: const DetailScreen(
        manhwaImage:
            "https://toonily.com/wp-content/uploads/2021/01/Read-Mercenary-Enrollment-manhwa-for-free-175x238.jpeg",
        manhwaTitle: "Mercenary Enrollment",
        manhwaUrl: "https://toonily.com/webtoon/mercenary-enrollment/",
      ),
    );
  }
}
//I/flutter (19282): https://toonily.com/wp-content/uploads/2021/01/Read-Mercenary-Enrollment-manhwa-for-free-175x238.jpeg
// I/flutter (19282): Mercenary Enrollment
// I/flutter (19282): https://toonily.com/webtoon/mercenary-enrollment/
