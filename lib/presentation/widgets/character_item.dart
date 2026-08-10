import 'package:bloxtest/constans/my_colors.dart';
import 'package:bloxtest/constans/strings.dart';
import 'package:bloxtest/data/model/characters.dart';
import 'package:flutter/material.dart';

class CharacterItem extends StatelessWidget {
  final Character character;
  const CharacterItem({super.key, required this.character});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: myColors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(CharactersDeatials, arguments: character);
        },
        child: GridTile(
          footer: Hero(
            tag: character.charId,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 10),
              color: Colors.black54,
              child: Text(
                character.name,
                style: TextStyle(
                  height: 1.3,
                  fontSize: 16,
                  color: myColors.white,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          child: Container(
            child: character.image.isNotEmpty
                ? FadeInImage.assetNetwork(
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                    placeholder: 'assets/images/loading (1).gif',
                    image: character.image,
                  )
                : Image.asset("assets/images/failure.png"),
          ),
        ),
      ),
    );
  }
}
