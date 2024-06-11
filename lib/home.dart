import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:nav/info.dart';
import 'package:nav/main.dart';

class Home extends StatelessWidget {
  String activeuser;

  Home({required this.activeuser});

  @override
  Widget build(BuildContext context) {
    final user = activeuser.toString;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(89, 158, 203, 1),
        title: const Text(
          "Dashboard",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Bienvenido " + activeuser.toString()),
            ElevatedButton(
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                await prefs.clear();

                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => MyApp()),
                    (Route route) => false);
              },
              child: const Text("Cerrar sesión"),
            ),
            ElevatedButton(
                onPressed: () async {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Info()));
                },
                child: const Text("Modificar usuario")),
            ElevatedButton(
                onPressed: () async {
                  final prefs = await SharedPreferences.getInstance();

                  prefs.clear();

                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => MyApp()));
                },
                child: const Text("Eliminar usuario")),
          ],
        ),
      ),
    );
  }
}
