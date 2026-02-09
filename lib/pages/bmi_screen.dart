import 'package:bmi_calc/core/color.dart';
import 'package:bmi_calc/pages/result.dart';
import 'package:bmi_calc/widget/counter_card.dart';
import 'package:bmi_calc/widget/gender_card.dart';
import 'package:bmi_calc/widget/height_card.dart';
import 'package:flutter/material.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({super.key});

  @override
  State<StatefulWidget> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  int age = 20;
  int weight = 60;
  int heigt = 155;
  bool isfemale = true;
  double result = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.backgroundColor,
      appBar: AppBar(
        backgroundColor: ColorApp.backgroundColor,
        leading: Icon(Icons.local_pizza_rounded, color: Colors.amber),
        title: Text(
          'BMI Calculator',
          style: TextStyle(fontSize: 20, color: ColorApp.whiteColor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          spacing: 10,
          children: [
            maleAndFemale(),
            heightMethod(),
            weightAndAge(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorApp.primaryColor,
                minimumSize: Size(double.infinity, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                result = weight / (heigt * heigt / 10000);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultScreen(result: result),
                  ),
                );
              },
              child: Text(
                'Calculate',
                style: TextStyle(fontSize: 25, color: ColorApp.whiteColor),
              ),
            ),
          ],
        ),
      ),
    );
  }

  HeightCard heightMethod() {
    return HeightCard(
      number: heigt,
      onChange: (value) {
        setState(() {
          heigt = value.toInt();
        });
      },
    );
  }

  Expanded maleAndFemale() {
    return Expanded(
      child: Row(
        spacing: 10,
        children: [
          GenderCard(
            text: "male",
            icon: Icons.male_rounded,
            onTap: () {
              setState(() {
                isfemale = false;
              });
            },
            isSelected: !isfemale,
          ),
          GenderCard(
            text: 'female',
            icon: Icons.female_rounded,
            onTap: () {
              setState(() {
                isfemale = true;
              });
            },
            isSelected: isfemale,
          ),
        ],
      ),
    );
  }

  Expanded weightAndAge() {
    return Expanded(
      child: Row(
        spacing: 10,
        children: [
          CounterCard(
            text: 'age',
            number: age,
            onAdd: () {
              setState(() {
                age++;
              });
            },
            onRemove: () {
              if (age > 5) {
                setState(() {
                  age--;
                });
              }
            },
          ),
          CounterCard(
            text: 'weight',
            number: weight,
            onAdd: () {
              setState(() {
                weight++;
              });
            },
            onRemove: () {
              if (weight > 0) {
                setState(() {
                  weight--;
                });
              }
            },
          ),
        ],
      ),
    );
  }
}
