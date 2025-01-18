import 'package:json_annotation/json_annotation.dart';



@JsonSerializable()
class QRData {
  final String id;
  final String info;

  QRData({required this.id, required this.info});

  static fromJson(Map<String, dynamic> jsonData) {}

  /*factory QRData.fromJson(Map<String, dynamic> json) => QRDataFromJson(json);
  Map<String, dynamic> toJson() => QRDataToJson(this);*/
}
