import 'package:flutter/material.dart';
import 'package:rick_and_morty_api/app/feature/character/components/character_body_component.dart';

import '../model/character_model.dart';

class CharacterDetailPage extends StatelessWidget {

  final Character character;
  final String tag;

  const CharacterDetailPage({
    required this.character,
    required this.tag,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: CharacterBodyComponent(
          tag: tag,
          character: character,
        )
      ),
    );
  }
}
