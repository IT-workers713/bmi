import 'package:bmi/result.dart';
import 'package:bmi/round.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'Icon_content.dart';
import 'bottom.dart';
import 'calc.dart';
import 'card-content.dart';
import 'constants.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 175;
  int weight = 65;
  int age = 30;

  void updateGender(Gender gender) {
    setState(() {
      selectedGender = gender;
    });
  }

  void updateWeight(int value) {
    setState(() {
      weight += value;
    });
  }

  void updateAge(int value) {
    setState(() {
      age += value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                _buildGenderCard(Gender.male, FontAwesomeIcons.mars, "MALE"),
                _buildGenderCard(
                    Gender.female, FontAwesomeIcons.venus, "FEMALE"),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: kCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('HEIGHT', style: kLabelTextStyle),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    mainAxisAlignment: MainAxisAlignment.center,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toString(), style: kNumberTextStyle),
                      const Text("cm", style: kLabelTextStyle),
                    ],
                  ),
                  Slider(
                    value: height.toDouble(),
                    min: 120,
                    max: 220,
                    activeColor: accentColor,
                    onChanged: (double newValue) {
                      setState(() => height = newValue.toInt());
                    },
                  ),
                ],
              ),
              onTap: () {},
            ),
          ),
          Expanded(
            child: Row(
              children: [
                _buildWeightAgeCard('WEIGHT', weight, updateWeight),
                _buildWeightAgeCard('AGE', age, updateAge),
              ],
            ),
          ),
          BottomButton(
            onTap: () {
              final calc = CalculatorBrain(height: height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(calculatorBrain: calc),
                ),
              );
            },
            buttonTitle: "CALCULATE",
          ),
        ],
      ),
    );
  }

  Expanded _buildGenderCard(Gender gender, IconData icon, String label) {
    return Expanded(
      child: ReusableCard(
        color: selectedGender == gender ? kCardColor : kInactiveCardColor,
        cardChild: IconContent(iconData: icon, text: label),
        onTap: () => updateGender(gender),
      ),
    );
  }

  Expanded _buildWeightAgeCard(
      String label, int value, Function(int) updateValue) {
    return Expanded(
      child: ReusableCard(
        color: kCardColor,
        cardChild: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(label, style: kLabelTextStyle),
            Text(value.toString(), style: kNumberTextStyle),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RoundIconButton(
                  icon: FontAwesomeIcons.minus,
                  onPressed: () => updateValue(-1),
                ),
                const SizedBox(width: 10),
                RoundIconButton(
                  icon: FontAwesomeIcons.plus,
                  onPressed: () => updateValue(1),
                ),
              ],
            ),
          ],
        ),
        onTap: () {},
      ),
    );
  }
}
