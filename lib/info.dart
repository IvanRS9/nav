import 'package:flutter/material.dart';
import 'package:nav/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Info extends StatefulWidget {
  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> {
  late TextEditingController _value;

  @override
  void initState() {
    super.initState();
    _value = TextEditingController();
    _loadUser();
  }

  Future<void> _loadUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String storedValue = prefs.getString('_user') ?? '';
    _value.text = storedValue;
  }

  @override
  void dispose() {
    _value.dispose();
    super.dispose();
  }

  Future<void> _saveUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('_user', _value.text);
    ScaffoldMessenger.of(context)
        .showSnackBar(
          SnackBar(
            content: Text('Información guardada'),
            duration: Duration(seconds: 3),
          ),
        )
        .closed
        .then((SnackBarClosedReason reason) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Home()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(89, 158, 203, 1),
        title: const Text(
          "Información",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Información del usuario"),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                autofocus: true,
                controller: _value,
              ),
            ),
            ElevatedButton(
              onPressed: _saveUser,
              child: Text('Guardar'),
            ),
          ],
        ),
      ),
    );
  }
}
