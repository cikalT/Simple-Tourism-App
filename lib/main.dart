import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tourism_app/views/home/home.dart';

import 'package:tourism_app/base/base_import.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.fadeIn,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('id'), Locale('en')],
      locale: Locale('id', 'ID'),
      fallbackLocale: Locale('en', 'US'),
      home: Home(),
      getPages: AppPages.routes,
    ),
  );
}
