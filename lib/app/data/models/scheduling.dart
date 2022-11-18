// To parse this JSON data, do
//
//     final schedulingModel = schedulingModelFromJson(jsonString);

import 'dart:convert';

SchedulingModel schedulingModelFromJson(String str) =>
    SchedulingModel.fromJson(json.decode(str));

String schedulingModelToJson(SchedulingModel data) =>
    json.encode(data.toJson());

List<SchedulingModel> schedulingListModelFromJson(String str) =>
    List<SchedulingModel>.from(
      json.decode(str).map(
            (x) => SchedulingModel.fromJson(x),
          ),
    );

String schedulingListModelToJson(List<SchedulingModel> data) => json.encode(
      List<dynamic>.from(
        data.map(
          (x) => x.toJson(),
        ),
      ),
    );

class SchedulingModel {
  SchedulingModel({
    required this.id,
    required this.date,
    required this.user,
    required this.canchaId,
    required this.forecast,
  });

  String id;
  DateTime date;
  String user;
  int canchaId;
  double forecast;

  factory SchedulingModel.fromJson(Map<String, dynamic> json) =>
      SchedulingModel(
        id: json["id"],
        date: DateTime.parse(json["date"]),
        user: json["user"],
        canchaId: json["cancha_id"],
        forecast: json["forecast"] == null ? 0 : json["forecast"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "user": user,
        "cancha_id": canchaId,
        "forecast": forecast,
      };
}
