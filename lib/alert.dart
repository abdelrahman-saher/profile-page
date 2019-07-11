import 'dart:ui';

import 'package:dialoglist/models/style.dart';
import 'package:dialoglist/productcard.dart';
import 'package:flutter/material.dart';

class ProductsDialog extends StatefulWidget {
  final List<Style> styles;
  final String avatar;
  ProductsDialog({this.styles, this.avatar});
  @override
  State<StatefulWidget> createState() {
    return ProductsDialogState();
  }
}

class ProductsDialogState extends State<ProductsDialog> {
  ScrollController _controller;
  bool small = false;

  _scrollListener() {
    if (_controller.offset >= _controller.initialScrollOffset &&
        !_controller.position.outOfRange) {
      setState(() {
        small = true;
        print("bottom");
      });
    }
    if (_controller.offset <= _controller.position.minScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {
        small = false;
        print("top");
      });
    }
  }

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    super.initState();
  }

  Widget _buildItem(int index) {
    if (index == 0) {
      return SizedBox(
        height: 100,
      );
    } else {
      Style current = widget.styles[index - 1];
      return Column(
        children: <Widget>[
          ProductCard(
            style: current,
          ),
          SizedBox(
            height: 30,
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return new BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
      child: Container(
        decoration: new BoxDecoration(color: Colors.grey.withOpacity(0.6)),
        child: Container(
            color: Colors.transparent,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Hero(
                  child: ListView.builder(
                    controller: _controller,
                    itemCount: widget.styles.length + 1,
                    itemBuilder: (BuildContext context, int index) {
                      return _buildItem(index);
                    },
                  ),
                  tag: "btntag",
                ),
                Hero(
                  child: CircleAvatar(
                    radius: small ? 40 : 50,
                    backgroundImage: AssetImage(widget.avatar),
                  ),
                  tag: "img",
                ),
              ],
            )),
      ),
    );
  }
}
