import 'package:flutter/material.dart';
import 'package:islamy/provider/setting_provider.dart';
import 'package:islamy/ui/screens/home/tabs/ahadeth_tab/ahadeth_tab.dart';
import 'package:islamy/ui/screens/home/tabs/quran_tab/quran_tab.dart';
import 'package:islamy/ui/screens/home/tabs/radio_tap/radio_tab.dart';
import 'package:islamy/ui/screens/home/tabs/sebha_tab/sebha_tab.dart';
import 'package:islamy/ui/screens/home/tabs/setting/setting.dart';
import 'package:islamy/ui/utils/app_assets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routName = "home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentTabIndex = 0;
  List<Widget> tabs = [
    QuranTab(),
    AhadethTab(),
     SebhaTab(),
    const RadioTab(),
    SettingsTab(),
  ];

  @override
  Widget build(BuildContext context) {
    SettingProvider provider = Provider.of(context);
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(provider.currentTheme == ThemeMode.light
                  ? AppAssets.background
                  : AppAssets.backgroundDark),
              fit: BoxFit.cover)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context)!.islami,
          ),
        ),
        body: tabs[currentTabIndex],
        bottomNavigationBar: buildBottomNavigationBar(),
      ),
    );
  }

  Widget buildBottomNavigationBar() => BottomNavigationBar(
        currentIndex: currentTabIndex,
        onTap: (index) {
          currentTabIndex = index;
          setState(() {});
        },
        items: [
          const BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(AppAssets.iconQuran)), label: "Quran"),
          const BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(AppAssets.iconMoshaf)), label: "Ahades"),
          const BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(AppAssets.iconRadio)), label: "Sepha"),
          const BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(AppAssets.iconSebha)), label: "Radio"),
          BottomNavigationBarItem(
              icon: const Icon(Icons.settings), label: AppLocalizations.of(context)!.settings),
        ],
      );
}
