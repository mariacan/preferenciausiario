import 'package:flutter/material.dart';
import 'package:preferenciausiario/src/share_prefs/preferencias_usuario.dart';
import 'package:preferenciausiario/src/widgets/menu_widgets.dart';
//import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  //Definir el nombre de la pagina(PROPIEDAD ESTÁTICA)
  static final String routeName = 'settings';

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool? _colorSecundario;
  int? _genero;
  String _nombre = 'Maria';

  late TextEditingController _textController;
  final prefs = new PreferenciasUsuario();

  @override
  void initSatate() {
    super.initState();  // cargarPref();
    prefs.ultimaPagina = SettingsPage.routeName;
    _genero = prefs.genero;
    _colorSecundario = prefs.colorSecundario;
    _textController = new TextEditingController(text: prefs.nombreUsuario);
  }
  /*cargarPref() async {
     SharedPreferences prefs = await SharedPreferences.getInstance();
     
     _genero = prefs.getInt('genero');
     setState(() {});
  }*/

  void _setSelectedRadio(int? valor) /*async*/ {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    //prefs.setInt('genero', valor!.toInt());
    prefs.genero = valor!;
    _genero = valor;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //AppBar INICIO
          title: Text('Ajustes'),
          backgroundColor:
              (prefs.colorSecundario) ? Colors.amber : Colors.blue, //TITULO APP
        ),
        drawer: MenuWidget(),
        body: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(5.0),
              child: Text('Settings',
                  style:
                      TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold) //
                  ),
            ),
            Divider(),
            SwitchListTile(
              //SWITCH
              value: _colorSecundario!, //ACTIVO INACTIVO
              title: Text('Color secundario'),
              onChanged: (value) {
                setState(() {
                  _colorSecundario = value;
                  prefs.colorSecundario = value;
                }); //Redibujarlo
              },
            ),
            RadioListTile(
                value: 1,
                title: Text('Masculino'),
                groupValue: _genero,
                onChanged: _setSelectedRadio
            ),
            RadioListTile(
                value: 2,
                title: Text('Femenino'),
                groupValue: _genero,
                onChanged: _setSelectedRadio
            ),
            Divider(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                controller: _textController,
                decoration: InputDecoration(
                  labelText: 'Nombre', //Parte de arriba
                  helperText: 'Nombre de quien usa el teléfono',
                ),
                onChanged: (value) {
                  prefs.nombreUsuario = value;
                },
              ),
            )
            //
          ],
        ) //
        );
  }
}
