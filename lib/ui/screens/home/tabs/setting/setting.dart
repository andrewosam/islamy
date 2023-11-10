import 'package:flutter/material.dart';
import 'package:islamy/provider/setting_provider.dart';
import 'package:islamy/ui/screens/home/tabs/setting/language_bottom_sheet.dart';
import 'package:islamy/ui/utils/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class SettingsTab extends StatefulWidget {
  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    SettingProvider provider = Provider.of(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Spacer(
            flex: 1,
          ),
          Text(
            AppLocalizations.of(context)!.language,
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(
            height: 22,
          ),
          InkWell(
              onTap: () {
                onLanguageRowClick();
              },
              child: getRowOption(
                  provider.currentLocal == "en" ? "English" : "العربيه")),
          const SizedBox(
            height: 22,
          ),
          Row(
            children: [
              Text(
                "Dark Mode",
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const Spacer(),
              Switch(
                  value: switchValue,
                  onChanged: (newSwitchValue) {
                    switchValue = newSwitchValue;
                    if (switchValue) {
                      provider.currentTheme = ThemeMode.dark;
                      provider.changeCurrentTheme(ThemeMode.dark);
                    } else {
                      provider.currentTheme = ThemeMode.light;
                      provider.changeCurrentTheme(ThemeMode.light);
                    }
                  })
            ],
          ),
          const SizedBox(
            height: 22,
          ),
          const Spacer(
            flex: 9,
          ),
        ],
      ),
    );
  }

  Widget getRowOption(String selectedOption) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColors.primiary),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            selectedOption,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const Icon(Icons.arrow_drop_down),
        ],
      ),
    );
  }

  void onLanguageRowClick() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return LanguageBottomSheet();
        });
  }

  void onThemeRowClick() {}
}
