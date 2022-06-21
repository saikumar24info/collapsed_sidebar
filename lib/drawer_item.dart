import 'package:flutter/material.dart';

class DrawerItem {
  final String itemName;
  final IconData icon;

  const DrawerItem({required this.itemName, required this.icon});
}

final firstItems = [
  const DrawerItem(itemName: 'Home', icon: Icons.home),
  const DrawerItem(itemName: 'Search', icon: Icons.search),
  const DrawerItem(itemName: 'Settings', icon: Icons.settings),
  const DrawerItem(itemName: 'Files', icon: Icons.copy)
];
final secondItems = [
  const DrawerItem(itemName: 'Deployment', icon: Icons.cloud_upload),
  const DrawerItem(itemName: 'Resources', icon: Icons.extension),
];
