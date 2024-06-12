import 'package:flutter/material.dart';
import 'package:nav/info.dart';
import 'package:nav/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _usuario = '';

  @override
  void initState() {
    super.initState();
    _getUser();
  }

  Future<void> _getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _usuario = prefs.getString('_user') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(89, 158, 203, 1),
        title: const Text(
          "Inicio",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: Center(
          child: Column(
            children: <Widget>[
              Text('Bienvenido $_usuario'),
              ElevatedButton(
                  onPressed: () async {
                    final prefs = await SharedPreferences.getInstance();
                    prefs.clear();

                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyApp()));
                  },
                  child: Text("Cerrar Sesión")),
              ElevatedButton(
                  onPressed: () async {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Info()));
                  },
                  child: Text("Modificar"))
            ],
          ),
        ),
      ),
    );
  }
}
