import 'package:flutter/material.dart';

import '../model/character_model.dart';

class CharacterBodyComponent extends StatelessWidget {

  final Character character;
  final String tag;

  const CharacterBodyComponent({
    required this.character,
    required this.tag,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Column(
        children: [
          Hero(
              tag: tag,
              child: GestureDetector(
                onTap: (){
                  Navigator.of(context).pop();
                },
                child: Image.network(character.image)
              )
          ),
          const SizedBox(height: 16),
          Text(
            character.name,
            style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold
            ),
          ),
        ],
      ),
    );
  }
}
