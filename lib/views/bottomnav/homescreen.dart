import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/controles/tophedlinecontroler.dart';
import 'package:news_app/views/detailednews.dart';
import 'package:provider/provider.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List categories = [
    'Business',
    'Entertainment',
    'General',
    'Health',
    'Science',
    'Sports',
    'Technology',
  ];
  int? selectedindex;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await context.read<Newses>().gettopnews();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Newses providertophed = context.watch<Newses>();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Daily News',
            style: GoogleFonts.orbitron(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.red,
        ),

        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            spacing: 10,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 5,
                  children: List.generate(
                    categories.length,
                    (index) => InkWell(
                      onTap: () async {
                        selectedindex = index;
                        providertophed.getcategorynews(
                          click: categories[index],
                        );

                        setState(() {});
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: selectedindex == index ? Colors.red : null,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color:
                                selectedindex == index
                                    ? Colors.red
                                    : Colors.white,
                          ),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              categories[index],
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              providertophed.isloading
                  ? Center(child: CircularProgressIndicator(color: Colors.blue))
                  : Container(
                    child: Expanded(
                      child: ListView.separated(
                        itemCount: providertophed.tophedline.length,
                        itemBuilder:
                            (context, index) => InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (context) => Detailednews(index: index),
                                  ),
                                );
                              },
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.brown,
                                  border: Border.all(color: Colors.blueGrey),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      if (providertophed
                                              .tophedline[index]
                                              .urlToImage !=
                                          null)
                                        Image.network(
                                          providertophed
                                              .tophedline[index]
                                              .urlToImage!,
                                        ),
                                      if (providertophed
                                              .tophedline[index]
                                              .urlToImage !=
                                          null)
                                        Text(
                                          providertophed.tophedline[index].title
                                              .toString(),
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                        separatorBuilder:
                            (context, index) => SizedBox(height: 10),
                      ),
                    ),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
