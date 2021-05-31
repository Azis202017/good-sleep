import 'package:flutter/material.dart';
import 'package:good_sleep/shared/shared.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'pages/pages.dart';
int? initialRoute = 0;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  initialRoute =  preferences.getInt('initialRoute');
  
  await preferences.setInt('initialRoute', 1);
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {

    
    return MaterialApp(
      home : initialRoute == 0 || initialRoute == null ? SleepStartedPage() : SleepHomePage() ,
      theme: ThemeData(
        textTheme: textTheme,
        buttonColor: mainColor,
        primaryColor: mainColor,

      ),
    );
  }
}