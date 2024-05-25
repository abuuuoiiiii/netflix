import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/colors/constants.dart';
import 'package:netflix/presentation/downloads/widgets/home/custom_button_widget.dart';

class EveryonesWatchingWidget extends StatelessWidget {
  const EveryonesWatchingWidget({super.key});
  final _imageurl =
      "https://image.tmdb.org/t/p/original/bWIIWhnaoWx3FTVXv6GkYDv3djL.jpg";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Movie Name",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: kWhiteColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, right: 20),
            child: Text(
              "Postwar Japan is at its lowest point when a new crisis emerges in the form of a giant monster, baptized in the horrific power of the atomic bomb.",
              maxLines: 4,
              overflow: TextOverflow.clip,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: Colors.white38,
              ),
            ),
          ),
          kHeight50,
          Image.network(_imageurl),
          kHeight20,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomButtonWidget(icon: Icons.near_me_outlined, title: "Share"),
              kWidth,
              CustomButtonWidget(icon: Icons.add, title: "My List"),
              kWidth,
              CustomButtonWidget(icon: Icons.play_arrow, title: "Play"),
            ],
          )
        ],
      ),
    );
  }
}
