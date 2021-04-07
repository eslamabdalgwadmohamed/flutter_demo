import 'package:flutter/cupertino.dart';
import 'package:mostadam_flutter/constants/AssetsConstants.dart';
import 'package:mostadam_flutter/tabs/view/TabPage.dart';

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SplashState();
}

class SplashState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration(milliseconds: 500),
        () => Navigator.pushReplacementNamed(context, TabPage.tabPageRoute));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(
        SPLASH_BG,
        fit: BoxFit.fill,
      ),
    );
  }
}
