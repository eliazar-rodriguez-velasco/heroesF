import 'package:dcheroesf/main.dart';
import 'package:dcheroesf/Heroesdc.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SplashScreen(
        title: Text(
          "Espere por favor",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),
        ),
        photoSize: 180,
        seconds: 7,
        backgroundColor: Colors.black54,
        image: Image.network(
            'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/51def5cd-3c9b-44f6-8052-6ada3ee4e9f7/d62ff8o-394563b9-32dc-40a4-a3ba-dce60c6ed455.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOiIsImlzcyI6InVybjphcHA6Iiwib2JqIjpbW3sicGF0aCI6IlwvZlwvNTFkZWY1Y2QtM2M5Yi00NGY2LTgwNTItNmFkYTNlZTRlOWY3XC9kNjJmZjhvLTM5NDU2M2I5LTMyZGMtNDBhNC1hM2JhLWRjZTYwYzZlZDQ1NS5wbmcifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6ZmlsZS5kb3dubG9hZCJdfQ.0kLJnCEsm0SMvusUzXAUL-OWv7tS2CAT_VlcHtz95zE'
                ),
        navigateAfterSeconds: HomePage());
  }
}
