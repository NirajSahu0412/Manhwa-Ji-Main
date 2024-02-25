import 'package:flutter/material.dart';
import 'package:web_scraper/web_scraper.dart';

class ContentScreen extends StatefulWidget {
  final List<Map<String, dynamic>> manhwaContentUrl;

  const ContentScreen({
    super.key,
    required this.manhwaContentUrl,
  });

  @override
  State<ContentScreen> createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen> {
  late List<Map<String, dynamic>> contentPages;
  bool dataLoaded = false;

  void fetchManhwaContent() async {
    String tempUrl = '${widget.manhwaContentUrl[0]['attributes']['href'].toString().trim().split('.com')[0]}.com';
    String tempRoute = widget.manhwaContentUrl[0]['attributes']['href'].toString().trim().split('.com')[1];
    final webScrapper = WebScraper(tempUrl);
    if (await webScrapper.loadWebPage(tempRoute)) {
      contentPages =
          webScrapper.getElement('div.reading-content > div.page-break.no-gaps > img', ['data-src']);

      setState(() {
        dataLoaded = true;
      });
    }
    print(contentPages[2]['attributes']['data-src']);
  }

  @override
  void initState() {
    fetchManhwaContent();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: dataLoaded
          ? ListView.builder(
              shrinkWrap: true,
              itemCount: contentPages.length,
              itemBuilder: (context, index) {
                return Image.network(
                  contentPages[index]['attributes']['data-src']
                      .toString()
                      .trim(),
                  fit: BoxFit.fitWidth,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                );
              },
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
