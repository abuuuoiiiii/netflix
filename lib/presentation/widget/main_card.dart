import 'package:flutter/material.dart';
import 'package:netflix/core/colors/constants.dart';

class MainCards extends StatelessWidget {
  const MainCards({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: 130,
      height: 250,
      decoration: BoxDecoration(
        borderRadius: kRadius10,
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            "asset/The_Warrior's_Way_Poster.jpg",
          ),
        ),
      ),
    );
  }
}
