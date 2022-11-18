// To parse this JSON data, do
//
//     final canchaModel = canchaModelFromJson(jsonString);

import 'dart:convert';

CanchaModel canchaModelFromJson(String str) =>
    CanchaModel.fromJson(json.decode(str));

String canchaModelToJson(CanchaModel data) => json.encode(data.toJson());

class CanchaModel {
  CanchaModel({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory CanchaModel.fromJson(Map<String, dynamic> json) => CanchaModel(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
