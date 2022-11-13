import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:sendtoget/Ui/Screen/Home/ContactsScreen.dart';
import 'package:sendtoget/Ui/Screen/Splash/SplashScreen.dart';
import 'Data/Model/ThemeModel.dart';
import 'Ui/Screen/Home/HomeScreen.dart';
import 'Ui/Screen/Login/LoginScreen.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeModel>(
          create: (_) => ThemeModel(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return ChangeNotifierProvider(
      create: (BuildContext context) {},
      child: Consumer<ThemeModel>(
        builder: (context, ThemeModel themeNotifier, child) {
          return MaterialApp(
            theme: themeNotifier.isDark ? ThemeData.dark() : ThemeData.fallback(),
            debugShowCheckedModeBanner: false,
            initialRoute: '/',
            routes: {
              '/': (context) => const SplashScreen(),
              '/LoginScreen': (context) => const LoginScreen(),
              '/HomeScreen': (context) => const HomeScreen(),
              '/ContactsScreen': (context) => ContactsScreen(),
            },
          );
        },
      ),
    );
  }
}
