import 'package:book_app/services/category.dart';

import '../../models/item.dart';

class HomeLogic {
  /// funtion to getBook details
  /// 
  ///
  Future<List<Items>> getBookPreview({
    required String title,
  }) async {
    return await Category().getBookItems(type: title);
  }
}
