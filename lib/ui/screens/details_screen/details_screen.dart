import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamy/model/details_screen_arguments.dart';
import 'package:islamy/provider/setting_provider.dart';
import 'package:provider/provider.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_colors.dart';

class DetailsScreen extends StatefulWidget {
  static const String routeName = "details_screen";

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late DetailsScreenArgs argument;

  String fileContent = "";

  @override
  Widget build(BuildContext context) {
    SettingProvider provider = Provider.of(context);
    argument = ModalRoute.of(context)!.settings.arguments as DetailsScreenArgs;
    if (fileContent.isEmpty) readFile();
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(provider.currentTheme == ThemeMode.light
                  ? AppAssets.background
                  : AppAssets.backgroundDark),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        appBar: AppBar(
          iconTheme: IconThemeData(color: provider.currentTheme==ThemeMode.light?Colors.black:Colors.white),
          centerTitle: true,
          backgroundColor: AppColors.transparent,
          titleTextStyle: Theme.of(context).textTheme.bodySmall,
          elevation: 0,
          title: Text(
            argument.suraOrHadethName,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        body: fileContent.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Text(fileContent,
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.rtl,
                      style: Theme.of(context).textTheme.titleLarge),
                ),
              ),
      ),
    );
  }

  void readFile() async {
    String file = await rootBundle.loadString(argument.isnQuranFile
        ? "assets/files/quran/${argument.fileName}"
        : "assets/files/ahadeth/${argument.fileName}");
    fileContent = file;
    List<String> fileLines = file.split("\n");
    for (int i = 0; i < fileLines.length; i++) {
      fileLines[i] += argument.isnQuranFile ? "(${i + 1})" : " ";
    }
    fileContent = fileLines.join();
    setState(() {});
  }
}
