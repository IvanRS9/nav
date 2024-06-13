import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:nav/home.dart';
import 'dart:js';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _user = "";
  String _pass = "";

  var _controllerusername = TextEditingController();
  var _controllerpassword = TextEditingController();

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _clearInputs() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(200),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          _user = value;
                        },
                        controller: _controllerusername,
                        autofocus: true,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.only(top: 20, bottom: 20),
                          hintText: "Usuario",
                        ),
                      ),
                      TextField(
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.text,
                        controller: _controllerpassword,
                        obscureText: true,
                        decoration: const InputDecoration(
                            contentPadding:
                                EdgeInsets.only(top: 20, bottom: 20),
                            hintText: "Contraseña"),
                        onChanged: (value) {
                          _pass = value;
                        },
                      ),
                    ],
                  )),
              // Alinear los botones en una fila
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        onPressed: () async {
                          final pref = await SharedPreferences.getInstance();

                          pref.setString('_user', _user);
                          pref.setBool('_session', true);

                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) => Home()));
                        },
                        child: const Text(
                          "Iniciar sesion",
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurpleAccent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                        )),
                    ElevatedButton(
                      onPressed: () async {
                        _controllerusername.clear();
                        _controllerpassword.clear();
                      },
                      child: const Text("Cancelar",
                          style: TextStyle(color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.redAccent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5))),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
