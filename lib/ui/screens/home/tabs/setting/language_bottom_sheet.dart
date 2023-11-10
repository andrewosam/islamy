import 'package:flutter/material.dart';
import 'package:islamy/provider/setting_provider.dart';
import 'package:islamy/ui/utils/app_colors.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SettingProvider provider = Provider.of(context);
    return Container(
      color: AppColors.white,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const Text(
              "ٍSelect Your Language",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 8,
            ),
            const Divider(
              color: AppColors.primiary,
              thickness: 3,
              height: 3,
            ),
            const SizedBox(
              height: 22,
            ),
            InkWell(
              onTap: () {
                provider.changeCurrentLocale("en");
                Navigator.pop(context);
              },
              child: getLanguageRow(provider.currentLocal == "en", "English"),
            ),
            const SizedBox(
              height: 16,
            ),
            InkWell(
              onTap: () {
                provider.changeCurrentLocale("ar");
                Navigator.pop(context);
              },
              child: getLanguageRow(provider.currentLocal == "ar", "العربيه"),
            ),
          ],
        ),
      ),
    );
  }

  getLanguageRow(bool isSelected, String language) {
    if (isSelected) {
      return Text(
        language,
        textAlign: TextAlign.start,
        style: const TextStyle(
            color: AppColors.primiary,
            fontSize: 20,
            fontWeight: FontWeight.bold),
      );
    } else {
      return Text(
        language,
        textAlign: TextAlign.start,
        style: const TextStyle(
            color: AppColors.accent, fontSize: 20, fontWeight: FontWeight.bold),
      );
    }
  }
}
