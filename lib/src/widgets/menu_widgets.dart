import 'package:flutter/material.dart';

import 'package:preferenciausiario/src/page/home_page.dart';
import 'package:preferenciausiario/src/page/setting_page.dart';

class MenuWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                image: DecorationImage(   //IMAGEN MENU
                    image: AssetImage('assets/menu-img.jpg'),
                    fit: BoxFit.cover)),
          ),
          //OPCIONES DEL MENU
          ListTile(
            leading: Icon(Icons.pages_rounded, //icono
            color: Colors.blueAccent //color icono
            ),
            title: Text('Home'),
            onTap: ()=> Navigator.pushReplacementNamed( //Nav2
                  context, HomePage.routeName ),
          ),
          ListTile(
            leading: Icon(Icons.party_mode_rounded, //icono
            color: Colors.blueAccent  //color icono
            ),
            title: Text('Party Mode'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.people_alt_rounded, //icono
            color: Colors.blueAccent//color icono
            ),
            title: Text('People'),
            onTap: () {},
          ),
          ListTile(
              leading: Icon(Icons.settings, //icono
              color: Colors.blueAccent //color icono
              ),
              title: Text('Settings'),
              onTap: () {
               // Navigator.pop(context);//Nav1
                Navigator.pushReplacementNamed( //Nav2
                  context, SettingsPage.routeName);
              })
        ],
      ),
    );
  }
}