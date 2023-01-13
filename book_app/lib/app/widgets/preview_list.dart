import 'package:book_app/app/home/logic.dart';
import 'package:flutter/material.dart';

import '../../models/item.dart';
import 'preview.dart';

class HomeWidgetPreviewList extends StatelessWidget {
  final String title;
  const HomeWidgetPreviewList({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override

  /// widget to build list from future builder data
  ///
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 25),
      child: FutureBuilder<List<Items>>(
        // future from which we get data
        future: HomeLogic().getBookPreview(title: title),
        builder: ((context, snapshot) {
          // waiting for the async function to execute
          if (snapshot.connectionState == ConnectionState.waiting) {
            // display loader on screen
            return const CircularProgressIndicator();
            // check weater snapshat contains data
          } else if (snapshot.hasData) {
            // if snapshot data is not null
            if (snapshot.data != null) {
              final List<Items> bookModel = snapshot.data!;
              // check weater snapshot is not empty
              if (bookModel.isEmpty) {
                // display empty message
                return _buildListEmpty(context);
              } else {
                // display preview list
                return _buildDocsList(context, bookModel);
              }
            } else {
              return _buildListEmpty(context);
            }
          } else {
            return _buildListEmpty(context);
          }
        }),
      ),
    );
  }

  /// widget to display empty message
  ///
  Widget _buildListEmpty(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 32,
      ),
      child: SizedBox(
        height: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 25),
            Flexible(
              child: Text(
                "No Books Available",
                style: Theme.of(context).textTheme.bodyText1,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }

  /// widget to display list view in horizontal view
  ///
  Widget _buildDocsList(BuildContext context, List<Items> books) {
    return Expanded(
      flex: 1,
      child: SizedBox(
        height: 250.0,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: books.length,
          padding: const EdgeInsets.all(12),
          itemBuilder: (ctx, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: HomeWidgetPreview(
                volumeInfo: books[index],
              ),
            );
          },
        ),
      ),
    );
  }
}
