//import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/brands_provider.dart';
import '../widgets/brand_item.dart';
import 'end_brand_quiz.dart';

class BrandQuizScreen extends StatefulWidget {
  static const routeName = '/brand_quiz';

  const BrandQuizScreen({super.key});

  @override
  State<BrandQuizScreen> createState() => _BrandQuizScreenState();
}

class _BrandQuizScreenState extends State<BrandQuizScreen> {
  bool _isInit = false;
  //Index du Random()
  int rndIndex = 0;
  //Nombre max des questions de brands.json
  int lengthBrands = 0;

  int index = 0;

  int score = 0;

  List<int> nombres = [];

  @override
  Future<void> didChangeDependencies() async {
    if (!_isInit) {
      await Provider.of<BrandProvider>(context).fetchAndSetBrands();
      rndIndex++;
      nombres.shuffle();
      _isInit = true;
    }
    super.didChangeDependencies();
  }

  //Fonction qui envoie la prochaine question
  void next() {
    setState(() {
      rndIndex++;
    });
  }

  void endGame() {
    setState(() {
      if (rndIndex == lengthBrands) {
        Navigator.of(context).pushNamed(EndBrandQuiz.routeName);
        developer.log('EndGame');
        nombres.shuffle();
      } else {
        index++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final brands = Provider.of<BrandProvider>(context).brands;
    lengthBrands = Provider.of<BrandProvider>(context).brands.length;

    for (int i = 0; i < brands.length; i++) {
      if (i != 0) nombres.add(i);
    }

    //May Random() lenghts par rapport au nb de questions dans brands.js
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('$index / $lengthBrands'),
      ),
      body: Center(
        child: ModelItem(
          idBrand: brands[nombres[rndIndex]].idBrand,
          strBrand: brands[nombres[rndIndex]].strBrand,
          linkBrand: brands[nombres[rndIndex]].linkBrand,
          choice1: brands[nombres[rndIndex]].choice1,
          choice2: brands[nombres[rndIndex]].choice2,
          choice3: brands[nombres[rndIndex]].choice3,
          choice4: brands[nombres[rndIndex]].choice4,
          answer: brands[nombres[rndIndex]].answer,
          nextQuestion: next,
          endGame: endGame,
        ),
      ),
    );
  }
}
