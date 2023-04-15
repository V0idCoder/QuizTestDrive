import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testdrive/screens/brand_quiz.dart';
import 'package:testdrive/screens/home_page.dart';

import 'package:percent_indicator/percent_indicator.dart';

import '../provider/brands_provider.dart';

class EndBrandQuiz extends StatefulWidget {
  const EndBrandQuiz({super.key});
  static const routeName = '/end_brand_quiz';

  @override
  State<EndBrandQuiz> createState() => _EndBrandQuizState();
}

class _EndBrandQuizState extends State<EndBrandQuiz> {
  @override
  Widget build(BuildContext context) {
    final scores = Provider.of<BrandProvider>(context).score;
    var score = (scores / 2);

    var lengthBrands = Provider.of<BrandProvider>(context).brands.length;

    final ButtonStyle confirmButtonStyle = ElevatedButton.styleFrom(
      // ignore: deprecated_member_use
      onPrimary: Colors.white,
      // ignore: deprecated_member_use
      primary: Colors.black,
      minimumSize: const Size(120, 50),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
    );
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            //Spacer
            const SizedBox(
              height: 200.0,
            ),
            const Text(
              'Fin du Quiz!',
              style: TextStyle(fontSize: 50),
            ),
            //Spacer
            const SizedBox(
              height: 100.0,
            ),

            // CircularPercentIndicator(
            //   radius: 100,
            //   lineWidth: 30,
            //   percent: (scores / 2),
            //   center: Text(
            //     '$scores.0%',
            //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            //   ),
            //   circularStrokeCap: CircularStrokeCap.round,
            //   progressColor: Colors.green,
            //   backgroundColor: Colors.white,
            //   animation: true,
            //   animationDuration: 5000,
            // ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.sports_score),
                Text('Ton score est de:  $score/$lengthBrands',
                    style: TextStyle(fontSize: 20))
              ],
            ),
            //Spacer
            const SizedBox(
              height: 100.0,
            ),

            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: confirmButtonStyle,
                  child: Icon(Icons.restart_alt),
                  onPressed: () {
                    Navigator.of(context).pushNamed(BrandQuizScreen.routeName);
                  },
                ),
                ElevatedButton(
                  style: confirmButtonStyle,
                  child: Icon(Icons.home),
                  onPressed: () {
                    Navigator.of(context).pushNamed(HomePage.routeName);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
