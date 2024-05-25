import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/search/search_bloc.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/colors/constants.dart';
import 'package:netflix/presentation/search/widget/title.dart';

// const imageurl = ["asset/jumanji.jpeg"];

class SearchIdleWidget extends StatelessWidget {
  SearchIdleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SearchTextTitle(title: "Top Searches"),
        kheight,
        Expanded(
          child:
              BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
            if (state.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state.isError) {
              return const Center(
                child: Text("Error while getting data"),
              );
            } else if (state.idleList.isEmpty) {
              log('$imageAppendUrl${state.idleList}');

              // log('$imageAppendUrl${SearchEventCopyWith.}');
              return const Center(
                child: Text("List is empty"),
              );
            }
            return ListView.separated(
              shrinkWrap: true,
              itemBuilder: (ctx, index) {
                final movie = state.idleList[index];
                return TopSearchItemTile(
                  ImageUrl: '$imageAppendUrl${movie.posterPath}',
                  title: movie.title ?? 'No title Provided',
                );
              },
              //  {
              //   final movie = state.idleList[index];
              //   return TopSearchItemTile(
              //     ImageUrl: '$imageAppendUrl${movie.posterPath}',
              //     title: movie.title ?? 'No title Provided',
              //   );
              // },
              separatorBuilder: (ctx, index) => kHeight20,
              itemCount: state.idleList.length,
            );
          }),
        )
      ],
    );
  }
}

class TopSearchItemTile extends StatelessWidget {
  const TopSearchItemTile(
      {super.key, required this.ImageUrl, required this.title});
  final String ImageUrl;
  final String title;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenWidth * 0.35,
          height: 70,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(ImageUrl),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            title,
            style: TextStyle(
              color: kWhiteColor,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        const CircleAvatar(
          backgroundColor: kWhiteColor,
          radius: 23,
          child: CircleAvatar(
            backgroundColor: KBlackColor,
            radius: 21,
            child: Icon(
              Icons.play_circle_fill,
              color: kWhiteColor,
            ),
          ),
        )
      ],
    );
  }
}
