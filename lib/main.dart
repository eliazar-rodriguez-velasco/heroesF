import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:dcheroesf/SplashScreen.dart';
import 'package:dcheroesf/Heroesdc.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'Heroesdc.dart';

void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
    theme: ThemeData.dark(),
    debugShowCheckedModeBanner: false,
  ));
}

class Heroes {
  final String img;
  final String nombre;
  final String identidad_secreta;
  final String edad;
  final String altura;
  final String genero;
  final String descripcion;

  Heroes(this.img, this.nombre, this.identidad_secreta, this.edad, this.altura,
      this.genero, this.descripcion);
}

class HomePage extends StatefulWidget {
  @override
  homePageState createState() => new homePageState();
}

class homePageState extends State<HomePage> {
  Future<String> _loadAsset() async {
    return await rootBundle.loadString('assets/heroes');
  }

  Future<List<Heroes>> _getHeroes() async {
    String jsonString = await _loadAsset();
    var jsonData = jsonDecode(jsonString);

    List<Heroes> heroes = [];
    for (var x in jsonData) {
      Heroes he = Heroes(x["img"],
          x["nombre"],
          x["identidad_secreta"],
          x["edad"],
          x["altura"],
          x["genero"],
          x["descripcion"]);
      heroes.add(he);
    }
    return heroes;
  }

  String BS = "";
  bool _buscar = false;
  final Buc = TextEditingController();

  AudioPlayer injustice;
  AudioCache audioCache;

  final audioname = "IGA.mp3";

  @override
  void initState() {
    super.initState();

    injustice = AudioPlayer();
    audioCache = AudioCache();


    setState(() {
      audioCache.play(audioname);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: _buscar
            ? TextField(
                decoration: InputDecoration(
                    hintText: "Buscar",
                    icon: Icon(Icons.search)),
                onChanged: (value) {
                  setState(() {
                    BS = value;
                  });
                },
                controller: Buc,
              )
            : Text("DCHeroes"),
        actions: <Widget>[
          !_buscar
              ? IconButton(
                  icon: Icon(Icons.search,
                  color: Colors.cyan) ,
                  onPressed: () {
                    setState(() {
                      BS = "";
                      this._buscar = !this._buscar;
                    });
                  },
                )
              : IconButton(
                  icon: Icon(Icons.keyboard_return),
                  color: Colors.cyan,
                  onPressed: () {
                    setState(() {
                      this._buscar = !this._buscar;
                    });
                  },
                )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          child: FutureBuilder(
            future: _getHeroes(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Container(
                  child: Center(
                    child: Text("espere por favor"),
                  ),
                );
              } else {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return snapshot.data[index].nombre.contains(BS)
                        ? ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  snapshot.data[index].img.toString()),
                            ),
                            title: Text(snapshot.data[index].nombre
                                .toString()
                                .toUpperCase()),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          DCH(snapshot.data[index])));
                            },
                          )
                        : Container();
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
