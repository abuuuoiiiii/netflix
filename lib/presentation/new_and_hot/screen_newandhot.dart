import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/colors/constants.dart';
import 'package:netflix/presentation/new_and_hot/everyones_watching_widget.dart';
import 'package:netflix/presentation/new_and_hot/widget/coming_soon_widget.dart';

class ScreenNewAndHOT extends StatelessWidget {
  const ScreenNewAndHOT({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(90),
            child: AppBar(
              title: const Text(
                "New & Hot",
                style: TextStyle(
                  fontSize: 30,
                  color: kWhiteColor,
                  fontWeight: FontWeight.w900,
                ),
              ),
              actions: [
                const Icon(
                  Icons.cast,
                  color: Colors.white,
                  size: 30,
                ),
                kWidth,
                Container(
                  width: 25,
                  height: 23,
                  color: Colors.blue,
                ),
                kWidth,
              ],
              bottom: TabBar(
                unselectedLabelColor: kWhiteColor,
                labelColor: KBlackColor,
                isScrollable: true,
                labelStyle:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                indicator:
                    BoxDecoration(color: kWhiteColor, borderRadius: kRadius30),
                tabs: const [
                  Tab(
                    text: " 🍿 Coming Soon ",
                  ),
                  Tab(
                    text: "👀 Everyone's Watching",
                  ),
                ],
              ),
            ),
          ),
          body: TabBarView(
            children: [
              _buildComingSoon(),
              _buildEveryonesWatching(),

              // _buildTabBarView("Coming Soon"),
              // _buildTabBarView("EVeryone's watching"),
            ],
          )),
    );
  }

  Widget _buildComingSoon() {
    return ListView.builder(
      itemBuilder: (BuildContext context, index) => const ComingSoonWidget(),
      itemCount: 10,
    );
  }

  _buildEveryonesWatching() {
    return ListView.builder(
      itemBuilder: (BuildContext context, index) =>
          const EveryonesWatchingWidget(),
      itemCount: 10,
    );
  }

  // _buildTabBarView(String name) {
  //   return Center(
  //     child: Text("$name"),
  //   );
  // }
}
