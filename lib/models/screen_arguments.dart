import 'dart:convert';

ScreenArguments screenArgumentsFromJson(String str) => ScreenArguments.fromJson(json.decode(str));

String screenArgumentsToJson(ScreenArguments data) => json.encode(data.toJson());

class ScreenArguments {
  final String? stringData;
  final int? integerData;
  final double? doubleDatra;
  final bool? booleanData;
  final dynamic dynamicData;

  ScreenArguments({
    this.stringData,
    this.integerData,
    this.doubleDatra,
    this.booleanData,
    this.dynamicData,
  });

  factory ScreenArguments.fromJson(Map<String, dynamic> json) => ScreenArguments(
        stringData: json["string_data"],
        integerData: json["integer_data"],
        doubleDatra: json["double_datra"].toDouble(),
        booleanData: json["boolean_data"],
        dynamicData: json["dynamic_data"],
      );

  Map<String, dynamic> toJson() => {
        "string_data": stringData,
        "integer_data": integerData,
        "double_datra": doubleDatra,
        "boolean_data": booleanData,
        "dynamic_data": dynamicData,
      };
}
