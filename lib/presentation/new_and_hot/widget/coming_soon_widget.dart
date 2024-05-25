import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/colors/constants.dart';
import 'package:netflix/presentation/downloads/widgets/home/custom_button_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({super.key});
  final _imageurl =
      "https://image.tmdb.org/t/p/original/bWIIWhnaoWx3FTVXv6GkYDv3djL.jpg";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        SizedBox(
          height: 470,
          width: 60,
          child: Column(
            children: [
              Text(
                "Nov",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.white60,
                ),
              ),
              Text(
                "11",
                style: TextStyle(
                  letterSpacing: 5,
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  color: kWhiteColor,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: size.width - 60,
          height: 470,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(_imageurl),
              Padding(
                padding: const EdgeInsets.only(top: 20, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        "movie name",
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                            letterSpacing: -3,
                            fontSize: 40,
                            fontWeight: FontWeight.w600,
                            color: kWhiteColor),
                      ),
                    ),
                    CustomButtonWidget(
                        icon: Icons.notifications_none_outlined,
                        title: "Remind Me"),
                    kWidth20,
                    CustomButtonWidget(icon: Icons.info_outline, title: "Imfo")
                  ],
                ),
              ),
              Text(
                "Comming On 11nov ",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.white60,
                ),
              ),
              kheight,
              Text(
                "Movie Name ",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
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
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Colors.white38,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
