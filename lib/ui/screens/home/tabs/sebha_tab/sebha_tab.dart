import 'package:flutter/material.dart';
import 'package:islamy/provider/setting_provider.dart';
import 'package:islamy/ui/utils/app_assets.dart';
import 'package:islamy/ui/utils/app_colors.dart';
import 'package:provider/provider.dart';

class SebhaTab extends StatefulWidget {
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;
  int newCounter = 0;
  double Angle = 0;

  @override
  Widget build(BuildContext context) {
    SettingProvider provider = Provider.of(context);
    List<String> azkar = [
      "سبحان الله",
      "الحمد الله",
      "الله اكبر",
      "لا اله الا الله",
    ];

    return Center(
      child: Column(
        children: [
          Stack(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(provider.currentTheme == ThemeMode.light
                    ? AppAssets.sebhaHead
                    : AppAssets.sebhaHeadDark),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 70),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
              Transform.rotate(
                angle: Angle,
                child: SizedBox(
                  width: 250,
                  height: 250,
                  child: (IconButton(
                    onPressed: () {
                      if (counter == 33) {
                        if (newCounter == 3) {
                          newCounter = 0;
                        } else {
                          newCounter++;
                        }
                        counter = 0;
                      } else {
                        counter++;
                        Angle++;
                      }
                      setState(() {});
                    },
                    icon: Image.asset(provider.currentTheme == ThemeMode.light
                        ? AppAssets.sebha
                        : AppAssets.sebhaDark),
                  )),
                ),
              ),
              ],),
            )
          ]),

          Padding(
            padding: const EdgeInsets.all(30),
            child: Text(
              "عدد التسبيحات",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Container(
            width: 70,
            height: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: provider.currentTheme == ThemeMode.light
                    ? AppColors.primiary
                    : AppColors.primiaryDark),
            child: Center(
              child: Text("$counter",
                  style: Theme.of(context).textTheme.titleLarge),
            ),
          ),
          // comment

          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              width: 140,
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: provider.currentTheme == ThemeMode.light
                      ? AppColors.primiary
                      : AppColors.accentDark),
              child: Center(
                child: Text(azkar[newCounter],
                    style: Theme.of(context).textTheme.titleLarge),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
