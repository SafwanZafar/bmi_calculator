import 'package:bmi_calculator/CustomWidget/bottomButton.dart';
import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'CustomWidget/icon_content.dart';
import 'CustomWidget/reuse_card.dart';
import 'CustomWidget/rounded_icon_button.dart';
import 'const/const.dart';

enum Gender { male, female }

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double height = 180.0;
  double weight = 80;
  int age = 19;
  Gender? selectGender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kActiveCardColor,
        centerTitle: true,
        title: Text(
          'BMI CALCULATOR',
          style: TextStyle(color: Color(0xFF8D8E98)),
        ),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Expanded(
            child: Row(
          children: [
            Expanded(
                child: ReuseCard(
              onPress: () {
                setState(() {
                  selectGender = Gender.male;
                });
              },
              colour: selectGender == Gender.male
                  ? kActiveCardColor
                  : kInactiveCardColor,
              cardChild: IconContent(
                label: 'Male',
                icon: FontAwesomeIcons.mars,
              ),
            )),
            Expanded(
                child: ReuseCard(
                    onPress: () {
                      setState(() {
                        selectGender = Gender.female;
                      });
                    },
                    colour: selectGender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: IconContent(
                        icon: FontAwesomeIcons.venus, label: 'FEMALE'))),
          ],
        )),
        Expanded(
            child: ReuseCard(
          onPress: () {},
          colour: kActiveCardColor,
          cardChild: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'HEIGHT',
                style: kLabelTextStyle,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(height.toString(), style: kNumberTextStyle),
                  Text(
                    'cm',
                    style: kLabelTextStyle,
                  )
                ],
              ),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  inactiveTrackColor: Color(0xFF8D8E98),
                  activeTrackColor: Colors.white,
                  thumbColor: Color(0xFFEB1555),
                  overlayColor: Color(0x29EB1555),
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                  overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                ),
                child: Slider(
                  value: height.toDouble(),
                  min: 120.0,
                  max: 220.0,
                  onChanged: (double newValue) {
                    setState(() {
                      height = newValue
                          .round()
                          .toDouble(); // Ensures value remains double
                    });
                  },
                ),
              )
            ],
          ),
        )),
        Expanded(
          child: Row(
            children: [
              //******************* weight section******************
              Expanded(
                  child: ReuseCard(
                onPress: () {},
                colour: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'WEIGHT',
                      style: kLabelTextStyle,
                    ),
                    Text(
                      weight.toString(),
                      style: kNumberTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundedIconButton(
                          icon: FontAwesomeIcons.minus,
                          onPress: () {
                            setState(() {
                              weight--;
                            });
                          },
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        RoundedIconButton(
                          icon: FontAwesomeIcons.plus,
                          onPress: () {
                            setState(() {
                              weight++;
                            });
                          },
                        ),
                      ],
                    )
                  ],
                ),
              )),
              //*************** Age Section************************//
              Expanded(
                  child: ReuseCard(
                onPress: () {},
                colour: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'AGE',
                      style: kLabelTextStyle,
                    ),
                    Text(
                      age.toString(),
                      style: kNumberTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundedIconButton(
                          icon: FontAwesomeIcons.minus,
                          onPress: () {
                            setState(() {
                              age--;
                            });
                          },
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        RoundedIconButton(
                          icon: FontAwesomeIcons.plus,
                          onPress: () {
                            setState(() {
                              age++;
                            });
                          },
                        ),
                      ],
                    )
                  ],
                ),
              )),
            ],
          ),
        ),
        Bottombutton(
            buttonText: 'Calculate',
            onPress: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weight);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultPage(
                            resultBmi: calc.calculateBMI(),
                            resultInterpretation: calc.getIntepretation(),
                            resultText: calc.getResult(),
                          )));
            })
      ]),
    );
  }
}
