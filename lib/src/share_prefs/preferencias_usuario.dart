import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {
  static final PreferenciasUsuario _intancia =
      new PreferenciasUsuario._internal();

  factory PreferenciasUsuario() {
    return _intancia;
  }
  //Constructor
  PreferenciasUsuario._internal();

  late SharedPreferences _prefs;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

                    //GETERS AND SETERS
  //GET Y SET del GÉNERO
    int get  genero{
      return _prefs.getInt('genero') ?? 1;
    }
    set genero(int value){
     _prefs.setInt('genero', value);
    }
  //GET Y SET del COLOR SECUNDARIO
    bool get  colorSecundario{
      return _prefs.getBool('colorSecundario') ?? false;
    }
    set colorSecundario(bool value){
     _prefs.setBool('colorSecundario', value);
    } 
    //GET Y SET del nombreUsuario
    String get  nombreUsuario{
      return _prefs.getString('nombreUsuario') ?? '';
    }
    set nombreUsuario(String value){
     _prefs.setString('nombreUsuario', value);
    }
    //GET Y SET del última página
    String get  ultimaPagina{
      return _prefs.getString('ultimaPagina') ?? 'home';
    }
    set ultimaPagina(String value){
     _prefs.setString('ultimaPagina', value);
    }  
  }
  