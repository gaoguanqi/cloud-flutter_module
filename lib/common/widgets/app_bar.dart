import 'package:flutter/material.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {

  final double contentHeight; //从外部指定高度
  Color navigationBarBackgroundColor; //设置导航栏背景的颜色
  Widget leadingWidget;
  Widget trailingWidget;
  String title;

  MyAppBar({
    @required this.title,
    this.contentHeight = 44,
    this.navigationBarBackgroundColor = Colors.white,
    this.leadingWidget,
    this.trailingWidget,
  }) : super();

  @override
  _MyAppBarState createState() => _MyAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(contentHeight);
}

/// 这里没有直接用SafeArea，而是用Container包装了一层
/// 因为直接用SafeArea，会把顶部的statusBar区域留出空白
/// 外层Container会填充SafeArea，指定外层Container背景色也会覆盖原来SafeArea的颜色
///     var statusheight = MediaQuery.of(context).padding.top;  获取状态栏高度
class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.navigationBarBackgroundColor,
      child: SafeArea(
        top: true,
        child: Container(
          decoration: UnderlineTabIndicator(
            borderSide: BorderSide(width: 0.5,color: Color(0xFFeeeeee))
          ),
          height: widget.contentHeight,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Positioned(
                left: 0,
                child: Container(
                  padding: const EdgeInsets.only(left: 5),
                  child: widget.leadingWidget,
                ),
              ),
              Container(
                child: Text(widget.title,style: TextStyle(fontSize: 17,color: Color(0xFF333333)))
              ),
              Positioned(
                right: 0,
                child: Container(
                 padding: const EdgeInsets.only(right: 5),
                  child: widget.trailingWidget
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}

