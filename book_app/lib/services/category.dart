import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/item.dart';

class Category {
  /// Function to get Book details by type
  /// 
  /// * [type] health, arts, pass as an argument to api
  ///
  Future<List<Items>> getBookItems({
    required String type,
  }) async {
    // data model 
    List<Items> bookModel = [];
    String url = 'https://www.googleapis.com/books/v1/volumes?q=subject:$type';

    try {
      await http.get(Uri.parse(url)).then(
        (response) {
          if (response.statusCode == 200) {
            var bookDetails = response.body;

            final jsonMap = json.decode(bookDetails);

            var getItems = jsonMap['items'];
            // parsing the data obtain from api to the book model
            for (var items in getItems) {
              bookModel.add(
                Items.fromJson(items),
              );
            }
          }
        },
      );
    } catch (e) {
      print(e);
    }
    return bookModel;
  }
}
