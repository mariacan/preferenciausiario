import 'package:flutter/material.dart';
import 'package:preferenciausiario/src/page/home_page.dart';
import 'package:preferenciausiario/src/page/setting_page.dart';
import 'package:preferenciausiario/src/share_prefs/preferencias_usuario.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final prefs = new PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Peferencias',
      initialRoute: prefs.ultimaPagina,
      routes: { //Rute_OBJETO
        HomePage.routeName     : (BuildContext context) => HomePage(),
        SettingsPage.routeName : (BuildContext context) => SettingsPage(),
      },
    );
  }
}
