// Form bugluh uciraas stateful widget ashiglana

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _phoneCtrl = TextEditingController();
  final _passCtrl = TextEditingController();

  void _onSubmit() {
    if (_formKey.currentState!.validate()) {
      print("Amjilttai");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 60, vertical: 50),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Let's sign you in.",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Welcome back.",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
                Text(
                  "You've been missed.",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: _phoneCtrl,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Хоосон байж болохгүй";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: Colors.white.withOpacity(0.5),
                          width: 1,
                        )),
                    labelStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                    label: Text("Утасны дугаар"),
                  ),
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _passCtrl,
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Хоосон байж болохгүй";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
                      labelStyle:
                          TextStyle(color: Colors.white.withOpacity(0.5)),
                      label: Text("Нууц үг")),
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: double.infinity,
              height: 70,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  foregroundColor: MaterialStateProperty.all(Colors.black),
                  // backgroundColor: Colors.white,
                ),
                onPressed: _onSubmit,
                child: Text("Нэврэх"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
