import 'package:flutter/material.dart';
import 'package:ltv_flutter_challenge/model/ltv_articles.dart';
import 'package:ltv_flutter_challenge/services/articles_services.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/articles_cards.dart';
import '../widgets/drawer_list.dart';

class BlogScreen extends StatefulWidget {
  const BlogScreen({Key? key}) : super(key: key);

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  LtvArticles? data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Articles"),
        centerTitle: true,
      ),
      drawer: const Drawer(
        child: ListViewDrawer(),
      ),
      body: FutureBuilder(
        builder: (context, snapshot) {
          //Check if there is something wrong with the snapshot
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(
              child: Text("There was an error loading the data"),
            );
          }
          //Return all the json data
          return ListView.builder(
            itemCount: snapshot.data!.articles.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.all(10),
                width: double.infinity,
                child: GestureDetector(
                  onTap: (() async {
                    final url = snapshot.data!.articles[index].link.toString();
                    //Using URL launcher package to open webpage
                    if (await canLaunchUrl(Uri.parse(url))) {
                      await (launchUrl(
                        Uri.parse(url),
                        mode: LaunchMode.inAppWebView,
                        webViewConfiguration:
                            const WebViewConfiguration(enableJavaScript: true),
                      ));
                    }
                  }),
                  child: articlesCard(snapshot, index),
                ),
              );
            },
          );
        },
        future: ArticlesServices.getArticles(),
      ),
    );
  }
}
