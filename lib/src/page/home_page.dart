import 'package:flutter/material.dart';
import 'package:preferenciausiario/src/share_prefs/preferencias_usuario.dart';
import 'package:preferenciausiario/src/widgets/menu_widgets.dart';


class HomePage extends StatelessWidget {
  //Definir el nombre de la pagina(PROPIEDAD ESTÁTICA)
  static final String routeName = 'home';
  final prefs = new PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {
    prefs.ultimaPagina = HomePage.routeName;

    return Scaffold(
      appBar: AppBar(
        //AppBar INICIO
        title: Text('Preferencias'), //TITULO APP
        backgroundColor: (prefs.colorSecundario) ? Colors.amber : Colors.blue,
      ),
      drawer: MenuWidget(),
      body: Column(
        //CUERPO APP
        mainAxisAlignment: MainAxisAlignment.center, //Centrado
        children: <Widget>[
          //Contenido
          Text('Color secundario: ${prefs.colorSecundario}'),
          Divider(),

          Text('Género: ${prefs.genero}'),
          Divider(),

          Text('Nombre Usuario: ${prefs.nombreUsuario}'),
          Divider()
        ],
      ),
    );
  }

  /* Drawer _crearMenu(BuildContext context) {
    return Drawer(
      child: ListView(
        //LISTA
        padding: EdgeInsets.zero,
        children: <Widget>[
          //Hijo de la lista
          DrawerHeader(
            //Necesario tener un child
            child: Container(),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/menu-img.jpg'),
                    fit: BoxFit.cover)),
          ),
          //OPCIONES DEL MENU
          ListTile(
            leading: Icon(Icons.pages_rounded, color: Colors.blueAccent),
            title: Text('Home'),
            onTap: ()=> Navigator.pushReplacementNamed( //Nav2
                  context, HomePage.routeName ),
          ),
          ListTile(
            leading: Icon(Icons.party_mode_rounded, color: Colors.blueAccent),
            title: Text('Party Mode'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.people_alt_rounded, color: Colors.blueAccent),
            title: Text('People'),
            onTap: () {},
          ),
          ListTile(
              leading: Icon(Icons.settings, color: Colors.blueAccent),
              title: Text('Settings'),
              onTap: () {
               // Navigator.pop(context);//Nav1
                Navigator.pushReplacementNamed( //Nav2
                  context, SettingsPage.routeName);
              })
        ],
      ),
    );
    }*/

}
