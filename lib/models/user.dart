import 'package:dialoglist/models/style.dart';

class User {
  String name;
  int noOfStyles;
  int followers;
  bool isFollowed;
  List<Style> styles;
  String avatar;
  String image;
  User({
    this.name,
    this.noOfStyles,
    this.followers,
    this.isFollowed,
    this.styles,
    this.avatar,
    this.image,
  });
}
