import 'package:json_annotation/json_annotation.dart';

import 'access.dart';
import 'image.dart';
part 'volume_info.g.dart';

@JsonSerializable(createToJson: false)
class VolumeInfo {
  final String? title, publisher, publishedDate, description;
  int pageCount;
  double averageRating;
  int ratingsCount;
  bool allowAnonLogging;
  @JsonKey(defaultValue: [])
  final List<String> authors;

  ImageLinks imageLinks;

  VolumeInfo({
    required this.title,
    required this.authors,
    required this.publisher,
    required this.publishedDate,
    required this.description,
    required this.pageCount,
    required this.averageRating,
    required this.ratingsCount,
    required this.allowAnonLogging,
    required this.imageLinks,
  });

  factory VolumeInfo.fromJson(Map<String, dynamic> json) =>
      _$VolumeInfoFromJson(json);
}
