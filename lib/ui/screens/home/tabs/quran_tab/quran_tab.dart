import 'package:flutter/material.dart';
import 'package:islamy/model/details_screen_arguments.dart';
import 'package:islamy/ui/screens/details_screen/details_screen.dart';
import 'package:islamy/ui/utils/app_assets.dart';
import 'package:islamy/ui/utils/app_colors.dart';
import 'package:islamy/ui/utils/constant.dart';

class QuranTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(AppAssets.Quran),
        const Divider(
          color: AppColors.primiary,
          thickness: 3,
        ),
        Text("اسم الصوره",
            style: Theme.of(context).textTheme.bodySmall,
            textAlign: TextAlign.center,
        ),
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
                          suraOrHadethName: Constants.suraNames[index],
                          fileName: "${index + 1}.txt",
                          isnQuranFile: true));
                },
                child: Text(
                  Constants.suraNames[index],
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall,
                ));
          },
        ))
      ],
    );
  }
}
