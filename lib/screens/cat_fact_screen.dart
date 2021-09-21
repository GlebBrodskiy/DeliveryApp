import 'dart:convert';

import 'package:delivery/jsons/cats.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Chat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.9,
            child: ListView(
              shrinkWrap: false,
              children: [_buildHeader(), _buildFactParse()],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.only(top: 70, left: 25),
      child: Text(
        'Cat Facts',
        style: TextStyle(
            color: Colors.white, fontSize: 31, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildFactParse() {
    return FutureBuilder(
      future: http.get(Uri.parse('https://catfact.ninja/fact')),
      builder: (BuildContext context, AsyncSnapshot<http.Response> snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          var parsedJson = json.decode(snapshot.data!.body);

          return Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Text(
              Kitty.fromJson(parsedJson).fact.toString(),
              style: TextStyle(color: Colors.white, fontSize: 23),
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return SizedBox(
            child: Center(child: CircularProgressIndicator()),
            width: 100,
            height: 100,
          );
        } else {
          return Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Text(
              'Error: ${snapshot.error}',
              style: TextStyle(color: Colors.yellow),
            ),
          );
        }
      },
    );
  }
}
