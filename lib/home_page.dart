// ignore_for_file: prefer_const_constructors

import 'package:collapsible_sidebar/drawer_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('SideBar'),
      ),
      drawer: DrawerPage(),
    );
  }
}
