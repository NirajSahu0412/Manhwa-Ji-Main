import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manhwa_ji/components/home_screen/manhwa_list.dart';
import 'package:manhwa_ji/constants/web_url.dart';
import 'package:manhwa_ji/widgets/bottom_navigation_items.dart';
import 'package:web_scraper/web_scraper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedNavIndex = 0;
  bool manhwaLoaded = false;
  late List<Map<String, dynamic>> manhwaImageList;
  late List<Map<String, dynamic>> manhwaNameList;
  void navBarTap(int index) {
    setState(() {
      selectedNavIndex = index;
    });
  }

  void fetchManhwa() async {
    final webScrapper = WebScraper(WebUrl.url);
    if (await webScrapper.loadWebPage('/')) {
      manhwaImageList = webScrapper.getElement(
        'div#loop-content > div > div > div > div > div > a > img',
        ['data-src'],
      );
      manhwaNameList = webScrapper.getElement(
        'div#loop-content > div > div > div > div > div > a',
        ['title', 'href'],
      );
      setState(() {
        manhwaLoaded = true;
      });
    }
  }

  @override
  void initState() {
    fetchManhwa();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Manhwa Ji",
        ),
      ),
      body: manhwaLoaded
          ? ManhwaList(
              manhwaImageList: manhwaImageList,
              manhwaNameList: manhwaNameList,
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedNavIndex,
        onTap: navBarTap,
        items: [
          bottomNavigationBarItem(
            CupertinoIcons.compass_fill,
            "Discover",
          ),
          bottomNavigationBarItem(
            CupertinoIcons.heart_fill,
            "Favourite",
          ),
          bottomNavigationBarItem(
            CupertinoIcons.clock_fill,
            "Recent",
          ),
          bottomNavigationBarItem(
            CupertinoIcons.ellipsis,
            "More",
          ),
        ],
      ),
    );
  }
}
