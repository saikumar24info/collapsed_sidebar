// ignore_for_file: prefer_const_constructors

import 'package:collapsible_sidebar/home_page.dart';
import 'package:collapsible_sidebar/navigation_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NavigationProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'CollapsibleSideBar',
        home: HomePage(),
      ),
    );
  }
}
