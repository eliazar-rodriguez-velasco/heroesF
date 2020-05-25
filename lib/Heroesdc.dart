import 'package:flutter/material.dart';
import 'package:dcheroesf/main.dart';


class DCH extends StatelessWidget {
  final Heroes heroes;

  DCH(this.heroes);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(heroes.nombre.toString().toUpperCase()),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Center(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: NetworkImage(heroes.img)),
                      ),
                    ),
                    Center(
                      child: new Text(
                        heroes.identidad_secreta,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    Text(""),
                    Center(child: Text("EDAD: " + heroes.edad)),
                    Text(""),
                    Center(child: Text("ALTURA: " + heroes.altura)),
                    Text(""),
                    Center(child: Text("GENERO: " + heroes.genero)),
                    Text(""),
                    Center(child: Text(" DESCRIPCIÓN: ")),
                    Text(""),
                    Text(heroes.descripcion)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
