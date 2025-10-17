import 'package:flutter/material.dart';
import 'package:news_app/controles/tophedlinecontroler.dart';
import 'package:news_app/views/homescreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatefulWidget {
  const Myapp({super.key});

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => Newses())],

      child: MaterialApp(debugShowCheckedModeBanner: false, home: Homescreen()),
    );
  }
}
