// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../main.dart';

class CardWidget extends StatelessWidget {
  final String title;
  final String author;
  final Function delete;
  final BestQuotes item;
  const CardWidget(
      {super.key,
      required this.title,
      required this.author,
      required this.delete,
      required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromARGB(255, 57, 66, 151),
      margin: EdgeInsets.all(15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
      child: Container(
        padding: EdgeInsets.all(13),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    delete(item);
                  },
                  icon: Icon(Icons.delete),
                  iconSize: 30,
                  color: Colors.white,
                ),
                Text(
                  author,
                  style: TextStyle(fontSize: 17, color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
