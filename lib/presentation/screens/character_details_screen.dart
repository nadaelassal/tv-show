// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:tv_show/constants/mycolors.dart';
import 'package:tv_show/data/models/characters.dart';

class CharacteDetailsScreen extends StatelessWidget {
  final Character character;
  const CharacteDetailsScreen({super.key, required this.character});

  Widget buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: Mycolors.myGrey,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          character.name,
          //style: TextStyle(color: Mycolors.myWhite),
          //textAlign: TextAlign.start,
        ),
        background: Hero(
          tag: character.id,
          child: Image.network(
            character.image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget characterInfo(String title, String value) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: TextStyle(
              color: Mycolors.myWhite,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
           TextSpan(
            text: value,
            style: TextStyle(
              color: Mycolors.myWhite,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDivider (double endIndent) {
    return Divider(
      height: 30,
      endIndent: endIndent ,
      color: Mycolors.myYellow,
      thickness: 2,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Mycolors.myGrey,
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: EdgeInsets.fromLTRB(14, 14, 14, 0),
                  padding: EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      characterInfo('Species : ' ,character.species ),
                      buildDivider(278),
                      characterInfo('Gender : ' ,character.gender ),
                      buildDivider(290),
                      characterInfo('Status : ' ,character.statusIfDeadOrAlive ),
                      buildDivider(295),

                    ],
                  ),
                ),
                SizedBox(
                  height: 500,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
