// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_project3/widgets/card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Quotes(),
    );
  }
}

class Quotes extends StatefulWidget {
  const Quotes({super.key});

  @override
  State<Quotes> createState() => _QuotesState();
}

// class for card-quote(title, author)
class BestQuotes {
  String title;
  String author;
  BestQuotes({required this.title, required this.author});
}

class _QuotesState extends State<Quotes> with SingleTickerProviderStateMixin {
  // list of all quotes
  List allQuotes = [
    BestQuotes(
        author: "Zeyad Ezzat", title: "Leaves dancing with morning light"),
    BestQuotes(author: "Zeyad", title: "Nature's symphony"),
    BestQuotes(author: "Zooz", title: "Moon's soft glow above"),
    BestQuotes(
        author: "Zeyad Elshnehab", title: "Stars sprinkle the velvet sky"),
  ];
  // To delete card-quote when clicking on delete icon
  delete(BestQuotes item) {
    setState(() {
      allQuotes.remove(item);
    });
  }

// To delete card-quote when clicking on delete icon
  addNewQuote() {
    setState(() {
      allQuotes.add(
        BestQuotes(author: myController2.text, title: myController.text),
      );
    });
  }

// create 2 controllers to get the text from the textfield
  final myController = TextEditingController();
  final myController2 = TextEditingController();
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return Padding(
                  padding: const EdgeInsets.all(22),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        controller: myController,
                        decoration: InputDecoration(hintText: "Add New Quote"),
                        maxLength: 20,
                      ),
                      SizedBox(
                        height: 22,
                      ),
                      TextField(
                        controller: myController2,
                        decoration: InputDecoration(hintText: "Add Author"),
                        maxLength: 20,
                      ),
                      SizedBox(
                        height: 22,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            addNewQuote();
                          },
                          child: Text(
                            "Add",
                            style: TextStyle(fontSize: 22),
                          )),
                    ],
                  ),
                );
              },
              isScrollControlled: true);
        },
        backgroundColor: Colors.redAccent,
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 50, 57, 121),
        title: Text(
          "Best Quotes",
          style: TextStyle(fontSize: 27),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...allQuotes
                .map((item) => CardWidget(
                      title: item.title,
                      // To pass the( item inside the list) to "card.dart" file
                      item: item,
                      author: item.author,
                      // To pass (the delete function) to "card.dart" file
                      delete: delete,
                    ))
                .toList()
          ],
        ),
      ),
    );
  }
}
