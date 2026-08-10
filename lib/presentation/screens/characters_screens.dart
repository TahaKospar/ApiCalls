import 'package:bloxtest/business_logic/cubit/character_cubit.dart';
import 'package:bloxtest/constans/my_colors.dart';
import 'package:bloxtest/data/model/characters.dart';
import 'package:bloxtest/presentation/widgets/character_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharactersScreens extends StatefulWidget {
  const CharactersScreens({super.key});
  @override
  State<CharactersScreens> createState() => _CharactersScreensState();
}

class _CharactersScreensState extends State<CharactersScreens> {
  late List<Character> allCharacter;
  late List<Character> searchedForCharacter;
  bool _isSearching = false;
  final _searchTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CharacterCubit>(context).getAllCharacter();
  }

  Widget _buildSearchField() {
    return TextField(
      controller: _searchTextController,
      cursorColor: myColors.grey,
      decoration: InputDecoration(
        hintText: "Find A Character... ",
        border: InputBorder.none,
        hintStyle: TextStyle(
          color: myColors.grey,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      style: TextStyle(
        color: myColors.grey,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
      onChanged: (searchedCharacter) {
        addSearchForItemToSearchedList(searchedCharacter);
      },
    );
  }

  void addSearchForItemToSearchedList(String searchedCharacter) {
    searchedForCharacter = allCharacter
        .where(
          (character) =>
              character.name.toLowerCase().startsWith(searchedCharacter),
        )
        .toList();
    setState(() {});
  }

  List<Widget> _buildAppBarActions() {
    if (_isSearching) {
      return [
        IconButton(
          onPressed: () {
            _clearSearching();
            Navigator.pop(context);
          },
          icon: Icon(Icons.close),
        ),
      ];
    } else {
      return [
        IconButton(
          onPressed: () {
            _startShearch();
          },
          icon: Icon(Icons.search),
        ),
      ];
    }
  }

  void _startShearch() {
    ModalRoute.of(
      context,
    )!.addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));
    setState(() {
      _isSearching = true;
    });
  }

  void _stopSearching() {
    _clearSearching();
    setState(() {
      _isSearching = false;
    });
  }

  void _clearSearching() {
    setState(() {
      _searchTextController.clear();
    });
  }

  Widget buildBlocWidget() {
    return BlocBuilder<CharacterCubit, CharacterState>(
      builder: (context, state) {
        if (state is CharacterLoaded) {
          allCharacter = (state).characters;
          return buildLoadedListWidgets();
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget buildLoadedListWidgets() {
    return SingleChildScrollView(
      child: Container(
        color: myColors.grey,
        child: Column(children: [buildCharacterList()]),
      ),
    );
  }

  Widget buildCharacterList() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.all(4),
      itemCount: _searchTextController.text.isEmpty
          ? allCharacter.length
          : searchedForCharacter.length,
      itemBuilder: (context, index) {
        return CharacterItem(
          character: _searchTextController.text.isEmpty
              ? allCharacter[index]
              : searchedForCharacter[index],
        );
      },
    );
  }

  Widget _buildAppBarTitle() {
    return Text("Character", style: TextStyle(color: myColors.grey));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: myColors.yellow,
        title: _isSearching ? _buildSearchField() : _buildAppBarTitle(),
        centerTitle: false,
        actions: _buildAppBarActions(),
      ),
      body: buildBlocWidget(),
    );
  }
}
