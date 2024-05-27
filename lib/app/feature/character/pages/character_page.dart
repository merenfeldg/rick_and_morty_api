import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../bloc/character_bloc.dart';
import 'character_detail_page.dart';

class CharacterPage extends StatefulWidget {
  const CharacterPage({super.key});

  @override
  State<CharacterPage> createState() => _CharacterPageState();
}

class _CharacterPageState extends State<CharacterPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final characterBloc = GetIt.instance<CharacterBloc>();

    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          characterBloc.add(GetAllCharacter());
        },
        child: const Icon(Icons.sync),
      ),
      body: BlocBuilder<CharacterBloc, CharacterState>(
        bloc: characterBloc,
        builder: (context, state) {
          if(state is CharacterInitial) {
            return const Center(
              child: Text('Aperte no botão para ver os personagens'),
            );
          }
          else if(state is CharacterError) {
            return Center(
              child: Text(state.message),
            );
          }
          else if(state is CharacterSuccess) {
            return ListView.builder(
              itemCount: state.characters.length,
              itemBuilder: (context, index) {
                final character = state.characters[index];
                return ListTile(
                  leading: Hero(
                    tag: character.name,
                    child: Image.network(character.image)
                  ),
                  title: Text(character.name),
                  subtitle: Text(character.status),
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => CharacterDetailPage(
                            character: character,
                            tag: character.name,
                          ),
                        )
                    );
                  },
                );
              },
            );
          }
          else {
            return const Center(
              child: Text('Erro Desconhecido'),
            );
          }
        },
      )
    );
  }
}