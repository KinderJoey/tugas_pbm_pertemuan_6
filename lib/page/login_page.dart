import 'package:flutter/material.dart';
import 'package:tugas_pbm_pertemuan_6/page/register_page.dart';
import 'package:tugas_pbm_pertemuan_6/page/home_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key, required this.username, required this.password});
  final username;
  final password;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 66, 129, 224),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Icon(
                Icons.person,
                color: Colors.white,
                size: 45,
              ),
              Text(
                "login",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 5,
                ),
                child: TextField(
                  controller: _username,
                  decoration: InputDecoration(
                    labelText: "Username",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 5,
                ),
                child: TextField(
                  controller: _password,
                  decoration: InputDecoration(
                    labelText: "Password  ",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              MaterialButton(
                padding: EdgeInsets.all(10),
                minWidth: 200,
                color: Colors.blue,
                child: AnimatedSwitcher(
                  duration: Duration(milliseconds: 500),
                  child: Text(
                    "Login",
                    key: ValueKey<bool>(true),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  transitionBuilder: (child, animation) =>
                      ScaleTransition(child: child, scale: animation),
                ),
                onPressed: () {
                  if (_username.text.toString() != username[0].toString() ||
                      _password.text.toString() != password[0].toString()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('username atau password salah')),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(username: username),
                      ),
                    );
                  }
                },
              ),
              TextButton(
                child: Text(
                  "belum punya akun?",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyCustomForm()));
                },
              )
            ],
          ),
        ));
  }
}
