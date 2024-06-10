import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
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
            Text("Bienvenido x"),
            ElevatedButton(
              onPressed: () async {
                Navigator.pop(context);
              },
              child: const Text("Salir"),
            )
          ],
        ),
      ),
    );
  }
}
