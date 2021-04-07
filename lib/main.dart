import 'package:flutter/material.dart';
import 'package:mostadam_flutter/constants/AppCorors.dart';
import 'package:mostadam_flutter/core/base/BlocBase.dart';
import 'package:mostadam_flutter/splash/view/SpalshPage.dart';
import 'package:mostadam_flutter/tabs/available/bloc/AvailableTasksBloc.dart';
import 'package:mostadam_flutter/tabs/completed/bloc/CompletedTasksBloc.dart';
import 'package:mostadam_flutter/tabs/inprogress/bloc/InprogressTasksBloc.dart';
import 'package:mostadam_flutter/tabs/view/TabPage.dart';
import 'package:easy_localization/easy_localization.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
    supportedLocales: [Locale('ar', '')],
    path: 'assets/translations',
    startLocale: Locale('ar', ''),
    fallbackLocale: Locale('ar', ''),
    child: BlocProvider<AvailableTasksBloc>(
        bloc: AvailableTasksBloc(), child: BlocProvider<InProgressTasksBloc>(
        bloc: InProgressTasksBloc(),
        child: BlocProvider<CompletedTasksBloc>(
            bloc: CompletedTasksBloc(),
            child: MyApp()))),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: APP_BG,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,

      home: SplashPage(),

      routes: <String, WidgetBuilder>{
        '/SplashToTabPage': (BuildContext context) => TabPage(),
      },

      // supportedLocales: Language.values.map((e) => Locale(e.toString().split(".").last.toLowerCase())).toList(),
      // locale: languageState.locale,
      // localeResolutionCallback: (currentLang, supportedLang) {
      //   if (currentLang != null) {
      //     for (Locale local in supportedLang) {
      //       if (local.languageCode == currentLang.languageCode) {
      //         return currentLang;
      //       }
      //     }
      //   }
      //   return supportedLang.first;
      // },
    );
  }
}
