import 'package:flutter/material.dart';

class Deployment extends StatefulWidget {
  const Deployment({Key? key}) : super(key: key);

  @override
  State<Deployment> createState() => _DeploymentState();
}

class _DeploymentState extends State<Deployment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Deployment'),
      ),
    );
  }
}
