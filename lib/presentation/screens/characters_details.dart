import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bloxtest/constans/my_colors.dart';
import 'package:bloxtest/data/model/characters.dart';
import 'package:flutter/material.dart';

class CharactersDetailsScreen extends StatelessWidget {
  final Character character;
  const CharactersDetailsScreen({super.key, required this.character});

  Widget buildSilverAppBarr() {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: myColors.grey,

      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          character.name,
          style: TextStyle(
            color: myColors.white,
            backgroundColor: myColors.grey,
          ),
        ),
        background: Hero(
          tag: character.charId,
          child: Image.network(character.image, fit: BoxFit.cover),
        ),
      ),
    );
  }

  Widget characherInfo(String title, String value) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: myColors.white,
            ),
          ),
          TextSpan(
            text: value,
            style: TextStyle(fontSize: 16, color: myColors.white),
          ),
        ],
      ),
    );
  }

  Widget buildDivider(double endIndent) {
    return Divider(
      color: myColors.yellow,
      height: 30,

      thickness: 2,
      endIndent: endIndent,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myColors.grey,
      body: CustomScrollView(
        slivers: [
          buildSilverAppBarr(),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                margin: EdgeInsets.all(14),
                child: Padding(
                  padding: EdgeInsetsGeometry.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      characherInfo("name : ", character.name),
                      buildDivider(330),
                      characherInfo("status : ", character.status),
                      buildDivider(325),
                      characherInfo("species : ", character.species),
                      buildDivider(315),
                      characherInfo("gender : ", character.gender),
                      buildDivider(320),
                      characherInfo("created : ", character.created),
                      buildDivider(310),
                      SizedBox(height: 20),
                      // characherInfo("created : ", character.origin.join()),
                      // characherInfo("created : ", character.origin.join()),
                    ],
                  ),
                ),
              ),

              AnimatedTextKit(
                animatedTexts: [
                  FadeAnimatedText(
                    character.location["name"],
                    textStyle: TextStyle(
                      color: Colors.yellow[800],
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),

                    textAlign: TextAlign.center,
                    duration: const Duration(milliseconds: 2000),
                  ),
                ],
                repeatForever: true,
              ),
              SizedBox(height: 420),
            ]),
          ),
        ],
      ),
    );
  }
}
