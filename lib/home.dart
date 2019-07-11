import 'package:dialoglist/alert.dart';
import 'package:dialoglist/anim.dart';
import 'package:dialoglist/models/style.dart';
import 'package:dialoglist/models/user.dart';
import 'package:dialoglist/productcard.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> with TickerProviderStateMixin {
  AnimationController _controller;
  bool follow;
  User user;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 500,
      ),
    );
    user = User(
      followers: 1200,
      name: "Lizzy Caplan",
      isFollowed: false,
      noOfStyles: 180,
      image: "assets/bg.jpg",
      avatar: "assets/avatar.jpg",
      styles: [
        Style(
          time: "8",
          image: "assets/pro1.jpg",
          likes: 500,
        ),
        Style(
          time: "23",
          image: "assets/pro2.jpg",
          likes: 723,
        ),
        Style(
          time: "36",
          image: "assets/pro3.jpg",
          likes: 800,
        ),
        Style(
          time: "40",
          image: "assets/pro4.jpg",
          likes: 1000,
        ),
        Style(
          time: "45",
          image: "assets/pro5.jpg",
          likes: 1560,
        ),
        Style(
          time: "55",
          image: "assets/pro6.jpg",
          likes: 1789,
        ),
      ],
    );
    follow = user.isFollowed;
    if (follow) {
      if (_controller.isDismissed) {
        _controller.forward();
      }
    }
    super.initState();
  }

  Widget _buildCards() {
    return Container(
      height: 280,
      child: Stack(
        overflow: Overflow.visible,
        alignment: Alignment.bottomCenter,
        fit: StackFit.loose,
        children: <Widget>[
          Positioned(
            left: 30,
            right: 30,
            top: 10,
            child: _buildFakeCard(),
          ),
          Positioned(
            left: 20,
            right: 20,
            top: 20,
            child: _buildFakeCard(),
          ),
          Positioned(
            top: 30,
            child: Hero(
              child: GestureDetector(
                child: Card(
                  elevation: 10,
                  child: ProductCard(style: user.styles[0]),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    new HeroDialogRoute(
                      builder: (BuildContext context) {
                        return ProductsDialog(
                          styles: user.styles,
                          avatar: user.avatar,
                        );
                      },
                    ),
                  );
                },
              ),
              tag: "btntag",
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFakeCard() {
    return Card(
      elevation: 10,
      child: Container(
        height: 10,
        width: MediaQuery.of(context).size.width - 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
          color: Colors.grey.shade100,
        ),
      ),
    );
  }

  Widget _buildName() {
    return Text(
      user.name,
      style: TextStyle(
        color: Colors.white,
        fontSize: 25,
        fontFamily: "Lobster",
        shadows: [
          Shadow(
            blurRadius: 5,
            color: Colors.grey,
          )
        ],
      ),
    );
  }

  Widget _buildInfoBar() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            user.noOfStyles.toString(),
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: "Lobster",
                shadows: [
                  Shadow(
                    blurRadius: 5,
                    color: Colors.grey,
                  )
                ]),
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            "styles",
            style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontFamily: "Lobster",
                shadows: [
                  Shadow(
                    blurRadius: 5,
                    color: Colors.grey,
                  )
                ]),
          ),
          SizedBox(
            width: 15,
          ),
          Text(
            "/",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: "Lobster",
              shadows: [
                Shadow(
                  blurRadius: 5,
                  color: Colors.grey,
                )
              ],
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Text(
            user.followers.toString(),
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: "Lobster",
                shadows: [
                  Shadow(
                    blurRadius: 5,
                    color: Colors.grey,
                  )
                ]),
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            "followers",
            style: TextStyle(
              color: Colors.white,
              fontFamily: "Lobster",
              fontSize: 15,
              shadows: [
                Shadow(
                  blurRadius: 5,
                  color: Colors.grey,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFollowButton() {
    return ClipRect(
      child: GestureDetector(
        onTap: () {
          setState(() {
            follow = !follow;
          });
          if (_controller.isDismissed) {
            _controller.forward();
          } else {
            _controller.reverse();
          }
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(
              color: Color(0xFFfcff8c),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Stack(
            alignment: Alignment.center,
            overflow: Overflow.clip,
            children: <Widget>[
              Text(
                "Follow",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Lobster",
                    shadows: [
                      Shadow(
                        blurRadius: 5,
                        color: Colors.grey,
                      )
                    ]),
              ),
              SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(-1.2, 0.0),
                  end: Offset.zero,
                ).animate(
                  CurvedAnimation(
                    parent: _controller,
                    curve: Interval(0.0, 1.0, curve: Curves.elasticOut),
                  ),
                ),
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color(0xFFfcff8c),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  height: 40,
                  width: 123,
                  child: Text(
                    "Following",
                    style: TextStyle(
                      color: Color(0xFFbb8569),
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Lobster",
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(user.image),
            fit: BoxFit.cover,
          ),
        ),
        alignment: Alignment.bottomCenter,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 35,
                    right: 50,
                    child: Hero(
                      child: Container(
                        width: 100,
                        height: 100,
                      ),
                      tag: "img",
                    ),
                  ),
                ],
              ),
            ),
            _buildName(),
            SizedBox(
              height: 10,
            ),
            _buildInfoBar(),
            SizedBox(
              height: 20,
            ),
            _buildFollowButton(),
            _buildCards(),
          ],
        ),
      ),
    );
  }
}
