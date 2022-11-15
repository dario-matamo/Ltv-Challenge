import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../const/text_styles.dart';
import '../model/ltv_articles.dart';
import '../services/articles_services.dart';

//Ward widget to present all Article data
Container articlesCard(AsyncSnapshot<LtvArticles> snapshot, int index) {
  return Container(
    constraints: const BoxConstraints(minHeight: 0, maxHeight: 300.0),
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: Colors.lightBlue[100],
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
            child: Text(
              snapshot.data!.articles[index].title.toString(),
              style: titleText,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 60,
            width: 70,
            child: CachedNetworkImage(
              fit: BoxFit.fill,
              imageUrl: ArticlesServices.parseImagePath(
                  snapshot.data!.articles[index].image.toString()),
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Center(
                child:
                    CircularProgressIndicator(value: downloadProgress.progress),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Description: ${snapshot.data!.articles[index].description}",
                  style: regularText,
                  textAlign: TextAlign.center,
                ),
                Text(
                  "Author: ${snapshot.data!.articles[index].author}",
                  style: regularText,
                  textAlign: TextAlign.center,
                ),
                Text(
                  "Date published:${ArticlesServices.parseDate(snapshot.data!.articles[index].articleDate.toString())}",
                  style: regularText,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
