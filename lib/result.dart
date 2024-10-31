import 'package:flutter/material.dart';

import 'bottom.dart';
import 'calc.dart';
import 'constants.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage({required this.calculatorBrain});

  final CalculatorBrain calculatorBrain;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            child: Text(
              "Your Result",
              style: kTitleTextStyle,
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 25, left: 10, bottom: 10, right: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: kCardColor),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    calculatorBrain.getResult(),
                    style: kResultTextStyle,
                  ),
                  Text(
                    calculatorBrain.calculateBMI(),
                    style: kBMITextStyle,
                  ),
                  Text(
                    calculatorBrain.getInterpretation(),
                    style: kBodyTextStyle,
                  )
                ],
              ),
            ),
          ),
          BottomButton(
            buttonTitle: "RE-CALCULATE",
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
