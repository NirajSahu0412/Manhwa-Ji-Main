import 'package:flutter/material.dart';
import 'package:manhwa_ji/components/detail_screen/manhwa_chapters.dart';
import 'package:manhwa_ji/components/detail_screen/manhwa_description.dart';
import 'package:manhwa_ji/components/detail_screen/manhwa_info.dart';
import 'package:web_scraper/web_scraper.dart';

class DetailScreen extends StatefulWidget {
  final String manhwaImage, manhwaTitle, manhwaUrl;

  const DetailScreen({
    super.key,
    required this.manhwaImage,
    required this.manhwaTitle,
    required this.manhwaUrl,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool infoLoaded = false;

  late List<Map<String, dynamic>> manhwaGenres;
  late List<Map<String, dynamic>> manhwaStatus;
  late List<Map<String, dynamic>> manhwaAuthor;
  late List<Map<String, dynamic>> manhwaDescription;
  late List<Map<String, dynamic>> manhwaChapterList;
  late List<Map<String, dynamic>> manhwaChapterTimeList;

  //https://toonily.com/webtoon/mercenary-enrollment/
  void fetchManhwaInfo() async {
    String tempUrl = '${widget.manhwaUrl.split('.com')[0]}.com';
    String tempRoute = widget.manhwaUrl.split('.com')[1];
    final webScrapper = WebScraper(tempUrl);
    if (await webScrapper.loadWebPage(tempRoute)) {
      manhwaAuthor = webScrapper.getElement('div.author-content', ['title']);
      manhwaGenres = webScrapper.getElement('div.genres-content', ['title']);
      manhwaStatus = webScrapper
          .getElement('div.post-status > div > div.summary-content', ['title']);
      manhwaDescription = webScrapper
          .getElement('div.description-summary > div > p', ['title']);
      manhwaChapterList = webScrapper.getElement(
          'div.listing-chapters_wrap.cols-2 > ul > li > a', ['href']);
      manhwaChapterTimeList = webScrapper
          .getElement('div.listing-chapters_wrap.cols-2 > ul > li > span', []);

      print(manhwaChapterTimeList.toString().trim());
      setState(() {
        infoLoaded = true;
      });
    }
  }

  @override
  void initState() {
    fetchManhwaInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.manhwaTitle),
        centerTitle: true,
      ),
      body: infoLoaded
          ? Center(
              child: SizedBox(
                height: screenSize.height - 10,
                width: screenSize.width - 10,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ManhwaInfo(
                        manhwaImage: widget.manhwaImage,
                        manhwaStatus:
                            manhwaStatus[1]['title'].toString().trim(),
                        manhwaAuthor:
                            manhwaAuthor[0]['title'].toString().trim(),
                      ),
                      ManhwaDescription(
                        manhwaDescription:
                            manhwaDescription[0]['title'].toString().trim(),
                        manhwaGenres:
                            manhwaGenres[0]['title'].toString().trim(),
                      ),
                      ManhwaChapters(
                        manhwaChapterList: manhwaChapterList,
                        manhwaChapterTimeList: manhwaChapterTimeList,
                      ),
                    ],
                  ),
                ),
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
