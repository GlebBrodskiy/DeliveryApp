import 'package:flutter/material.dart';
class Kitty {
  String? fact;
  int? length;

  Kitty({this.fact, this.length});

Kitty.fromJson(Map<String, dynamic> json) {
fact = json['fact'];
length = json['length'];
}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data = new Map<String, dynamic>();
data['fact'] = this.fact;
data['length'] = this.length;
return data;
}
}
