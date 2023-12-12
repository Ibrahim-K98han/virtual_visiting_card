import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:virtual_visiting_card/pages/contact_details_page.dart';
import 'package:virtual_visiting_card/pages/form_page.dart';
import 'package:virtual_visiting_card/pages/home_page.dart';
import 'package:virtual_visiting_card/pages/scan_page.dart';
import 'package:virtual_visiting_card/providers/contact_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ContactProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.blue[200],
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue.shade200,
          iconTheme: Theme.of(context).iconTheme.copyWith(color: Colors.white),
          actionsIconTheme: Theme.of(context).iconTheme.copyWith(
                color: Colors.black,
              ),
          titleTextStyle: const TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (context) => const HomePage(),
        ScanPage.routeName: (context) => const ScanPage(),
        FormPage.routeName: (context) => const FormPage(),
        ContactDetailsPage.routeName: (context) => const ContactDetailsPage(),
      },
    );
  }
}
