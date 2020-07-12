import 'package:flutter/material.dart';
import 'package:flutter_module/common/widgets/widgets.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: '首页'),
      body: Container(
        color: Colors.white,
      ),
    );
  }
}
