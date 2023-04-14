import 'package:flutter/material.dart';
import 'package:tugas_pbm_pertemuan_6/page/login_page.dart';

List username = [];
List password = [];

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  RegisterPage createState() {
    return RegisterPage();
  }
}

class RegisterPage extends State<MyCustomForm> {
  // RegisterPage({super.key});
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
            Icon(
              Icons.person_add_alt_1_rounded,
              color: Colors.white,
              size: 45,
            ),
            Text(
              "Register",
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              width: 250,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextFormField(
                controller: _username,
                decoration: InputDecoration(
                    hintText: "Username", border: InputBorder.none),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Fill the Blank ';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              width: 250,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextFormField(
                controller: _password,
                decoration: InputDecoration(
                    hintText: "Password", border: InputBorder.none),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            MaterialButton(
              padding: EdgeInsets.all(10),
              minWidth: 200,
              color: Colors.blue,
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 500),
                child: Text(
                  "Register",
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
                username.add(_username.text);
                password.add(_password.text);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage(
                      username: username,
                      password: password,
                    ),
                  ),
                );
                Navigator.of(context).pushNamed("/login");
              },
            ),
            TextButton(
              child: Text("sudah punya akun?",
                  style: TextStyle(color: Colors.white)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage(
                      username: username,
                      password: password,
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
