// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, prefer_const_declarations

import 'package:collapsible_sidebar/drawer_item.dart';
import 'package:collapsible_sidebar/home_page.dart';
import 'package:collapsible_sidebar/navigation_provider.dart';
import 'package:collapsible_sidebar/pages/deployment.dart';
import 'package:collapsible_sidebar/pages/files.dart';
import 'package:collapsible_sidebar/pages/resources.dart';
import 'package:collapsible_sidebar/pages/search_page.dart';
import 'package:collapsible_sidebar/pages/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NavigationProvider>(context);
    final isCollapsed = provider.isCollapsed;
    final safeArea =
        EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top);
    return SizedBox(
      width: isCollapsed ? MediaQuery.of(context).size.width * 0.2 : null,
      child: Drawer(
        child: Container(
          color: Color(0XFF1A2F45),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 3).add(safeArea),
                child: Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: double.infinity,
                    color: Colors.white12,
                    child: buildHeader(isCollapsed)),
              ),
              buildFirstItems(isCollapsed: isCollapsed, items: firstItems),
              Divider(
                color: Colors.white54,
                thickness: 1,
              ),
              buildSecondItems(isCollapsed: isCollapsed, items: secondItems),
              Spacer(),
              buildCollapseIcon(context, isCollapsed)
            ],
          ),
        ),
      ),
    );
  }

  Widget buildHeader(bool isCollapsed) {
    return isCollapsed
        ? FlutterLogo(size: 48)
        : Row(
            children: [
              SizedBox(
                height: 24,
              ),
              FlutterLogo(
                size: 48,
              ),
              SizedBox(
                width: 16,
              ),
              Text(
                'Flutter',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                ),
              )
            ],
          );
  }

  Widget buildCollapseIcon(BuildContext context, bool isCollapsed) {
    final double size = 25;
    final icon = isCollapsed ? Icons.arrow_forward_ios : Icons.arrow_back_ios;
    final alignment = isCollapsed ? Alignment.center : Alignment.centerRight;
    final margin = isCollapsed
        ? EdgeInsets.all(10)
        : EdgeInsets.only(right: 10, bottom: 10);
    return Container(
      alignment: alignment,
      margin: margin,
      child: InkWell(
        onTap: () {
          final provider =
              Provider.of<NavigationProvider>(context, listen: false);
          provider.toggleIsCollapsed();
        },
        child: Icon(
          icon,
          color: Colors.white,
          size: size,
        ),
      ),
    );
  }

  Widget buildFirstItems(
      {required bool isCollapsed, required List<DrawerItem> items}) {
    return ListView.builder(
        shrinkWrap: true,
        primary: false,
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return isCollapsed
              ? ListTile(
                  onTap: () => buildNaigateFirstItems(context, index),
                  leading: Icon(
                    item.icon,
                    color: Colors.white,
                    size: 24,
                  ),
                )
              : ListTile(
                  onTap: () => buildNaigateFirstItems(context, index),
                  leading: Icon(
                    item.icon,
                    color: Colors.white,
                    size: 24,
                  ),
                  title: Text(
                    item.itemName,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w400),
                  ),
                );
        });
  }

  Widget buildSecondItems(
      {required bool isCollapsed, required List<DrawerItem> items}) {
    return ListView.builder(
        shrinkWrap: true,
        primary: false,
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return isCollapsed
              ? ListTile(
                  onTap: () => buildNavigateSecondItems(context, index),
                  leading: Icon(
                    item.icon,
                    color: Colors.white,
                    size: 24,
                  ),
                )
              : ListTile(
                  onTap: () => buildNavigateSecondItems(context, index),
                  leading: Icon(
                    item.icon,
                    color: Colors.white,
                    size: 24,
                  ),
                  title: Text(
                    item.itemName,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w400),
                  ),
                );
        });
  }

  void buildNaigateFirstItems(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SearchPage()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Settings()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Files()),
        );
        break;
    }
  }

  void buildNavigateSecondItems(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Deployment()),
        );
        break;

      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Resources()),
        );
        break;
    }
  }
}
