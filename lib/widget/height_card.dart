import 'package:bmi_calc/core/color.dart';
import 'package:flutter/material.dart';

class HeightCard extends StatelessWidget {
  const HeightCard({super.key, required this.number, required this.onChange});
  final int number;
  final Function(double) onChange;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: ColorApp.cardColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'height',
              style: TextStyle(fontSize: 20, color: ColorApp.whiteColor),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  number.toString(),
                  style: TextStyle(
                    color: ColorApp.whiteColor,
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'cm',
                  style: TextStyle(color: ColorApp.whiteColor, fontSize: 25),
                ),
              ],
            ),
            Slider(
              value: number.toDouble(),
              min: 80,
              max: 220,
              activeColor: ColorApp.primaryColor,
              inactiveColor: ColorApp.greyColor,
              onChanged: onChange,
            ),
          ],
        ),
      ),
    );
  }
}
