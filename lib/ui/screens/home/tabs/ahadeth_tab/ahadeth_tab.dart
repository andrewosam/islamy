import 'package:flutter/material.dart';
import 'package:islamy/model/details_screen_arguments.dart';
import 'package:islamy/ui/screens/details_screen/details_screen.dart';
import 'package:islamy/ui/utils/app_assets.dart';
import 'package:islamy/ui/utils/app_colors.dart';
import 'package:islamy/ui/utils/constant.dart';

class AhadethTab extends StatelessWidget {
  List ahadethNames = List.generate(50, (index) {
    return " ${index + 1}الحديث رقم";
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(AppAssets.besmAllah),
        const Divider(
          color: AppColors.primiary,
          thickness: 3,
        ),
         Text("اسم الحديث",
            style:Theme.of(context).textTheme.bodySmall,
            textAlign: TextAlign.center),
        const Divider(
          color: AppColors.primiary,
          thickness: 3,
        ),
        Expanded(
            child: ListView.builder(
          itemCount: Constants.suraNames.length,
          itemBuilder: (_, index) {
            return TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, DetailsScreen.routeName,
                      arguments: DetailsScreenArgs(
                          suraOrHadethName: ahadethNames[index],
                          fileName: "h${index + 1}.txt",
                          isnQuranFile: false));
                },
                child: Text(
                  ahadethNames[index],
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall,
                ));
          },
        ))
      ],
    );
  }
}
