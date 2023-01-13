import 'package:json_annotation/json_annotation.dart';

import 'access.dart';
import 'volume_info.dart';

part 'item.g.dart';

@JsonSerializable(createToJson: false)
class Items {
  String id;
  String etag;
  String selfLink;
  VolumeInfo volumeInfo;
  AccessInfo accessInfo;

  Items({
    required this.id,
    required this.etag,
    required this.selfLink,
    required this.volumeInfo,
    required this.accessInfo,
  });

  factory Items.fromJson(Map<String, dynamic> json) => _$ItemsFromJson(json);
}
