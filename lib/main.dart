import 'package:expense_tracker/common/constants.dart';
import 'package:expense_tracker/data/notifiers.dart';
import 'package:expense_tracker/widgets/expenses.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((
  //   fn,
  // ) {
  //   runApp(MyApp());
  // });

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isDarkMode,
      builder: (context, value, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          darkTheme: Constants.mainDarkTheme,
          theme: Constants.mainTheme,
          themeMode: value == true ? ThemeMode.dark : ThemeMode.light,
          home: Expenses(),
        );
      },
    );
  }
}
