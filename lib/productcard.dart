import 'package:dialoglist/models/style.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Style style;
  ProductCard({this.style});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: MediaQuery.of(context).size.width - 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
      ),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(5),
                topLeft: Radius.circular(5),
              ),
              color: Colors.grey.shade100,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  style.time,
                  style: TextStyle(
                    color: Color(0xFF8AD3D5),
                    fontSize: 25,
                    fontFamily: "Lobster",
                    decoration: TextDecoration.none,
                  ),
                ),
                SizedBox(
                  width: 3,
                ),
                Text(
                  "Minutes",
                  style: TextStyle(
                    color: Colors.grey.shade400,
                    fontSize: 15,
                    fontFamily: "Lobster",
                    decoration: TextDecoration.none,
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          style.likes.toString(),
                          style: TextStyle(
                            color: Color(0xFF8AD3D5),
                            fontSize: 20,
                            fontFamily: "Lobster",
                            decoration: TextDecoration.none,
                          ),
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Icon(
                          Icons.favorite,
                          color: Color(0xFFf2857b),
                          size: 20,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 200,
            width: MediaQuery.of(context).size.width - 30,
            color: Colors.white,
            child: Image.asset(
              style.image,
              
              alignment: Alignment.topCenter,
              scale: .5,
            ),
          )
        ],
      ),
    );
  }
}
