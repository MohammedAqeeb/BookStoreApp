import 'package:book_app/app/home/book_detail.screen.dart';
import 'package:flutter/material.dart';

import '../../models/item.dart';

class HomeWidgetPreview extends StatelessWidget {
  final Items volumeInfo;
  const HomeWidgetPreview({
    Key? key,
    required this.volumeInfo,
  }) : super(key: key);

  @override

  /// Widget to build book preview that includes book thumbnail and title
  ///
  Widget build(BuildContext context) {
    return Material(
      elevation: 0,
      child: InkWell(
        onTap: () {
          /// On tap of the preview navigate to book detail screen
          ///
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BookDetailScreen(
                item: volumeInfo,
              ),
            ),
          );
        },
        child: Column(
          children: [
            // book thumbnail preview
            Container(
              height: 150,
              width: 110,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image:
                      NetworkImage(volumeInfo.volumeInfo.imageLinks.thumbnail),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 10),
            // book title
            Text(
              volumeInfo.volumeInfo.title!,
              style: TextStyle(
                  color: Colors.grey[900], fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
