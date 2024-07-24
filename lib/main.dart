import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hit_moments/app/core/config/app_config.dart';
import 'package:hit_moments/app/l10n/l10n.dart';
import 'package:hit_moments/app/providers/auth_provider.dart';
import 'package:hit_moments/app/providers/language_provider.dart';
import 'package:hit_moments/app/providers/moment_provider.dart';
import 'package:hit_moments/app/providers/providers_list.dart';
import 'package:hit_moments/app/providers/theme_provider.dart';
import 'package:hit_moments/app/providers/user_provider.dart';
import 'package:hit_moments/app/routes/app_pages.dart';
import 'package:hit_moments/app/routes/app_routes.dart';
import 'package:provider/provider.dart';

void main() async {
  await GetStorage.init('hit_moment');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final LocaleProvider locale = LocaleProvider();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 800),
        builder: (context, child) {
          return MultiProvider(
            providers: [
              ...listProviders.map((e) => ChangeNotifierProvider(create: (context) => e)),
              //không hiểu sao thêm MomentProvider vào cái là nó bị lỗi k tìm thấy
              //ThemeProvider nên e khai báo nó thẳng vào đây luôn ạ
              ChangeNotifierProvider(create: (context) => ThemeProvider()),
              ChangeNotifierProvider(create: (context) => AuthProvider()),
              ChangeNotifierProvider(create: (context) => MomentProvider()),
              //provider ngôn ngữ làm riêng
              ChangeNotifierProvider(
                create: (context) => locale,
              ), ChangeNotifierProvider(create: (context) => UserProvider())
            ],
            child: Consumer<LocaleProvider>(
              builder: (context, provider, child) {
                return MaterialApp(
                  title: AppConfig.appName,
                  locale: provider.locale,
                  debugShowCheckedModeBanner: false,
                  theme: Provider.of<ThemeProvider>(context).themeData,
                  initialRoute: AppRoutes.SPASH,
                  routes: AppPages.routes,
                  supportedLocales: L10n.all,
                  localizationsDelegates: const [
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                    AppLocalizations.delegate,
                  ],
                );
              },
            ),
          );
        });
  }
}
